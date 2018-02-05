%% Lecture
% 26/1/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;

%%

t = 0:0.01:10;
u = sin(10*t);
s = tf('s');
P = 1/(s*(s+0.1));

Kp = 100;
Kd = 1;

C = Kd*s+Kp;

L = P*C;

S = 1/(1+P*C);
T = P*C/(1+P*C);

figure, bode(S);
figure, bode(T);

figure, lsim(T, u, t);




