%% Lecture
% 5/1/18
% Nilaan Gunabalachandran 20509203
% Group 18
clear all; close all;

s = tf('s');

G11 = 10/((s+1)*s);
G22 = 10/((s+1)*s);
G12 = 1/(s*(s+100));
G21 = 1/(s*(s+100));

Kp = 10;
Kd = 1;
%PD Controller
C = Kp+s*Kd;

TF1 = feedback(G11*C, 1);
figure, step(TF1);
figure, bode(TF1);

%% multi system
P11 = 10/((s+1)*s);
P22 = 10/((s+1)*s);
P12 = 1/(s*(s+100));
P21 = 1/(s*(s+100));
C1 = Kp+s*Kd;
C2 = Kp+s*Kd;

TF_r1_y2 = (C1*P21/(1+C2*P22)-C1*P21*C1*P11/(1+(C1*P11)))/(1+C2*P12*C1*P21);
TF_r2_y2 = (C2*P22/(1+C2*P22)+C1*P21*C2*P12/(1+(C1*P11)))/(1+C2*P12*C1*P21);
