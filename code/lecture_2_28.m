%% Lecture
% 28/2/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;
clc;

%% 

A = [0 1 0 0;
     0 0 1 0;
     -3 1 2 3;
     2 1 0 0;];
B = [0 0;
     0 0;
     1 2;
     0 2;];
C = [1 0 0 0;
     0 0 0 1;];
 
D = [0 0;
     0 0;];
 
n = length(A);

ev = eig(A);
%n = rank(ctrb(A, B)); %% Controllable Check
m = rank(obsv(A, C)); %% Observable Check

%K = place(A, B, [-2, -8, -10, -16]);

A_aug = [A zeros(4, 2);
         C zeros(2, 2);];
     
B_aug = [B; zeros(2, 2);];

r = rank(ctrb(A_aug, B_aug)); %Controllable

K = place(A_aug, B_aug, [-1, -2, -3, -4, -5, -6]);
K1 = K(:, 1:n);
K2 = K(:, n+1:length(K));


A_n = [A-B*K1 -B*K2;
       C zeros(2,2);];
B_n = [zeros(4, 2); -eye(2,2);];
C_n = [C zeros(2, 2)];

sys = ss(A_n, B_n, C_n, 0);

x0 = [0 0 0 0 0 0];
tF = 5;
t = 0:0.1:5;
v = [ones(1, tF/0.1+1); ones(1, tF/0.1+1);];
[y, t, x] = lsim(sys, v, t, x0);

figure, plot(t, y);

