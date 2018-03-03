%% Lecture
% 14/2/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;
clc;

%%We did sent the A and B matrices to the other group (we created a
%%question for them).


A = [-2 0 1;
     1 0 -1;
     0 1 -1];
 
B = [1 0 0]';
C = [1 1 0];

eig(A);
rank(ctrb(A, B)); % Check controllability... IT IS!


Ac = [ 0 1 0;
       0 0 1;
      -1 -3 -3];
Bc = [0 0 1]';

T = [0 -1 -1;
     1 0 0;
     0 -1 -2];


K_bar = [7 9 3];
Q = [A*A*B A*B B];
Q_bar = [Ac*Ac*Bc Ac*Bc Bc];
P = Q_bar*inv(Q);
K = K_bar*P;


A_new = A - B*K;
D = [0];
sys = ss(A_new, B, C, D);
step(sys)


