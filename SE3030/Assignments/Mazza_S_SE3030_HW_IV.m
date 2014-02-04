%% Homework IV
% 
%% 6.7.5
%

clear all; clc;

syms x y z;

d = divergence([x^2, y^2, z^2], [x, y, z]);
c = curl([x^2, y^2, z^2], [x, y, z]);

fprintf('\nDiv = %s\nCurl = %s.\n\n',char(d),char(c));