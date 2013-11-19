%% Homework 03 - Steve Mazza
%% Problem 1
%
close all;
clc;
clear all;

%% Problem 2
%
close all;
clc;
clear all;

% Listen up: here's the plan...
% 1) Read in the data set
% 2) Build an adjacency matrix (possibly simultaneously)
% 3) Call graphSpecs_Mazza.m
% 4) Determine node degree probability distribution.
% 5) Plot the distribution on log-log scale.

% Read data in from an external file.
[Speed, Altitude] = textread('DropSondeData.txt',...
    '%*f %*f %*f %*f %*f %f %*f %*f %*f %f %*d','headerlines',15);

% Sort the data in ascending order by Altitude.
% Defult sorting is on 1st column, ascending.
DSData = sortrows([Altitude,Speed]);

