function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%


%plot(X(:,1), X(:,2), 'k+', 'MarkerSize', 10, 'LineWidth', 2);

positive = find(y==1); % find out 1 positive indices in y
negative = find(y==0); % find out 0 positive indices in y

plot(X(positive,1), X(positive,2),'b+','MarkerSize', 10, 'LineWidth', 2); % plot positive matrix
plot(X(negative,1), X(negative,2),'ro','MarkerSize', 10, 'LineWidth', 2); % plot negative matrix

% =========================================================================


hold off;

end
