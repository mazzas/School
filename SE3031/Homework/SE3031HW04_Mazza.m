%% Homework 04 - Steve Mazza
%% Problem 1
%
close all;
clc;
clear all;

p_fun = '3*x*sin(x)-2*x';

% Plot the function
fplot(p_fun,[-2*pi 2*pi]);
hold on;

% Compute the derivative by hand
%pd_fun = polyder(p_fun);
pd_fun = '3*sin(x)+3*cos(x)-2'; 

% Add the derivative to the same plot
fplot(pd_fun,[-2*pi 2*pi],'--');

% Provide title, axis labels, and legend
title('3xsin(x)-2x');
xlabel('x');
ylabel('y');

% Use fzero() to find all zeros of the drivative at -4, -2, 0, 2, 4.
f_zero = zeros(1,5);
f_zero(1) = fzero(pd_fun,-4);
f_zero(2) = fzero(pd_fun,-2);
f_zero(3) = fzero(pd_fun,0);
f_zero(4) = fzero(pd_fun,2);
f_zero(5) = fzero(pd_fun,4);

% Add zeros to the plot as markers
for i=1:5
    x = f_zero(i);
    y = 3*sin(x)+3*cos(x)-2;
    plot(x,y,'rx');
end


%% Problem 2
%
close all;
clc;
clear all;

syms x y;

% Add 8-mile visibility line
plot(y=8);

%% Problem 3
%
close all;
clc;
clear all;

%% Problem 4
%
close all;
clc;
clear all;
