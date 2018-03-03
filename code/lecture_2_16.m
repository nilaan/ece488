%% Lecture
% 16/2/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;
clc;

% Place poles at -5 and -6
A = [0 1;
     -2 -2];
B = [1 0]';
C = [1 0];
F = place(A', C', [-5 -6])';

%% Lecture task
% Part 1: Find T
A = [0 0 -1;
     -1 0 0;
     3 -1 -3];
B = [0 0 1]';
C = [0 1 0];

Abar = [0 0 -1;
        1 0 -3;
        0 1 -3];

Cbar = [0 0 1];

%Check observability
obsv(A, C);
R = [C; C*A; C*A*A];
Rbar = [Cbar; Cbar*Abar; Cbar*Abar*Abar];

T = inv(Rbar)*R

% Part 2: design estimator at ev -2
% Using place just as a reference to see if our F is close
Fbar = place(A', C', [-2 -2.001 -2.003])';
F = inv(T)*Fbar;
F = [0; 3; 2];

Anew = [A zeros(3,3);
        F*C A-F*C];
Bnew = [B; B];
Cnew = [C [0 0 0]];
Dnew = [0];
sys = ss(Anew, Bnew, Cnew, Dnew);
%step(sys);
x0 = [0 0 0 1 1 1];
t = 0:0.1:10;
u = ones(1,101);
[y, t, x] = lsim(sys, u, t, x0);
%plot(t, y);
hold on;
plot(t, x(:,6) - x(:,3));
plot(t, x(:,5) - x(:,2));
plot(t, x(:,4) - x(:,1));
