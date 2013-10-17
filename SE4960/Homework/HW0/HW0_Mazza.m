%% Homework 0
%% Problem 1
%
close all
clc
clear all

number_fixed = 0;   % mutex to test user input
p = 0.6;            % comparison number (given)

% Initialize the random number generator.
rng('shuffle');

% Get a positive integer from the user.
array_length = input('\nEnter a positive integer: ');

% Fix the pathological case.
if ~exist(array_length,'var')
    array_length = 0;
end

% Make sure it is a positive integer.
if array_length < 1 || array_length - floor(array_length) > 0
    % If not, try to fix it.
    array_length = floor(abs(array_length));
    number_fixed = 1;
end

% Make sure the value is not zero.
if array_length == 0
    array_length = randi(1000);
    number_fixed = 1;
end

if number_fixed
    fprintf('\tNice try!  Let us use: %d...\n',array_length);
end

% Create and initialize the vector.
our_vector = rand([1,array_length]);

% Replace elements with 0 or 1 based on comparison with p.
for i = 1:array_length
    if our_vector(i) >= p
        our_vector(i) = 1;
    else
        our_vector(i) = 0;
    end
end

fprintf('\tThe numbers in our array were greater than %.1f %d times.\n'...
    ,p,sum(our_vector));

% Requisite use of disp().
disp_msg = ':)';
disp(disp_msg);

%% Problem 2
%
close all
clc
clear all

% Initialize the random number generator.
rng('shuffle');

% Create a vector of 1000 uniformly distributed integers between 0 and 50.
uniform_vector = randi([0,50],1,1000);

% Plot poisson_vector.
subplot(3,1,1);
hist(uniform_vector,50)
title('Normal Distribution');
xlabel('value');
ylabel('number of occurrences');

% Create a vector of 2500 Poisson-distributed integers, with mean value 50.
poisson_vector = poissrnd(50,1,2500);

% Plot poisson_vector.
subplot(3,1,2);
hist(poisson_vector,max(poisson_vector)-min(poisson_vector));
title('Poisson Distribution');
xlabel('value');
ylabel('number of occurrences');

% Load vector from file: test_data.mat
load('test_data.mat');

% Plot mydata.
subplot(3,1,3);
hist(mydata);
title('MyData');
xlabel('value');
ylabel('number of occurrences');

%% Problem 3
% Completed.
%
