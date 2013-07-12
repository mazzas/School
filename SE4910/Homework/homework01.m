%% Homework 1
%% Problem 1
% See attached PDF for solution.

%% Problem 2
% See attached PDF for solution.

%% Problem 3
% Also see attached PDF.
num = [1 5 6 9 30];
den = [1 6 21 46 30];
[r,p,k] = residue(num,den)

syms s
F = (s^4+5*s^3+6*s^2+9*s+30)/(s^4+6*s^3+21*s^2+46*s+30);
ilaplace(F)
% TODO: format output.

%% Problem 4
% Also see attached PDF.
z = [-1; -2];
p = [0; -4; -6; 2+3i; 2-3i];
k = 5;
[num,den] = zp2tf(z,p,k);
printsys(num,den,'s')

%% Problem 5
% Also see attached PDF.
syms w
F = 5/(s^2*(s^2+w^2));
ilaplace(F)

%% Problem 6
% Also see attached PDF.
dsolve('D2x+3*Dx+2*x=0','x(0)=-1, Dx(0)=2')