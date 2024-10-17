# Real-Time LDR Data Acquisition and Analysis with MATLAB and Arduino

This repository contains a MATLAB script that interfaces with an Arduino to perform real-time data acquisition from a Light-Dependent Resistor (LDR). The script reads voltage values from the LDR, calculates the resistance, applies a moving average filter, classifies the light intensity, and plots the resistance and voltage over time.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Hardware Requirements](#hardware-requirements)
- [Software Requirements](#software-requirements)
- [Circuit Setup](#circuit-setup)
- [Installation](#installation)
- [Usage](#usage)

## Introduction

This project demonstrates how to use MATLAB in conjunction with an Arduino to monitor and analyze light intensity using an LDR. It showcases real-time data acquisition, processing, and visualization, making it a valuable resource for learning about sensor integration, data smoothing techniques, and real-time plotting in MATLAB.

## Features

- **Real-Time Data Acquisition:** Reads voltage from the LDR via the Arduino.
- **Resistance Calculation:** Computes the LDR resistance using the voltage divider formula.
- **Data Smoothing:** Applies a moving average filter to smooth out resistance readings.
- **Classification:** Categorizes light intensity as "High" or "Low" based on a threshold.
- **Real-Time Visualization:** Plots resistance and voltage over time with live updates.
- **Console Output:** Prints readings and classifications to the MATLAB Command Window.

## Hardware Requirements

- **Arduino Board** (e.g., Arduino Uno)
- **Light-Dependent Resistor (LDR)**
- **Fixed Resistor:** 10 kΩ (10,000 ohms)
- **Breadboard and Jumper Wires**
- **USB Cable** for Arduino connection

## Software Requirements

- **MATLAB** (with the Arduino Support Package installed)
- **Arduino IDE** (for initial setup if required)

## Circuit Setup

Connect the components as shown in the schematic below:

- **LDR and Fixed Resistor Configuration:**
  - Connect one end of the LDR to the 5V pin on the Arduino.
  - Connect the other end of the LDR to the analog pin **A0**.
  - Connect one end of the fixed resistor (10 kΩ) to the analog pin **A0**.
  - Connect the other end of the fixed resistor to **GND** on the Arduino.

This creates a voltage divider where the voltage at A0 varies with light intensity.

<img width="415" alt="Screenshot 2024-10-17 at 4 28 13 AM" src="https://github.com/user-attachments/assets/e9d3c8e8-76df-47c7-a111-886783ec98f0">


## Installation

1. **Install MATLAB Arduino Support Package:**

   - Open MATLAB.
   - Go to **Home > Add-Ons > Get Hardware Support Packages**.
   - Install the **MATLAB Support Package for Arduino Hardware**.

2. **Ensure Arduino is Set Up:**

   - Connect your Arduino board to your computer via USB.
   - Install drivers if necessary (usually done via the Arduino IDE).

## Usage

1. **Connect the Circuit:**

   - Assemble the circuit as described in the [Circuit Setup](#circuit-setup) section.

2. **Run the MATLAB Script:**

   - Open the MATLAB script `LDR_Final.m` in MATLAB.
   - Run the script.

3. **Observe the Output:**

   - The script will display real-time plots of resistance and voltage.
   - It will also print readings and classifications in the Command Window.

