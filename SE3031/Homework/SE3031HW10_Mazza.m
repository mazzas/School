%% Homework 10 - Steve Mazza

%% Problem 3
clc; clear all; close all; warning off;

open('SE3031HW10_sim_Mazza.slx')
sim('SE3031HW10_sim_Mazza.slx', [0 9])

plot(y,tout);
grid;
xlabel('Time');
ylabel('Y');