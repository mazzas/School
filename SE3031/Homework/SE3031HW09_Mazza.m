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

% Define data sets.
x = [ 0 1 2 3 4 5 6 7 8 9 ];                        % days
y = [ .33 .24 .17 .12 .09 .06 .04 .03 .02 .01 ];    % failure desnity

% Calculate probability of failure.
F_t = zeros(1,numel(x)-1);
for i = 2:numel(x)
    F_t(i-1) = trapz(x(1:i),y(1:i));
end

% Calculate reliability.
R_t = 1-F_t;

% Plot some data.
subplot(3,1,1);
plot(x,y,'-');
title('Days vs. Failure Density');
xlabel('days');
ylabel('failure density');

subplot(3,1,2);
plot(x(1:end-1),F_t,'-');
title('Days vs. Failure Probability');
xlabel('days');
ylabel('failure probability');

subplot(3,1,3);
plot(x(1:end-1),R_t,'-');
title('Days vs. Reliability');
xlabel('days');
ylabel('reliabilty');

% Determine the probability of survival on the interval 2..6 days.
fprintf(strcat('\n\nThe probability of survival for at least 2 days, ', ...
    '\n\tbut not more than 6 days is %1.4f.\n'), trapz(x(3:7),y(3:7)));

%% Problem 4
%
clc; clear all; close all;
syms x y z;

% Define anonymous functions.
f2 = @(x,y) (x.^2-3.*y.^2+x.*y.^3);
f3 = @(x,y,z) (x.^3-2.*y.*z);

% Calculate double integral.
q2 = integral2(f2,0,4,-2,2);

% Calculate triple integral.
q3 = integral3(f3,-1,3,0,6,-4,4);

% Plot the double integral.
z = zeros(4);
for i = 1:4
    for j = -1:2
        z(i,j+2) = integral2(f2,0,i,-2,j);
    end
end
meshz(z);
