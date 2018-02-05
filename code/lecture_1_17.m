%% Lecture
% 17/1/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;

%%

A = [1 0 0;
     0 3 -4;
     0 1 -1;];

 
A = A+rand(3); 
[ev, evec] = eig(A);


