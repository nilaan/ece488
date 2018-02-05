%% Lecture
% 26/1/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;

%%

s = tf('s');

P = 100/((s+1)*(s-2)*(s+4));

[A, B, C, D] = ssdata(P);

K = place(A, B, [-3, -4, -20]);
F = place(A', C', [-3, -4, -20]);
F = F';

xp = ss(A-F*C, -F, -K, 0);
np = ss(A-B*K, B, -C-D*K, D);
yp = ss(A-F*C, -B+F*D, -K, 1);
dp = ss(A-B*K, B, -K, 1);

r = 1/(s+1);
C_s = (xp+r*dp)/(yp-r*np);

step(feedback(C_s*P, 1), 10);



