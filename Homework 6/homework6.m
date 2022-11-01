close all
clear all
clc

% Given values for problem
% Vertical coordinate m in cm
y = [0.073 0.44 0.81 1.19 1.56 1.93 2.3 2.67 3.04]
% Streamwise velocity in cm/s
u = [57.12 75.78 83.77 89.58 94.16 97.99 100.81 102.13 102.62]
% von Karman constant
k = 0.4
% Kinematic viscosity of water in cm^2s^-1
v = 0.01

figure('Name','Smooth Log Law')
plot(u,y,'*')
title('Smooth Log Law')
xlabel('Streamwise Velocity (cm/s)')
ylabel('Vertical Coordinate (cm)')