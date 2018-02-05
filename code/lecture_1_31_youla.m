%% Youla Param
%% Lecture
% 31/1/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;

%%
s = tf('s');

b = 20; %Unstable Pole

P = 1/(s*(s-b));

[A, B, C, D] = ssdata(P);

K = place(A, B, [-3, -20]);
F = place(A', C', [-3, -20]);
F = F';

xp = ss(A-F*C, -F, -K, 0);
np = ss(A-B*K, B, -C-D*K, D);
yp = ss(A-F*C, -B+F*D, -K, 1);
dp = ss(A-B*K, B, -K, 1);

rlist = [1/(s+1), 10/(s+10), 5/((s+3)*(s+5)*(s+100))];
for i = 1:length(rlist)
    r = rlist(i);
    C_s = (xp+r*dp)/(yp-r*np);
    figure, step(feedback(C_s*P, 1), 10);
end