clc; clear;

d = 5;
figName = 'piecewise.fig';
fun = @(x) exp(-x^2);
H = 10 / 8;

x_nodes = zeros(1, 8);
y_nodes = zeros(1, 8);

i = 1; % 8 subintervals with equal length H
for k = -5:H:5
    x_nodes(i) = k; 
    y_nodes(i) = fun(k);
    i = i + 1;
end

y_values_linear_interpolation = zeros(1, 1000 + 1);
y_values_cubic_spline = zeros(1, 1000 + 1);
x_values = zeros(1, 1000 + 1);
y_real_fun = zeros(1, 1000 + 1);
for j = 0:1000
    x_j = -d + ((2*d) / 1000) * j;
    x_values(j+1) = x_j;
    y_values_linear_interpolation(j+1) = interp1(x_nodes, y_nodes, x_j); % compute linear and evaluate
    y_values_cubic_spline(j+1) = spline(x_nodes, y_nodes, x_j); % compute spline with not-a-knot and evaluate
    y_real_fun(j+1) = fun(x_j);
end

plot(x_values, y_real_fun); % plot function
hold on;
plot(x_values, y_values_linear_interpolation); % plot approximations
plot(x_values, y_values_cubic_spline);
hold off

title("Exercise 2b"); 
legend({'Function f(x) = e^{-x^2}', 'Linear Interpolation', 'Cubic Spline Interpolation'});
xlabel("x"); % adds label for x axis
ylabel("y"); % adds label for y axis
savefig(figName); % save plot in filename.fig
