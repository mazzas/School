clc; clear all; close all;
syms x;
x = linspace(-2,2);
subplot(2,2,1);
plot(x,exp(x).*sin(x),'b-',x,1+x,'r-');
axis([-2 2 -1 2.5]);
subplot(2,2,2);
plot(x,exp(x).*sin(x),'b-',x,1+x-x.^3./3,'r-');
axis([-2 2 -1 1.5]);
subplot(2,2,3);
plot(x,exp(x).*sin(x),'b-',x,1+x-x.^3./3-x.^4./6,'r-');
axis([-2 2 -1 1.5]);
subplot(2,2,4);
plot(x,exp(x).*sin(x),'b-',x,1+x-x.^3./3-x.^4./6-x.^5./30,'r-');
axis([-2 2 -1 1.5]);