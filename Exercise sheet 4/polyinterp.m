clc; clear;

d = 5;
fun = @(x) exp(-x^2);
figName = 'interp_n.fig';

x_j = zeros(1, 1000 + 1);
y_j = zeros(1, 1000 + 1);

for j = 0:1000
    x_j(j+1) = -d + (((2*d) / 1000) * j);
    y_j(j+1) = fun(x_j(j+1));
end

Legend = cell(6,1);
plot(x_j, y_j);  % plot Real function
Legend{1} = 'Function f(x) = e^{-x^2}';
hold on;

% Computes polynomials for degrees n = 2,4,6,8,10
for n = 2:2:10
    x_nodes = zeros(1, n);
    y_nodes = zeros(1, n);
    % Calculate nodes x_k for n
    for k = 0:n
        x_k = -d + ((2*d)/n) * k;
        x_nodes(k+1) = x_k;
        y_nodes(k+1) = fun(x_k);
    end
    
    % Evaluate polynomials in the points ... for 0 <= j <= 1000
    x_j = zeros(1, 1000 + 1);
    y_j = zeros(1, 1000 + 1);
    for j = 0:1000
        x_j(j+1) = -d + ((2*d) / 1000) * j;
        y_j(j+1) = polynomial_lagrange(x_j(j+1), n, x_nodes, y_nodes);
    end
    plot(x_j, y_j); % plot approx
    Legend{n/2+1}=strcat('Approx n = ', num2str(n));

end
hold off
title("Timucin Besken"); 
set(0,'DefaultTextInterpreter', 'latex');
legend(Legend)

xlabel("x"); % adds label for x axis
ylabel("y"); % adds label for y axis
savefig(figName); % save plot in filename.fig


function [res] = polynomial_lagrange(x, n, given_x, given_y)
    res = 0;
    for k = 1:n+1
        phi_k = 1;
        for j = 1:n+1
            if (k ~= j)
                phi_k = phi_k * (x - given_x(j)) / (given_x(k) - given_x(j));
            end
        end
        res = res + given_y(k) * phi_k;
    end
end