%% Problem 2
close all
clear all
s = tf('s');

% Set up transfer functions and compensators.
g = tf(1/s^2);
gc1 = tf((s+0)/(s+2));
gc2 = tf((s+0.5)/(s+3));

% Plot all root loci.
rlocus(g)
hold on
axis([-5 1 -3 3])
grid
rlocus (gc1*g)
rlocus (gc2*g)

% Calculate the gain.
[K1,poles]=rlocfind(gc1*g,-1+j)      % K = 2
[K2,poles]=rlocfind(gc2*g,-1+j)      % K = 4

% Plot the response curves.
% unit-step response.
close all
step(feedback(g,1))
axis([0 10 -4 6])
hold on
grid
step(K1*feedback(gc1*g,1))
step(K2*feedback(gc2*g,1))
title('Unit-Step Response')

% unit-ramp response.
close all
step(feedback(g,1)*1/s)
axis([0 10 0 10])
hold on
grid
step(feedback(K1*gc1*g,1)*1/s)
step(feedback(K2*gc2*g,1)*1/s)
title('Unit-Ramp Response')

% unit-acceleration response.
close all
step(feedback(g,1)*1/s^2)
axis([0 10 0 10])
hold on
grid
step(feedback(K1*gc1*g,1)*1/s^2)
step(feedback(K2*gc2*g,1)*1/s^2)
title('Unit-Acceleration Response')

%% Problem 3
close all
clear all
s = tf('s');

% Set up transfer functions and compensators.
g = tf(820/(s*(s+10)*(s+20)))
gc1 = tf((s+0.4)/(s+0.03))
gc2 = tf((s+0.04)/(s+0.003))

% Plot all root loci.
rlocus(g)
hold on
axis([-25 5 -15 15])
grid
rlocus (gc1*g)
rlocus (gc2*g)

% Assuming a gain of 1???

% Plot the response curves.
% unit-step response.
close all
step(feedback(g,1))
axis([0 2 0 2])
hold on
grid
step(feedback(gc1*g,1))
step(feedback(gc2*g,1))
title('Unit-Step Response')

% unit-ramp response.
close all
step(feedback(g,1)*1/s)
axis([0 2 0 2])
hold on
grid
step(feedback(gc1*g,1)*1/s)
step(feedback(gc2*g,1)*1/s)
title('Unit-Ramp Response')