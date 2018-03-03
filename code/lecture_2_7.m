%% Lecture
% 7/2/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;

%%
s = tf('s');

P11 = 1/(s*(s+1));
P12 = 1/(s*(s+10));
P21 = 1/(s*(s+10)); 
P22 = 1/(s*(s+1));



%% 

P = [P11 P12; P21 P22;];
W = [100/99 -10/99; -10/99 100/99;];
poles = [-0.5, -1, -5];
for i = 1:length(poles)
    pole = -poles(i);
    Kp = pole*pole;
    Kd = 2*pole-1;

    C11 = Kp+Kd*s/(0.01*s+1);
    C12 = 0;
    C21 = 0;
    C22 = Kp+Kd*s/(0.01*s+1);
    C = [C11 C12; C21 C22;];

    sys = feedback(P*C, eye(2));
    % with Decoupling matrix
    sys2 = feedback(P*W*C, eye(2));
    
    titleName = strcat('Pole at: ', num2str(poles(i)));
    figure, step(sys, sys2), title(titleName), legend('Without Decoupling', 'With Decoupling');
    figure, bode(sys, sys2), title(titleName), legend('Without Decoupling', 'With Decoupling');
end






