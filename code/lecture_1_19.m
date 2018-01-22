%% Lecture
% 19/1/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;

%%

A = [-2 1; 
     0 -2];
B = [0; 1];
C = [1 1];

x0 = [0; 0];
t0 = 0;
tF = 5;
deltaT = 0.1;

u_t = @(t)heaviside(t);
F = @(x, t) A*x+B*u_t(t);
i = 1;
x = zeros(2, 1);
x(:, 1) = F(x0, t0);
t(i) = t0;

while (t < tF)
    K1 = F(x(:, i), t(i));
    K2 = F(x(:, i)+0.5*deltaT*K1, t(i)+0.5*deltaT);
    K3 = F(x(:, i)+0.5*deltaT*K2, t(i)+0.5*deltaT);
    K4 = F(x(:, i)+deltaT*K3, t(i)+deltaT);
    x(:, i+1) = x(:, i)+deltaT/6*(K1+2*K2+2*K3+K4);
    t(i+1) = t(i)+deltaT;
    i = i+1;
end

y = C*x;
figure, plot(t, y);
y_t  = @(t) 1/4*exp(-2*t)*(-2*t+exp(2*t)-1)+1/2-exp(-2*t)/2;
%y_t = @(t) 3/4-t/2*exp(-2*t)-3/4*exp(-2*t);
i = 1;
yvec = y_t(t0);
tvec = t0;
for t1 = t0:0.01:tF
    yvec(i) = y_t(t1);
    tvec(i) = t1;
    i = i+1;
end
figure, plot(tvec, yvec);



    