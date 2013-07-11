%% Homework 1
%% Problem 1
%poles(1/(1-exp(-a*s)))

%% Problem 2

%% Problem 3
num = [1 5 6 9 30];
den = [1 6 21 46 30];
[r,p,k] = residue(num,den)

syms s
F = (s^4+5*s^3+6*s^2+9*s+30)/(s^4+6*s^3+21*s^2+46*s+30);
ilaplace(F)

%% Problem 4
z = [-1; -2];
p = [0; -4; -6; 2+3i; 2-3i];
k = 5;
[num,den] = zp2tf(z,p,k);
printsys(num,den,'s')

%% Problem 5

%% Problem 6
