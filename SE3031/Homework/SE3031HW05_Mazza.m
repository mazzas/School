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

% Add information to the plot.
% NOTE: I am aware that text values are being overwritten.
yvalue = 1.1;
for i=1:size(rp1)
    text(rp1(i),yvalue,strcat('x=',num2str(rp1(i))));
end
for i=1:size(rp2)
    text(rp2(i),yvalue,strcat('x=',num2str(rp2(i))));
end
for i=1:size(rp3)
    text(rp3(i),yvalue,strcat('x=',num2str(rp3(i))));
end

%% Problem 2
%
close all; clc; clear all;

syms x;

% a)
simplify(3*sin(x) - 4*sin(x)^3)

% b)
expand(cos(4*x))

% c)
rewrite(sin(x)^2,'tan')

% d)
rewrite(tanh(x),'exp')

%% Problem 3
%
close all; clc; clear all;

syms x n d a;

% a)
limit(1/(1+2^(-1/x)),x,0,'right')

% b)
limit(n/(factorial(n)^(1/n)),n,inf)

% c)
limit(x*sin(d/x),x,inf)

% d)
limit((a^x-1)/x,x,0)

%% Problem 4
%
close all; clc; clear all;

syms r l e theta x y;

% Define symbolic expression for the conic section.
H = r - l/(1 + e * cos(theta));

% Convert to Cartesian coordinates.
H = subs(H,r,sqrt(x^2 + y^2));
H = subs(H,cos(theta),x/sqrt(x^2 + y^2));

% Substitute values (given) for l and e.
H1 = subs(H,l,1.5);
H1 = subs(H1,e,0.7);
H2 = subs(H,l,1);
H2 = subs(H2,e,0.2);

% Plot the functions.
ezplot(char(H1));
hold on; 
h = ezplot(char(H2));
set(h,'Color',[1 0 1]);
set(h,'LineWidth',2);
stem(0,1.5);

% Decorate the plot.
title('Homework 5, Problem 4');
xlabel('x');
ylabel('y');
legend('H1','H2');
axis equal; 
axis tight;
