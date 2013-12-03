%% Homework 08 - Steve Mazza
%% Problem 1
%
clc; clear all; close all;

xd = [2 4 6 7];
yd = [12 15 17 25];
xf = linspace(min(xd),max(xd));

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
plot(xf,polyval(p0,xf),':');
plot(xf,polyval(p1,xf),'-.');
plot(xf,polyval(p2,xf),'--');
plot(xf,polyval(p3,xf),'-');
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
clc; clear all; close all;

%xd = [-20 0 20 40 60 80 100 120];
xk = [253.15 273.15 293.15 313.15 333.15 353.15 373.15 393.15];
yd = [4 0.38 0.095 0.032 0.015 0.0078 0.0045 0.0032];
xf = linspace(min(xk),max(xk));

% Define the function.
%f = @(u

% Plot u=f(T).
subplot(3,1,1);
plot(xk,yd,'ro');
hold on;
[p,s] = polyfit(xk,yd,1);
plot(xk,polyval(p,xk));
title('Fitting Curve');
xlabel('Temperature (Kelvin)');
ylabel('Viscosity');

% Find the quadratic regression.
subplot(3,1,2);
plot(xk,yd,'ro');
hold on;
[p,s] = polyfit(xk,yd,2);
plot(xf,polyval(p,xf));
title('Quadratic Fit');
xlabel('Temperature (Kelvin)');
ylabel('Viscosity');
legend('Data points','Regression',0);

% Plot the residuals.
subplot(3,1,3);
hold on;
bar(xk,yd-p(1)*xk-p(2));
xlim([min(xk) max(xk)]);
title('Residuals');
xlabel('Temperature (Celsius)');
ylabel('ln(y)-ln(y_{est})');

%% Problem 3
%
clc; clear all; close all;

xd = [0 1 2 10 50 100];
yd = [100 45 39 22 5 0.5];

% Plot u=f(T).
subplot(3,1,1);
plot(xd,yd,'ro');
hold on;
title('Linear Interpolation');
xlabel('Depth');
ylabel('Light Penetration');
xq = linspace(min(xd),max(xd));
yy = interp1(xd,yd,xq);
plot(xq,yy,'-.');
plot(30,yy(30),'kd');
%text(32,0,num2str(yy(30)/polyval(p,30)));

subplot(3,1,2);
plot(xd,yd,'ro');
hold on;
title('Spline Interpolation');
xlabel('Depth');
ylabel('Light Penetration');
yy = interp1(xd,yd,xq,'spline');
plot(xq,yy,'-.');
plot(30,yy(30),'kd');
%text(32,10,num2str(yy/s(30)));

subplot(3,1,3);
plot(xd,yd,'ro');
hold on;
title('Cubic Hermite Interpolation');
xlabel('Depth');
ylabel('Light Penetration');
yy = interp1(xd,yd,xq,'cubic');
plot(xq,yy,'-.');
plot(30,yy(30),'kd');
%text(32,20,num2str(yy/s(30)));

%% Problem 4
%
clc; clear all; close all;

formatIn = 'dd-mmm-yyyy';

xdate = [datenum('01-May-2013',formatIn) datenum('29-May-2013',formatIn)...
    datenum('26-Jun-2013',formatIn) datenum('24-Jul-2013',formatIn)];
ysunrise = [4*60+59 4*60+34 4*60+32 4*60+50];
ysunset = [18*60+53 19*60+19 19*60+32 18*60+21];

[psunrise, ssunrise] = polyfit(xdate,ysunrise,3);
[psunset,ssunset] = polyfit(xdate,ysunset,3);

% Calculate sunset on the 4th of July.
jfour = datenum('04-Jul-2013',formatIn);
jfoursunsettime = polyval(psunset,jfour);
jfoursunsethour = floor(jfoursunsettime/60);
jfoursunsetminute = rem(fix(jfoursunsettime),60);
fprintf('\n\nSunset on July 4th should be %d hr %d min.\n', ...
    jfoursunsethour,jfoursunsetminute);

% Calculate date and time of earliest sunrise.
x = min(xdate):1:max(xdate);
yallsunrises = polyval(psunrise,x);
earliestsunrisetime = min(yallsunrises);
earliestsunrisetimehour = floor(earliestsunrisetime/60);
earliestsunrisetimeminute = rem(fix(earliestsunrisetime),60);
earliestsunrisedate = ...
    datestr(x(find(yallsunrises==earliestsunrisetime)));
fprintf('The earliest sunrise occurs on %s at %d hr %d min.\n', ...
    earliestsunrisedate,earliestsunrisetimehour,earliestsunrisetimeminute);

% Calculate date and length of the longest day.
yallsunsets = polyval(psunset,x);
alldaylengths = yallsunsets - yallsunrises;
longestday = max(alldaylengths);
longestdayhour = floor(longestday/60);
longestdayminute = rem(fix(longestday),60);
longestdaydate = datestr(x(find(alldaylengths == longestday)));
fprintf('The longest day occurs on %s and lasts %d hr %d min.\n', ...
    longestdaydate,longestdayhour,longestdayminute);
