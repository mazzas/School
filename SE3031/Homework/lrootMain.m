%******   Run this script that utilizes the (user-defined) lroot function  ******
%******    to localize (bracket) all the roots of the function Test_Fun    ******
%******                     within the range [-3;6].                       ******

%   Author: Yakimenko, Oleg A.
%   Date:   December, 16 2012
%   E-mail: oayakime@nps.edu

clear all, close all, clc

lroot('lrootTestFun(x)-1',-3,6,[],1)