function plotDecisionBoundary(theta, X, y)
%PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
%the decision boundary defined by theta
%   PLOTDECISIONBOUNDARY(theta, X,y) plots the data points with + for the 
%   positive examples and o for the negative examples. X is assumed to be 
%   a either 
%   1) Mx3 matrix, where the first column is an all-ones column for the 
%      intercept.
%   2) MxN, N>3 matrix, where the first column is all-ones
temp = X(:,2);
X(:,2) = X(:,7);
X(:,7) = temp;
% Plot Data
plotDataDB(X(:,[2 : 3]), y);
hold on

if size(X, 2) <= 3
    % Only need 2 points to define a line, so choose two endpoints
    plot_x = [min(X(:,2))-2,  max(X(:,2))+2];

    % Calculate the decision boundary line
    plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));

    % Plot, and adjust axes for better viewing
    plot(plot_x, plot_y)
    
    % Legend, specific for the exercise
    legend('Admitted', 'Not admitted', 'Decision Boundary')
    axis([30, 100, 30, 100])
else
    % Here is the grid range
    u = linspace(1, 84, 100);
    v = linspace(22, 41, 100);
    w = linspace(1,5,100);

    z = zeros(length(u), length(v));
    % Evaluate z = theta*x over the grid
    for i = 1:length(u)
        for j = 1:length(v)
            for k = 1:length(w)
                z(i,j) = mapFeature(u(i), v(j), w(k))*theta;
            end
        end
    end
    z = z'; % important to transpose z before calling contour

    % Plot z = 0
    % Notice you need to specify the range [0, 0]
    contour(w, v, z,[0,-1], 'LineWidth', 2,'Color','g')
    hGreen = plot(NaN,'-g');
    contour(w, v, z,[0,-1.2], 'LineWidth', 2,'Color','y')
    hYellow = plot(NaN,'-y');
    contour(w, v, z,[0,-1.3], 'LineWidth', 2,'Color','r')
    hRed = plot(NaN,'-r');
    legend([hGreen, hYellow, hRed],'World Class Player','Good Player','Average Player')
    figure()
    surf(w,v,z)
end
hold off

end
