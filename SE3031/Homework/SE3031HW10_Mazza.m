%% Homework 10 - Steve Mazza
%% Problem 1
%
clc; clear all; close all;

options = odeset('RelTol',1e0);
[t0,y0] = ode23(@(t,y)[5*y(2); -5*y(1) - y(2)],[0 4],[1 1],options);
options = odeset('RelTol',1e-4);
[t1,y1] = ode23(@(t,y)[5*y(2); -5*y(1) - y(2)],[0 4],[1 1],options);

% Plot findings.
subplot(2,2,1);
plot(t0,y0(:,1),'-',t0,y0(:,2),'-.');
legend('y_1(t)','y_2(t)',0);
title('Time series (RelTol=1e0)');
xlabel('time');
ylabel('y')
subplot(2,2,2);
plot(t1,y1(:,1),'-',t1,y1(:,2),'-.');
legend('y_1(t)','y_2(t)',0);
title('Time series (RelTol=1e-4)');
xlabel('time');
ylabel('y')
subplot(2,2,3);
plot(y0(:,2),y0(:,1),'-.o');
axis equal;
title('y2 vs. y1 (RelTol=1e0)');
xlabel('y1');
ylabel('y2')
subplot(2,2,4);
plot(y1(:,2),y1(:,1),'-.o');
axis equal;
title('y2 vs. y1 (RelTol=1e-4)');
xlabel('y1');
ylabel('y2')

%% Problem 2
%
clc; clear all; close all;


%% Problem 3
%
clc; clear all; close all; warning off;

open('SE3031HW10_sim_Mazza.slx')
sim('SE3031HW10_sim_Mazza.slx', [0 9])

plot(y,tout,'-',dy,tout,'--');
legend('y','dy',0);
grid;
xlabel('time');
ylabel('y');
