function [res,err] = lagr_polynomial(x)
figName = 'lagrangianpoly.fig';

given_nodes_x = [0, 0.6, 0.9];
given_nodes_y = [cos(0), cos(0.6), cos(0.9)];
res = 0;
for k = 1:3
    phi_k = 1;

    for j=1:3
        if (k ~= j)
            phi_k = phi_k * (x - given_nodes_x(j)) / (given_nodes_x(k) - given_nodes_x(j));
        end
    end
    res = res + given_nodes_y(k) * phi_k;
end
err = abs(cos(x) - res);

lagrangianpoly = [];
for x_0_1 = 0:0.1:1
    result = 0;

    for k = 1:3
        phi_k = 1;

        for j=1:3
            if (k ~= j)
                phi_k = phi_k * (x_0_1 - given_nodes_x(j)) / (given_nodes_x(k) - given_nodes_x(j));
            end
        end
        result = result + given_nodes_y(k) * phi_k;
       
    end  
    lagrangianpoly = [lagrangianpoly, result];
end

phi_k_given_points = [];
for x_k = 1:3
    result = 0;

    for k = 1:3
        phi_k = 1;

        for j=1:3
            if (k ~= j)
                phi_k = phi_k * (given_nodes_x(x_k) - given_nodes_x(j)) / (given_nodes_x(k) - given_nodes_x(j));
            end
        end
        result = result + given_nodes_y(k) * phi_k;
       
    end  
    phi_k_given_points = [phi_k_given_points, result];
end


xValues = (0:0.1:1); 

plot(xValues,lagrangianpoly) 
hold on
scatter(given_nodes_x, phi_k_given_points, 'square')
hold off
title("Timucin Besken"); 
set(0,'DefaultTextInterpreter', 'latex');

legend({'Lagrange charachteristic polynomials in interval x $\in$ [0, 1]', '$\varphi_k(x_k)$'}, 'Interpreter', 'latex');

xlabel(" x $\in$ [0, 1] "); % adds label for x axis
ylabel("approximation of cos(x)"); % adds label for y axis
savefig(figName); % save plot in filename.fig

fprintf('Approximated value of x = %.4f is %.4f \nActual value was %.4f  \n', x, res, cos(x));
fprintf('Error %.4f \n', err);

end

