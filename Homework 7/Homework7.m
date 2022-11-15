clear all
close all
clc

% Given Variables
gamma = [0 0.05 0.1 0.2];
angle_launch = 40;
speed_launch = 180;
t_span = [0,25];

% Initial Conditions
x10 = 0;
x20 = speed_launch *cosd(angle_launch);
y10 = 0;
y20 = speed_launch*sind(angle_launch);

test0 = [x10 y10 x20 y20];

% Compute given function
test_total = @(x,y,gamma) [y(3);y(4);-gamma*(sqrt(y(3)^2 + y(4)^2))*y(3);-gamma*(sqrt(y(3)^2 + y(4)^2))*y(4)-9.81];

% Plot four gamma values
[x1,y1] = ode45(test_total,t_span,test0,[],gamma(1));
plot(x1,y1(:,2));
hold on
[x2,y2] = ode45(test_total,t_span,test0,[],gamma(2));
plot(x2,y2(:,2));
hold on 
[x3,y3] = ode45(test_total,t_span,test0,[],gamma(3));
plot(x3,y3(:,2));
hold on
[x4,y4] = ode45(test_total,t_span,test0,[],gamma(4));
plot(x4,y4(:,2));
hold on

% Making the plot pretty
ylim([0 inf])
legend('Gamma = 0', 'Gamma = 0.05', 'Gamma = 0.1', 'Gamma = 0.2')
xlabel('Time (s)')
ylabel('Distance (m)')
title('Projectile Calculation')


