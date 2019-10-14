% 2019 Timucin Besken
% 14-924-609
clc; clear all; close all;

fun = @ (x) (2*cos(3*x) - exp(x));

% First test
x0_1 = 0.1;
x1_1 = 0.11;
eps_1 = 1e-8;

% Second test
x0_2 = -1;
x1_2 = -0.9;
eps_2 = 1e-5;

sol1 = secantmethod(fun, x0_1, x1_1, eps_1);
sol2 = secantmethod(fun, x0_2, x1_2, eps_2);

fplot(fun, [-5 5]) % plot function
hold on
plot(sol1,fun(sol1),'or') % add mark for solution 1 in red (o)
plot(sol2,fun(sol2),'xb') % add mark for solution 2 in blue (x)

legend('2cos(3x) - exp(x)','Solution 1', 'Solution 2') % add legend with three labels