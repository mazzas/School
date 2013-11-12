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
