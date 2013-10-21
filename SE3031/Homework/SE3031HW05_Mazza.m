%% Homework 05 - Steve Mazza
%% Problem 1
%
close all; clc; clear all;

xmin = 0.5;
xmax = 4.5;

% Vector definition of polynomials.
pv1 = [1 -7 14 -8];
pv2 = [1 -4 3];

% Multiply p1 * p2.
pv3 = conv(pv1,pv2);

% Create symbolic polynomials.
sp1 = poly2sym(pv1);
sp2 = poly2sym(pv2);
sp3 = poly2sym(pv3);

% Create text string polynomials.
cp1 = char(sp1);
cp2 = char(sp2);
cp3 = char(sp3);

% Vectorize expressions.
vp1 = vectorize(cp1);
vp2 = vectorize(cp2);
vp3 = vectorize(cp3);

% Find roots of the polynomials.
rp1 = roots(pv1);
rp2 = roots(pv2);
rp3 = roots(pv3);

% Plot polynomials and roots.
limits = [xmin xmax];
fplot(cp1,limits);
hold on;
fplot(cp2,limits,'y');
fplot(cp3,limits,'g');

% Decorate plot.
title('Homework 5, Problem 1');
xlabel('x');
ylabel('y');

% Add markers.
plot(rp1,0,'rx');
plot(rp2,0,'rx');
plot(rp3,0,'rx');

% Add annotations.
% NOTE: The following is very unsatisfying.  Because of the relative
% specification of the x/y coordinates, I cannot find a good way to
% automatically calculate the placement of the annotations.  Plus, I am
% manually inspecting the roots arrays.  Booooo!!!  The whole thing is ver
% ugly and I don't like it at all.
annotation('textarrow', [.3 .235], [.4 .275], 'String' , num2str(rp1(3)));
annotation('textarrow', [.5 .435], [.4 .275], 'String' , num2str(rp1(2)));
annotation('textarrow', [.72 .785], [.4 .275],'String' , num2str(rp1(1)));
annotation('textarrow', [.65 .62], [.4 .275],'String' , num2str(rp2(1)));

%% Problem 2
%
close all; clc; clear all;


%% Problem 3
%
close all; clc; clear all;


%% Problem 4
%
close all; clc; clear all;

