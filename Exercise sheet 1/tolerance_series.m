% 2019 Timucin Besken
% 14-924-609
function [n] = tolerance_series(tolerance)
    %TOLERANCE_SERIES
    %   Exercise 1b
    lastSum = 0;
    partialSum = 0; 
    n = 0;
    
    convergeValue = pi.^2 / 8;

    while ((abs(partialSum - convergeValue) > tolerance))
        n = n + 1;
        partialSum = lastSum + (1 / ((2*n) - 1).^2);
        lastSum = partialSum;
    end
    return;
end

