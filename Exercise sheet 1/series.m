% 2019 Timucin Besken
% 14-924-609

clc; clear all; close all;

% Variables
n = 10;
figName = 'series_plot.fig';

partialSumsVector = calculateSerie(n); % Find first 10 values of partial sum
display(partialSumsVector);

xValues = (1:n); 
scatter(xValues,partialSumsVector) % Plot as discrete points (no lines between them)
title("Timucin Besken"); % adds your name as title
xlabel("n ranges from 1 to 10"); % adds label for x axis
ylabel("y = 1 / (2k - 1)^2"); % adds label for y axis

savefig(figName); % save plot in filename.fig
close(gcf); % close figure

function [partialSums] = calculateSerie(n)
    partialSums =  zeros(0,n); % preallocate vector to stop matlab from complaining
    lastSum = 0;
    for k = 1:n
        sum = lastSum + (1 / ((2*k) - 1).^2);
        partialSums(k) = sum;
        lastSum = sum;
    end
 end

