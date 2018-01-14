%% Lecture
% 8/1/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser
% Bo Wang
% Group 17
clear all; close all;

s = tf('s');
P = 10/(s*(s+2));

figure, nyquist(P);

figure, nyquist1(P);

%% Using RL against RH solution

K = 1;

den = s^4+3*s^3+6*s^2+s;
G = 2/den;
den = roots([1 3 6 1 0]);
rlocus(G);

%Max Bound of K is 0.947 (by zooming into RL)
%RH solution says 0.944