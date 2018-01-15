%% Lecture
% 15/1/18
% Nilaan Gunabalachandran 20509203
% Alex Mitterhauser 20531736
% Bo Wang 20446175
% Group 17

clear all;
close all;

%%
A = [1 0 1 2 3;
     1 1 0 3 3;
     2 -1 3 3 6;];
Q = orth(A);
Z = null(A, 'r');

A2 = [2 1 0 -1;
      1 0 -1 -2;
      -1 -1 -1 -1;];
Q2 = orth(A2);
Z2 = null(A2, 'r');

%% Deliverable
%% No Solution
y = [2; 1;];
A = [2 2 2;
     3 3 3;];
if (rank([y A]) > rank(A))
    disp('No Solution');
end

%% Infinite Solution

y = [3; 4;];
A = [3 1 3;
     1 3 4;];
if (rank([y A]) == rank(A))
    disp('Infinte Solution');
end


%% One Solution
% Becuase zeros are not to be used, a single soltuion is not possible,
% becuase otherwise a linear possible combination of the matrix Ax can give
% y. A has a max rank of 2, while y has a rank of 1 and as the matrix can
% only be 2x3, any additional dependent column vectors will only lead to
% varied solutions. 
