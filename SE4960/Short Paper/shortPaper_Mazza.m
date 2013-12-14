%% Federation Among Remote Military Data Stores In Austere Environments
% Steve Mazza
% SE4960
%

%% Probability of Connectivity Graph
%

clc; clear all; close all;

k = 10;             % graph diameter without short cuts (# echelons)
xmin = 0;
xmax = k;
ymin = 0;
ymax = 1;

x = linspace(xmin,xmax);
y = linspace(ymin,ymax);

K = 3;              % adjust to accelerate or decelerate decay. 
n = 0.04;           % in general, vary from 0 to 1.

set(0,'DefaultAxesColorOrder',[0 0 0], ...
      'DefaultAxesLineStyleOrder','-|-.|--|:');
axis([xmin xmax ymin ymax]);

plot(x,1./(K*x.^(2*n)), ...
    x,1./(K*x.^(4*n)), ...
    x,1./(K*x.^(6*n)), ...
    x,1./(K*x.^(8*n)));

axis normal;
xlabel('Echelon');
ylabel('Probability of Connectivity');
legend(strcat('n=',num2str(n)), ...
    strcat('n=',num2str(2*n)), ...
    strcat('n=',num2str(3*n)), ...
    strcat('n=',num2str(4*n)),0);

%% Bandwidth
%

clc; clear all; close all;

k = 5;             % graph diameter without short cuts (# echelons)
xmin = 0;
xmax = k;
ymin = 2.8;
ymax = 100;

x = linspace(xmin,xmax);
y = linspace(ymin,ymax);

K = 100;              % adjust to accelerate or decelerate decay. 
n = 0.001;           % in general, vary from 0 to 1.

set(0,'DefaultAxesColorOrder',[0 0 0], ...
      'DefaultAxesLineStyleOrder','-|-.|--|:');
axis([xmin xmax ymin ymax]);

plot(x,1./n*K^n*x.^(-n-1));

%axis normal;
xlabel('Echelon');
ylabel('Bandwidth in Kilobytes');
% legend(strcat('n=',num2str(n)), ...
%     strcat('n=',num2str(2*n)), ...
%     strcat('n=',num2str(3*n)), ...
%     strcat('n=',num2str(4*n)),0);
