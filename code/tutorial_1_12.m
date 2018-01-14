%% Tutorial
% 12/1/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang
% Group 17

close all; clear all;
%%

x0 = [0 0]';
tspan = [0 100];

[t, x] = ode45(@(t, x) MassSpringDamper(t, x, heaviside(t)-heaviside(t-0.2), 10, 2, 1), tspan, x0);
plot(t, x(:, 1));