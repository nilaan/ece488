 %% Lecture
% 14/3/18
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
 
poles1 = [-4, -4.2, -4.4, -4.6];
poles2 = [-10, -10.1, -10.2, -10.3];

K = place(A, B, poles1);
F = place(A', C', poles2)';

a = 0.1;

n = a.*randn(4, 101);
w = a.*randn(2, 101);

An = [A -B*K;
      F*C A-F*C-B*K;];
Bn = [eye(4) zeros(4,2) B;
      zeros(4,4) F B;];
Cn = [C zeros(2,4)];
Dn = [zeros(2,4) eye(2) zeros(2,2)];

sys = ss(An, Bn, Cn, Dn);

x0 = [1 1 1 1 1 1 1 1];
tF = 10;
t = 0:0.1:tF;
u = [n; w; zeros(2, tF/0.1+1);];
[y, t, x] = lsim(sys, u, t, x0);

figure, plot(t,y);

%% Kalman Filter

Q = [0.01 0.005 0 0.005;
     0.005 0.01 0.005 0;
     0 0.005 0.01 0.005;
     0.005 0 0.005 0.01;];
R = [0.01 0.005;
     0.005 0.01;];

[F, P, eig] = lqr(A', C', Q, R);

F = F';

An = [A -B*K;
      F*C A-F*C-B*K;];
Bn = [eye(4) zeros(4,2) B;
      zeros(4,4) F B;];
Cn = [C zeros(2,4)];
Dn = [zeros(2,4) eye(2) zeros(2,2)];

sys = ss(An, Bn, Cn, Dn);

x0 = [1 1 1 1 1 1 1 1];
tF = 10;
t = 0:0.1:tF;
u = [n; w; zeros(2, tF/0.1+1);];
[y, t, x] = lsim(sys, u, t, x0);

figure, plot(t,y);


