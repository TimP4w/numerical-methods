% 2019 Timucin Besken
% 14-924-609
function [x, it] = secantmethod(fun, x0, x1, eps)
    %secantmethod
    %   Exercise 2a
    maxIterations = 100000;
    it = 0;
    x = x1 - fun(x1) * ((x1 - x0) / (fun(x1) - fun(x0)));
    
    if abs(fun(x0)) <= eps
        x = x0;
        fprintf('Solution found before starting \n Was x0 = %.7f \n', x);
        return;
    end
    
    if abs(fun(x1)) <= eps
        x = x1;
        fprintf('Solution found before starting \n Was x1 = %.7f \n', x);
        return;
    end

    while abs(fun(x)) > eps && it < maxIterations
        it = it + 1;
        x0 = x1;
        x1 = x;
        x = x1 - fun(x1) * ((x1 - x0) / (fun(x1) - fun(x0)));
    end
    
    if abs(fun(x)) > eps
        fprintf('Error: Did not converge in maximum iterations \n');
        return
    end

    fprintf('Solution found in %d iterations \n x = %.7f \n', it, x);
    return;
   

end
