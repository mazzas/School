%% Homework 02 - Steve Mazza
%% Problem 1
% In wolframalpha.com: 38+(120-38)e^(-0.45*t) for t=0..3
close all
clc
clear all

% declare variables prior to use
Tf = 0;         % result
Tc = 38;        % temperature of the closed container
Ti = 120;       % temperature of the soda at t=0
k = 0.45;       % constant (given)
t = 3;          % duration of experiment

% output result to user
Tf = Tc + (Ti - Tc) * exp(-k * t);
fprintf('\nThe temperature of the soda after %d hours is %f degrees F.\n', t, Tf);

%% Problem 2
%
close all
clc
clear all

% user configurable variables.
DEBUG = 0;              % used for testing purposes
mat_max_value = 30;     % maximum value of the matrix
mat_dim = 5;            % size fo the matrix

% create 5x5 random square matrix with maximum value of 30
R = randi(mat_max_value, mat_dim);
if (DEBUG)
    disp(R)
end

% find and zero all elements > 20.
R(find(R > 20)) = 0;
if (DEBUG)
    disp(R)
end

% find and zero all remaining even numbers.
R(find(mod(R,2) == 0)) = 0;
if (DEBUG)
    disp(R)
end

% find the largest remaining element(s) and print their indices
% NOTE: my method fails to find multiple matching values, only returning
%       the first.
% Start by finding the latgest value of the matrix (converted to a vector).
[max_value, max_value_index] = max(R(:));
% Now convert the index to a row/column value pair.
[i,j] = ind2sub(size(R),max_value_index);
fprintf('\nThe largest value remaining in R (%d) is located at (%d,%d).\n', max_value,i,j);

%% Problem 3
%
close all
clc
clear all

% user configurable variables
t = 17;         % number of years
P = 5000;       % principal
r = 0.085;      % annual interest rate
n = 1;          % number of times per year interest is compounded

% First, calclate the balance of the 2nd account after 17 years.
B = P * (1+(r/n))^(n*t);
fprintf('\nThe balance of the 2nd account after %d years is: $%.2f\n', t,B);

% Now change our compounding from yearly to monthly.
n = 12;

% Next we use the time value of money to find t given present and future
%       value.
t = (log(B/P))/(log(1+(r/n)))/12;

% Convert t from a decimal value to years/months.
years = fix(t);
months = ceil((t - years) * 12);

% Output result to user.
fprintf('The balance of the 1st account will reach $%.2f in %d years and %d months.\n', B,years,months);

%% Problem 4
%
close all
clc
clear all
