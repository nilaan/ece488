%% Tutorial 1
% 5/1/18
% Nilaan Gunabalachandran 20509203
% Group 18
clear all; close all;

s = tf('s');
P = 10/(s*s+10*s);
figure, bode(P);

%Critical
Kp = 10;
Kd = 1;
C = Kp+s*Kd;

G = feedback(P*C, 1);
figure, step(G);
figure, bode(G);

%Underdamped
Kp = 5;
Kd = 1;
C2 = Kp+s*Kd;

G2 = feedback(P*C2, 1);
figure, step(G2);
figure, bode(G2);

%Overdamped
Kp = 40;
Kd = 1;
C3 = Kp+s*Kd;

G3 = feedback(P*C3, 1);
figure, step(G3);
figure, bode(G3);

