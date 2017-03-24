function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
    %GRADIENTDESCENT Performs gradient descent to learn theta
    %   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
    %   taking num_iters gradient steps with learning rate alpha

    % Initialize some useful values
    m = length(y); % number of training examples
    J_history = zeros(num_iters, 1);

    theta1=0; % temp variables to create simultaneous update of actual theta vector
    theta2=0;

    printf('\n Initial J %f\n',computeCost(X, y, theta));
    
    paramSize = size(theta);    

    for iter = 1:num_iters

        % ====================== YOUR CODE HERE ======================
        % Instructions: Perform a single gradient step on the parameter vector
        %               theta. 
        %
        % Hint: While debugging, it can be useful to print out the values
        %       of the cost function (computeCost) and gradient here.
        %

        % theta1 = theta(1) - (alpha * (1/m)* (X*theta - y)'* X(:,1)  );
        % theta2 = theta(2) - (alpha * (1/m)* (X*theta - y)'* X(:,2)  );

        % theta(1)=theta1;
        % theta(2)=theta2;

        theta = theta - (alpha/m)*((X*theta - y)' * X)'; %vector impl

        % ============================================================

        % Save the cost J in every iteration    
        
        J_history(iter) = computeCost(X, y, theta);
   
    end

    printf('\n First J %f\n',J_history(1));
    printf('\n Last J %f\n',J_history(num_iters));

    printf('\n Theta \n');
    theta

end
