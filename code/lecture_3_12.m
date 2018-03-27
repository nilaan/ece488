%% Lecture
% 12/3/18
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
D = zeros(2);

%% Sys 1
Q = [1 0 0 0;
     0 1 0 0;
     0 0 1 0;
     0 0 0 1;];
 
R = [1 0;
     0 1;];
 
[K, P, eig] = lqr(A, B, Q, R);

sys = ss(A-B*K, B, C, D);

x0 = [1 1 1 1];
tF = 5;
t = 0:0.1:5;
v = [zeros(1, tF/0.1+1); zeros(1, tF/0.1+1);];
[y, t, x] = lsim(sys, v, t, x0);
figure, plot(t, x), title('System 1 - X');
figure, plot(t, -K*x'), title('System 1 - U');

%% Sys 2

Q = [2 0 0 0;
     0 2 0 0;
     0 0 4 0;
     0 0 0 4;];
 
R = [1 0;
     0 1;];
 
[K, P, eig] = lqr(A, B, Q, R);

sys = ss(A-B*K, B, C, D);

x0 = [1 1 1 1];
tF = 5;
t = 0:0.1:5;
v = [zeros(1, tF/0.1+1); zeros(1, tF/0.1+1);];
[y, t, x] = lsim(sys, v, t, x0);
figure, plot(t, x), title('System 2 - X');
figure, plot(t, -K*x'), title('System 2 - U');

%% Sys 3

Q = [1 0 0 0;
     0 1 0 0;
     0 0 1 0;
     0 0 0 1;];
 
R = [4 0;
     0 1;];
 
[K, P, eig] = lqr(A, B, Q, R);

sys = ss(A-B*K, B, C, D);

x0 = [1 1 1 1];
tF = 5;
t = 0:0.1:5;
v = [zeros(1, tF/0.1+1); zeros(1, tF/0.1+1);];
[y, t, x] = lsim(sys, v, t, x0);
figure, plot(t, x), title('System 3 - X');
figure, plot(t, -K*x'), title('System 3 - U');


%% With Regulator

% A_aug = [A zeros(4, 2);
%          C zeros(2, 2);];
%      
% B_aug = [B; zeros(2, 2);];
% 
% r = rank(ctrb(A_aug, B_aug)); %Controllable
% 
% Q = eye(6);
% R = eye(2);
% n = length(A);
% 
% [K, P, eig] = lqr(A_aug, B_aug, Q, R);
% 
% K1 = K(:, 1:n);
% K2 = K(:, n+1:length(K));
% 
% 
% A_n = [A-B*K1 -B*K2;
%        C zeros(2,2);];
% B_n = [zeros(4, 2); -eye(2,2);];
% C_n = [C zeros(2, 2)];
% 
% sys = ss(A_n, B_n, C_n, 0);
% 
% x0 = [1 1 1 1 1 1];
% tF = 5;
% t = 0:0.1:5;
% v = [zeros(1, tF/0.1+1); zeros(1, tF/0.1+1);];
% [y, t, x] = lsim(sys, v, t, x0);
% 
% figure, plot(t, x), title('System 1');
% hold on
% plot(t, -K*x'), title('System 1');
