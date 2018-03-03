%% Lecture
% 26/2/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;
clc;

%% State Feedback Controller
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

ev = eig(A);
n = rank(ctrb(A, B)); %% Controllable Check
m = rank(obsv(A, C)); %% Observable Check

K = place(A, B, [-2, -8, -10, -16]);

F = place(A', C', [-2, -4, -6, -8])';

A_n = [A -B*K;
       F*C A-F*C-B*K;];
B_n = [B; B;];
C_n = [C -D*K];
D_n = D;

%% Only State Feedback
A_new = A - B*K;
sys = ss(A_new, B, C, D);
x0 = [0 0 0 0];
tF = 5;
t = 0:0.1:5;
v = [ones(1, tF/0.1+1); ones(1, tF/0.1+1);];
[y, t, x] = lsim(sys, v, t, x0);

figure, plot(t, y), title('Only State Feedback');

%% Simulated Combined System, No error in Observer
sys = ss(A_n, B_n, C_n, D_n);

x0 = [0 0 0 0 0 0 0 0];
tF = 5;
t = 0:0.1:5;
v = [ones(1, tF/0.1+1); ones(1, tF/0.1+1);];
[y, t, x] = lsim(sys, v, t, x0);

figure, plot(t, y), title('Combined, No Error in Observer');

%% Simulated Combined System, Error present in Observer
x0 = [0 0 0 0 1 1 1 1];
tF = 5;
t = 0:0.1:5;
v = [ones(1, tF/0.1+1); ones(1, tF/0.1+1);];
[y, t, x] = lsim(sys, v, t, x0);

figure, plot(t, y), title('Combined, Error in Observer');

