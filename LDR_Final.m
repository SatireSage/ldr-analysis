% Establish connection to Arduino
a = arduino();

% Define parameters
analogPin = 'A0';            % Analog pin to which the LDR is connected
V_supply = 5;                % Supply voltage in volts
R_fixed = 10000;             % Fixed resistor value in ohms (10kΩ)
threshold = 15000;           % Resistance threshold for High/Low classification in ohms
windowSize = 5;              % Size of the moving average window for smoothing
numReadings = 100;           % Number of readings to take
dt = 0.1;                    % Time between readings in seconds

% Initialize variables
resistanceValues = zeros(1, numReadings);
voltageValues = zeros(1, numReadings);
timeValues = (0:numReadings-1) * dt;

% Create figures for real-time plotting
figure;

% Resistance Plot
subplot(2,1,1);
hResistancePlot = plot(NaN, NaN, 'DisplayName', 'Resistance');
title('Resistance of Photoresistor (LDR) Over Time');
xlabel('Time (s)');
ylabel('Resistance (Ohms)');
grid on;
legend('show');

% Voltage Plot
subplot(2,1,2);
hVoltagePlot = plot(NaN, NaN, 'DisplayName', 'Voltage');
title('Voltage Across Photoresistor Over Time');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;
legend('show');

% Read, calculate, and update in real-time
for i = 1:numReadings
    % Read analog voltage from LDR circuit
    V_out = readVoltage(a, analogPin);
    
    % Calculate resistance
    R_LDR = R_fixed * (V_supply / V_out - 1);
    
    % Store values
    voltageValues(i) = V_out;
    resistanceValues(i) = R_LDR;
    
    % Calculate moving average
    if i >= windowSize
        smoothedResistance = mean(resistanceValues(i-windowSize+1:i));
    else
        smoothedResistance = mean(resistanceValues(1:i));
    end
    
    % Classification
    classification = "Low";
    if smoothedResistance > threshold
        classification = "High";
    end
    
    % Update plots
    set(hResistancePlot, 'XData', timeValues(1:i), 'YData', resistanceValues(1:i));
    set(hVoltagePlot, 'XData', timeValues(1:i), 'YData', voltageValues(1:i));
    drawnow;
    
    % Print current values
    fprintf('Reading %d: Time = %.1f s, Voltage = %.2f V, Resistance = %.2f Ohms, Classification: %s\n', ...
        i, timeValues(i), V_out, smoothedResistance, classification);
    
    % Pause between readings
    pause(dt);
end
