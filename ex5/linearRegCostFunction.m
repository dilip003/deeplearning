function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

h = X * theta; % Mx1 and y' would be 1xM

sub_theta = theta(2:end,:); % skip the first item to avoid regularizing theta 0

J = (1/(2*m))* (h - y)' * (h - y) + (lambda/(2*m)) * ( sub_theta' * sub_theta) ;

grad1 = (1/m) * (X' * (h-y)); % gradient without theta regularization
grad = (1/m) * (X' * (h-y)) + (lambda/m) * (theta); % gradient with theta regularization

grad(1) = grad1(1); % replace the Gradient 0 with non-regularized gradient value


% =========================================================================

grad = grad(:);

end
