%% Homework 09 - Steve Mazza
%% Problem 1
%
clc; clear all; close all;

% Symbolic variables.
syms h f_i f_iminus1 f_iminus2 f_pr f_2pr f_3pr;

% Equations for 3 points.
eq1 = -f_iminus1+f_i-h*f_pr+h^2*f_2pr/2-h^3*f_3pr/6;
eq2 = -f_iminus2+f_i-2*h*f_pr+(2*h)^2*f_2pr/2-(2*h)^3*f_3pr/6;

% Solve the equations.
sol = solve(eq1,eq2,f_pr,f_2pr);

% Show the result.
r = simplify(sol.f_pr);
pretty(r)

%% Problem 2
%
clc; clear all; close all;

t = [ 0 2 4 6 8 10 ];
D = [ 0 10 50 150 330 610 ];

% Determine velocity with diff().
V_d = diff(D);

% Determine velocity with gradient().
V_g = gradient(D);

% Determine acceleration with diff().
V2_d = diff(D,2);

% Calculate dt for t=4 and t=6 using 4-point centered diff. approx.
dt_4 = (-330+8*150-8*10+0)/(12*2);
dt_6 = (-610+8*330-8*50+10)/(12*2);

% Calculate ddt for t=4 and t=6 using 3-point centered diff. approx.
ddt_4 = (150 - 2*50 + 10) / 2^2;
ddt_6 = (330 - 2*150 + 50) / 2^2;

% Show everything (just for fun).
plot(t,D,'-.',t(2:end),diff(D),'--',t,gradient(D),':', ...
    t(3:end),diff(D,2),'-');
hold on;
title('Homework 9, Problem 2');
xlabel('time');
ylabel('f(t)');
legend('raw data','speed(diff)','speed(grad)','acceleration',0);

%% Problem 3
%
clc; clear all; close all;

%% Problem 4
%
clc; clear all; close all;
