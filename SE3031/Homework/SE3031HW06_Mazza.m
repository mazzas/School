%% Homework 06 - Steve Mazza
%% Problem 1
close all; clc; clear all;

% a)
fprintf('\n\nDouble precision solution is accurate within %d.\n', ...
    eps(9460730472580800));
fprintf('Single precision solution is accurate within %d.\n', ...
    eps(single(9460730472580800)));

% b)
A = realmax('single');
B = eps(realmax('single'))/2;
fprintf('\n\n  A: %38.0f\n',A);
fprintf('  B: %38.0f\n',B);
fprintf('A-B: %38.0f\n',A-B);

%% Problem 2
close all; clc; clear all;

% Estimate 0 with sin().
sin(4*pi)

% Estimate number of Taylor series expansions are needed to achieve above.
X = [ 1, 40 ];
for i = 1:40
    X(i) = -1^i * (4*pi^(2*i - 1))/factorial(2*i - 1);
end

figure;
subplot(2,1,1);
plot(X);
hold on;
line([0,40],[sin(4*pi),sin(4*pi)],'Color','red');
axis([0,40,-25,5]);
subplot(2,1,2);
plot(X);
hold on;
line([0,40],[sin(4*pi),sin(4*pi)],'Color','red');
axis([3,10,-5,1]);
%% Problem 3
close all; clc; clear all;

%a)
fprintf('\n\nProblem A:\n');
A = [ 6 -3 4; 12 5 -7; -5 2 6 ];
b = [ 41; -26; 14 ];
% UL factorization.
x = linsolve(A,b)
% Direct solution.
x = A\b
% Determinant of A.
s = det(A);
% Solution using LU decomposition.
[ R jb ] = rref([ A b ]);
% Pivot variables.
p = x(jb);
% Rank.
r = length(jb);
r = rank(A);
fprintf('Matrix rank: %d\nMatrix determinant: %.0f.\n', r, s);

%b)
fprintf('\n\nProblem B:\n');
A = [ 0 0 3 5; 3 7 -4 5; 5 -6 7 8; 0 4 0 5 ];
b = [ 17; 5; 45; 9 ];
% UL factorization.
x = linsolve(A,b)
% Direct solution.
x = A\b
% Determinant of A.
s = det(A);
% Solution using LU decomposition.
[ R jb ] = rref([ A b ]);
% Pivot variables.
p = x(jb);
% Rank.
r = length(jb);
r = rank(A);
fprintf('Matrix rank: %d\nMatrix determinant: %.0f.\n', r, s);

%c)
fprintf('\n\nProblem C:\n');
A = [ 16 2 3 13; 5 11 10 8; 9 7 6 12; 25 27 28 22 ];
b = [ 41; -26; 14; -64 ];
% UL factorization (does not work in this case).
x = linsolve(A,b)
% Direct solution (does not work in this case).
x = A\b
% Determinant of A.
s = det(A);
% Solution using LU decomposition.
[ R jb ] = rref([ A b ]);
% Pivot variables.
p = x(jb);
% Rank.
r = length(jb);
r = rank(A);
fprintf('Matrix rank: %d\nMatrix determinant: %.0f.\n', r, s);

%% Problem 4
close all; clc; clear all;

% Set up system of linear equations.
% f1 = f3 + 100 - 200 -> f1 - f3 = -100
% f2 = f1 - f4 + 300  -> f2 - f1 + f4 = 300
% f3 = f6 + 300 - 300 -> f3 - f6 = 0
% f4 = f1 - f2 + 300  -> f4 - f1 + f2 = 300
% f5 = 400 + 200 - f7 -> f5 + f7 = 600
% f6 = f4 + f7 - 200  -> f6 - f4 - f7 = -200
% f7 = 400 + 200 - f5 -> f7 + f5 = 600

% Set up matrix of equiations
A = [ 1 0 -1 0 0 0 0;
    -1 1 0 1 0 0 0;
    0 0 1 0 0 -1 0;
    -1 1 0 1 0 0 0;
    0 0 0 0 1 0 1;
    0 0 0 -1 0 1 -1;
    0 0 0 0 1 0 1];
b = [ -100; 300; 0; 300; 600; -200; 600 ];

% Try to find solutions.
% Determinant of A.
s = det(A);
% Solution using LU decomposition.
[ R jb ] = rref([ A b ]);
% UL factorization (does not work in this case).
x = linsolve(R(1:5, 1:7),R(1:5, 8:8))
% Pivot variables.
p = x(jb);
% Rank.
r = length(jb);
r = rank(A);
fprintf('Matrix rank: %d\nMatrix determinant: %.0f.\n', r, s);

% NOTE: it is not possible to solve this system of equations; the number
% of independent variables is 7, while the rank is 5.
