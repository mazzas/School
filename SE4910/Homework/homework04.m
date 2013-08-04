%% Homework 7, Problem 1, a
clear all
s = tf('s');
num = [1];
den = [1 0 0 0];
rlocus(num,den)
axis equal
sgrid

%% Homework 7, Problem 1, b
clear all
s = tf('s');
num = [1 2 0];
den = [1 2 1];
rlocus(num,den)
axis equal
sgrid

%% Homework 7, Problem 1, c
clear all
s = tf('s');
num = [1 1];
den = [1 -1 0];
rlocus(num,den)
axis equal
sgrid

%% Homework 7, Problem 1, d
clear all
s = tf('s');
num = [1];
den = [1 2 2 0];
rlocus(num,den)
axis equal
sgrid

%% Homework 7, Problem 1, e
clear all
s = tf('s');
num = [1];
den = [1 3 4 2 0];
rlocus(num,den)
axis equal
sgrid

%% Homework 7, Problem 1, f
clear all
s = tf('s');
num = [1 2 2 ];
den = [1 5 6 0];
rlocus(num,den)
axis equal
sgrid

%% Homework 7, Problem 1, g
clear all
s = tf('s');
num = [1 2 0];
den = [1 2 2];
rlocus(num,den)
axis equal
sgrid

%% Homework 7, Problem 1, h
clear all
s = tf('s');
num = [1 0];
den = [1 -1 0 2];
rlocus(num,den)
axis equal
sgrid

%% Homework 7, Problem 1, i
clear all
s = tf('s');
num = [1 2];
den = [1 5 8 6 0];
rlocus(num,den)
axis equal
sgrid

%% Homework 7, Problem 4
s = tf('s');
num = [20];
den = [1 5 24];
rltool(tf(num,den)*(1/s))

%% Midterm Project, Problem 1, a
clear all
s = tf('s');
g = 1/(s^2+s+2);
h = 1/(s+1);
gh = minreal(g/(1+g*h));
[y,t] = step(gh);
ess=abs(1-y(end)) % error due to step function
[y,t] = impulse(gh*(1/s^2));
ess=abs(1-y(end)) % error due to ramp function
[y,t] = impulse(gh*(1/s^3));
ess=abs(1-y(end)) % error due to acceleration function

%% Midterm Project, Problem 1, b
clear all
s = tf('s');
g = 1/(s*(s+5));
h = 5;
gh = minreal(g/(1+g*h));
[y,t] = step(gh);
ess=abs(1-y(end)) % error due to step function
[y,t] = impulse(gh*(1/s^2));
ess=abs(1-y(end)) % error due to ramp function
[y,t] = impulse(gh*(1/s^3));
ess=abs(1-y(end)) % error due to acceleration function

%% Midterm Project, Problem 1, c
clear all
s = tf('s');
g = 1/(s^2*(s+10));
h = (s+1)/(s+5);
gh = minreal(g/(1+g*h));
[y,t] = step(gh);
ess=abs(1-y(end)) % error due to step function
[y,t] = impulse(gh*(1/s^2));
ess=abs(1-y(end)) % error due to ramp function
[y,t] = impulse(gh*(1/s^3));
ess=abs(1-y(end)) % error due to acceleration function

%% Midterm Project, Problem 1, d
clear all
s = tf('s');
g = 1/(s^2*(s+12));
h = 5*(s+2);
gh = minreal(g/(1+g*h));
[y,t] = step(gh);
ess=abs(1-y(end)) % error due to step function
[y,t] = impulse(gh*(1/s^2));
ess=abs(1-y(end)) % error due to ramp function
[y,t] = impulse(gh*(1/s^3));
ess=abs(1-y(end)) % error due to acceleration function