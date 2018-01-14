%% Lecture
% 10/1/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang
% Group 17

close all; clear all;

%% Lead-Lag Controller Design 

s = tf('s');

K = 500;
P = 1/((s+1)*(s+5)*(s+10));

figure, bode(K*P);
margin(K*P);

phase_max = 68.4;
alpha = (1+sind(phase_max))/(1-sind(phase_max));
new_gain = 10*log(alpha);

w_c = 20;
alpha = 1.9;
tau_1 = 1/(w_c*sqrt(alpha));

tau_2 = alpha*alpha*10*tau_1;

C = K*(s+1/(alpha*tau_1))*(s+alpha/tau_2)/((s+1/tau_1)*(s+1/tau_2));


T = feedback(C*P, 1);
t = 0:0.1:25;
u = t;
[y, t, x] = lsim(T, u, t);

figure, plot(t, y, 'b', t, u, 'm');

figure, bode(T);
margin(T);