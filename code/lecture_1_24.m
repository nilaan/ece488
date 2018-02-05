%% Lecture
% 24/1/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;

%%

s = tf('s');

G = 0.1/(s+10);
bode(G); % Verify |G(jw)| < 1

delta1 = 0.9;
alpha = 0.5;
delta2 = 0.9*alpha/(s+alpha);
T_d = 0.5;
delta3 = 0.9*exp(-s*T_d);

TF1 = feedback(G, delta1);
TF2 = feedback(G, delta2);
TF3 = feedback(G, delta3);

figure, step(TF1);
figure, step(TF2);
figure, step(TF3);

[num1, den1] = tfdata(TF1, 'v');
[num2, den2] = tfdata(TF2, 'v');

figure, nyquist1(num1, den1);
figure, nyquist1(num2, den2);




