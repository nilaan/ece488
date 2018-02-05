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

blist = [0.1, 0.5, 1];

for i = 1:length(blist)
    b = blist(i);
    a = b+3;
    Kd = 3+a*b;
    Kp = 1;

    P = 1/(s*(s-b));

    C = (Kd*s+Kp)/(s+a);

    sys = P*C/(1+P*C);
    figure, step(sys);
end

