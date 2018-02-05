 %% Project
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;

%% Part 1
syms T1 T2 q1 q1d q1dd q2 q2d q2dd t

g = 9.81;
m1 = 1;
m2 = 1;
l1 = 1;
l2 = 1;
c1 = 1;
c2 = 1;

params = [m1 m2 l1 l2 c1 c2];

f_eq(1) = T1 == (m1*l1^2/3+m2*l2^2/12+m2*(l1^2+l2^2/4+l1*l2*cos(q2)))*q1dd ...
    +(m2*l2^2/3+m2*l1*l2/2*cos(q2))*q2dd-m2*l1*l2*sin(q2)*q1d*q2d ...
    -m2*l1*l2*sin(q2)/2*q2d^2+(m1*l1/2+m2*l1)*g*cos(q1)+m2*l2/2*g*cos(q1+q2)+c1*q1d;
f_eq(2) = T2 == (m2*l2^2/3+m2*l1*l2/2*cos(q2))*q1dd+m2*l2^2/3*q2dd+m2*l1*l2*sin(q2)/2*q1d^2 ...
    +m2*l2/2*g*cos(q1+q2)+c2*q2d;

%% State Functions
x = [q1; q1d; q2; q2d];
n = length(x);
u = [T1; T2];

xbar = [-pi/2; 0; 0; 0];

ubar = [0; 0];

x0 = [0; 0; 0; 0];

tspan = [0 30];

[f_q1dd, f_q2dd] = solve(f_eq, [q1dd q2dd]);

f(1) = q1d; % == q1d
f(2) = f_q1dd; % == q1dd
f(3) = q2d; % == q2d
f(4) = f_q2dd; % == q2dd

% u_t = @(t) [heaviside(t)-heaviside(t-0.1); 0];
%u_t = @(t) [0; 0];

Kp_11 = 250;
Kd_12 = 3;
Kp_13 = 0;
Kd_14 = 0;
Kp_21 = 0;
Kd_22 = 0;
Kp_23 = 10;
Kd_24 = 5;
C = [Kp_11 Kd_12 Kp_13 Kd_14; Kp_21 Kd_22 Kp_23 Kd_24];

r = @(t)[0.25*(heaviside(t)); 0; 0; 0;];
u_t = @(t, x) -C*(x-r(t));

%% Simulate Non Linear

% [t1, x1] = ode45(@(t1, x1) nonLinearFunc(f, x, x1, u, u_t(t1, x1), t1), tspan, x0);
% figure, plot(t1, x1(:, 1)), xlabel('Time'), ylabel('Q1');
% figure, plot(t1, x1(:, 3)), xlabel('Time'), ylabel('Q2');

%% Linearize
A = subs(jacobian(f, x), [x; u], [xbar; ubar]);
B = subs(jacobian(f, u), [x; u], [xbar; ubar]);

A_t = double(A);
B_t = double(B);

%% Simulate
[t2, x2] = ode45(@(t2, x2)A_t*x2+B_t*u_t(t2, x2), tspan, x0);
figure, plot(t2, x2(:, 1)), xlabel('Time'), ylabel('Q1');
figure, plot(t2, x2(:, 3)), xlabel('Time'), ylabel('Q2');

% visualize(params, t2, x2(:, 1), x2(:, 3), '');

%% Analytic Solution
% 
% C = [1 0 0 0; 0 0 1 0];
% 
% s = tf('s');
% 
% T_fun = C*inv(s*eye(n)-A_t)*B_t;

% Z = tzero(T_fun);
% P = pole(T_fun);



