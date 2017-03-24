function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


sub_theta = theta(2:end,:); % skip the first item to avoid regularizing theta 0

h = sigmoid(X*theta); % Mx1 and y' would be 1xM
J = (1/m)*(  -y'*log(h) - (1-y)'*log(1-h)  ) + (lambda/(2*m)) * ( sub_theta' * sub_theta);

grad1 = (1/m) * (X' * (h-y)); % gradient without theta regularization
grad = (1/m) * (X' * (h-y)) + (lambda/m) * (theta); % gradient with theta regularization

grad(1) = grad1(1); % replace the Gradient 0 with non-regularized gradient value

% =============================================================

end
