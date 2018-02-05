%% Lecture
% 5/2/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;

%%
s = tf('s');

Kd = 2;
Kp = 36;

P = 1/(s*(s+10));
C = Kd*s+Kp;

T_d_list = [0.05, 0.1, 0.2];
for i = 1:length(T_d_list)  
    T_d = T_d_list(i);

    T_delay = (1-T_d*s/2)/(1+T_d*s/2);
    T_f = feedback(P*C*T_delay, 1);
    L = P*C*T_delay;
    figure, bode(L/(1+L), 1/(1+L));
    figure, step(T_f);
end

% %% Unstable Pole in Plant
% b = 0.1;
% a = b+3;
% Kd = 3+a*b;
% Kp = 1;
% 
% P = 1/(s*(s-b));
% C = (Kd*s+Kp)/(s+a);
% T_d = 0.5;
% T_delay = (1-T_d*s/2)/(1+T_d*s/2);
% 
% sys = P*C*T_delay/(1+P*C*T_delay);
% figure, step(sys);


