%% Homework 10 - Steve Mazza
%% Problem 2
% I wanted to solve this first so that I had a reference for Problem 3.

close all; clc; clear all;
% Rewrite as a system of 1st ODE.
% z1 = y
% z2 = y'
% z3 = y''
% z4 = y'''

% So...
% z1' = z2
% z2' = z3
% z3' = z4
% z4' + 5(1 - z1)z4 + 2z3 + 3z2 + z1^3 = 10sin(Pi t)

[T,Y] = ode45(@rigid,[0 9],[0]);
plot(T,Y(:,1),'-',T,Y(:,2),'-.',T,Y(:,3),'.',T,Y(:,4),':')

%% Problem 3
