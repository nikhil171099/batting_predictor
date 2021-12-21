function plotDataC(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% Find Indices of Positive and Negative Examples
pos = find(y == 1); neg = find(y == 0);
% Plot Examples
plot(X(pos, 3), X(pos, 2), 'k+','LineWidth', 2, ...
'MarkerSize', 7);
plot(X(neg, 3), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', ...
'MarkerSize', 7);
% Labels and Legend
title("Virat Kohli's Performance Analysis")
ylabel('Age')
xlabel('Difficulty')

% Specified in plot order
legend('Successful match', 'Failed match')


hold off;

end
