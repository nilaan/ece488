%% Lecture
% 5/3/18
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
 
A_aug = [A zeros(4, 2);
         C zeros(2, 2);];
     
B_aug = [B; zeros(2, 2);];

r = rank(ctrb(A_aug, B_aug)); %Controllable
m = rank(obsv(A, C)); %Observable

n = size(A);

K = place(A_aug, B_aug, [-3.5, -4.5, -3, -4, -5, -6]);
K1 = K(:, 1:n);
K2 = K(:, n+1:length(K));

F = place(A', C', [-1, -2, -1.5, -2.5])';

An = [A -B*K1 -B*K2;
      F*C A-F*C-B*K1 -B*K2;
      C zeros(2, 4) zeros(2);];
Bn = [zeros(8,2) ; -eye(2);];

Cn = [ C zeros(2, 6)];


sys = ss(An, Bn, Cn, 0);

x0 = [0 0 0 0 0 0 0 0 0 0];
tF = 5;
t = 0:0.1:5;
v = [ones(1, tF/0.1+1); ones(1, tF/0.1+1);];
[y, t, x] = lsim(sys, v, t, x0);

figure, plot(t, y);