function u_star = smoothLogLaw(u,y)

% von Karman constant
k = 0.4
% Kinematic viscosity of water in cm^2s^-1
v = 0.01

u_star = k/(u*log(y*u_star/v)

