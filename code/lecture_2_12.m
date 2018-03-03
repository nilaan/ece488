%% Lecture
% 12/2/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;

%%

A = [4 -2 1; 9 -5 2; 1 -2 0;];
B = [0; 1; 3;];

eig = place(A, B, [-2.001, -2, 2.00001]);