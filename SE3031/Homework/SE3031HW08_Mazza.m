%% Homework 08 - Steve Mazza
%% Problem 1
%
clc; clear all; close all; warning off;

xd = [2 4 6 7];
yd = [12 15 17 25];

% Compute least squares regressions.
[p0,s0] = polyfit(xd,yd,0);
[p1,s1] = polyfit(xd,yd,1);
[p2,s2] = polyfit(xd,yd,2);
[p3,s3] = polyfit(xd,yd,3);

% Estimate coefficient of determination for R^2.
St=std(yd)^2*(3);
Rsq1=(St-s1.normr^2)/St;
Rsq2=(St-s2.normr^2)/St;
Rsq3=(St-s3.normr^2)/St;

% Plot the results along with the original data.
hold on; 
plot(xd,polyval(p0,xd),':');
plot(xd,polyval(p1,xd),'-.');
plot(xd,polyval(p2,xd),'--');
plot(xd,polyval(p3,xd),'-');
title('Homework 8, Problem 1');
xlabel('x');
ylabel('f(x)');
legend('linear','1st order','2nd order','3rd order', ... 
    'Location', 'NorthWest');
plot(xd,yd,'ro');
text(2.25,20,strcat('R^2_1 = ',num2str(Rsq1)));
text(2.25,19,strcat('R^2_2 = ',num2str(Rsq2)));
text(2.25,18,strcat('R^2_3 = ',num2str(Rsq3)));

%% Problem 2
%
clc; clear all; close all; warning off;

%% Problem 3
%
clc; clear all; close all; warning off;

%% Problem 4
%
clc; clear all; close all; warning off;
