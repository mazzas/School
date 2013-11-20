%% Homework 03 - Steve Mazza
%% Homework 2, Problem 2
%
close all;
clc;
clear all;

% Read data in from an external file.
% dataset = 'netscience.mat';                 % name of the dataset
% dataset = 'EPA.mat';                        % name of the dataset
dataset = 'California.mat';                 % name of the dataset
load( dataset, 'Problem');
A_sparse = getfield( Problem, 'A' );        % adjacency stored as sparse matrix
A = full(A_sparse);                         % convert to full square matrix

% Call graphSpecs_Mazza.m
[ D, L, adj_list, d_bar, diam ] = graphSpecs_Mazza( A );

% Determine node degree probability distribution.
C = unique(D);
C = [C; zeros(1, numel(C))];

% Tally counts of entries in D.
for i = 1:numel(D)
    j = find(C(1,:) == D(i));
    C(2,j) = C(2,j) + 1;
end

% Normalize the values in C.
pk = C(2,:) ./ numel(D);

% Plot the distribution on log-log scale.
loglog(pk, '-s');
grid on;
xlabel('Degree Distribution');
ylabel('Degree Probability');