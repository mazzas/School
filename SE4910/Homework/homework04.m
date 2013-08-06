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
% Solved using velocity_feedback.m

%% Homework 7, Problem 5
clear all
s = tf('s');
num = [1 5];
den = [1 1 5];
subplot(1,2,1);
pzmap(tf(num,den))
axis equal
sgrid
subplot(1,2,2);
rlocus(num,den)
axis equal
sgrid
rltool(tf(num,den))

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

%% Midterm Project, Problem 2
clear all
s = tf('s');
num = [100 100];
den = [1 0 0];
%rlocus(tf(num,den))
%hold on
%rlocus((s + 0) * tf(num,den)) %pole-zero cancellation
axis equal
sgrid
%rltool(tf(num,den))