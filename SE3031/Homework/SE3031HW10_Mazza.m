%% Homework 10 - Steve Mazza
%% Problem 1
%

%% Problem 2
%

%% Problem 3
clc; clear all; close all; warning off;

open('SE3031HW10_sim_Mazza.slx')
sim('SE3031HW10_sim_Mazza.slx', [0 9])

% NOTE: You are supposed to plot y versus vdot.
plot(y,tout);
grid;
xlabel('Time');
ylabel('Y');
