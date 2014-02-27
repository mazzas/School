%% Homework VII
% Problem 11.3.12
%

clc; clear all; close all;

syms x;

fun = @(x) x.*exp(-x.^3);
fprintf('\nOriginal integral: %f\n',integral(fun,0,inf));
fprintf('Value of Gamma funciton: %f\n\n',1/3*gamma(2/3));

%% Problem 11.9.1
%

clc; clear all; close all;

syms x;

x = -5:0.1:5;
y = exp(-x.^2);
plot(x,y);
title('Problem 11.9.1');
xlabel('X');
ylabel('e^{-x^2}');