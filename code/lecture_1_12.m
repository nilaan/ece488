%% Lecture
% 12/1/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang
% Group 17

clear all;
close all;

%%
syms th thd thdd T

tspan = [0 10];

x = [th; thd];
u = T;

x0 = [0; 0];
xbar = [0; 0];
ubar = [0];

n = length(x); % states
m = length(u); % inputs

%State Functions
f_eq = thdd+thd+sin(th) == T;
f(1) = thd;

f(2) = solve(f_eq, thdd);
u_t = @(t) (heaviside(t)-heaviside(t-0.5));

[t1, x1] = ode45(@(t1, x1) nonLinearFunc(f, x, x1, u, u_t(t1), t1), tspan, x0);
figure, plot(t1, x1(:, 1));

%Linearlize
A = subs(jacobian(f, x), x, xbar);
B = subs(jacobian(f, u), u, ubar);

A_t = double(A);
B_t = double(B);

[t2, x2] = ode45(@(t2, x2)A_t*x2+B_t*u_t(t2), tspan, x0);
figure, plot(t2, x2(:, 1));



