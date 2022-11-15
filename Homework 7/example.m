%quick exercise to integrate equations of pendulum motion
clear all 
close all
%set the initial conditions
Y10=0.5; %displacement in radians
Y20=0;  %angular velocity in radians / sec
%set the domain range
xspan=[0,4];
%create vector of initial conditions
Y0=[Y10 Y20];

%constants
p=[9.81 1]; %gravity (m/s2) and length (m)
% Tested discreet function
test = @(x,y,p) [y(2); -p(1)/p(2)*y(1)]
%solve it! 
[x,y]=ode45(test,xspan,Y0,[],p);
figure(1)
plot(x,y)
grid on
xlabel('t');ylabel('y1 and y2');legend('y1','y2')