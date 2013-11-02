%% Homework 06 - Steve Mazza
%% Problem 1
close all; clc; clear all;

% a)
% double precision.
eps(9460730472580800)
% single precision.
eps(single(9460730472580800))

% b)
A = eps(realmax('single'));
B = eps(realmax('single')/2);
fprintf('\n\nA: %38.0f\n',A);
fprintf('B: %38.0f\n',B);
fprintf('A-B: %38.0f\n',A-B);

%% Problem 2
close all; clc; clear all;

% Estimate 0 with sin().
sin(4*pi);

% Estimate number of Taylor series expansions are needed to achieve above.
X = [ 1, 40 ];
for i = 1:40
    X(i) = -1^i * (4*pi^(2*i - 1))/factorial(2*i - 1);
end

plot(X);
hold on;
line([0,40],[sin(4*pi),sin(4*pi)],'Color','red');
axis equal;
%% Problem 3
close all; clc; clear all;

%% Problem 4
close all; clc; clear all;
