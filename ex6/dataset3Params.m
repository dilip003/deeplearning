function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

val_set = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

C_sigma_error =zeros(64,3);

error_min=1; %this would mean max error, when all predictinos are wrong

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
visualizeBoundary(X, y, model);

predictions = svmPredict(model, Xval);

row = 0;
for C = val_set
	for sigma = val_set
		fprintf('\n C and Sigma %f \t %f', C, sigma);
		model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
		predictions = svmPredict(model, Xval);
		err   = mean(double( predictions ~= yval )); % this almost means what fraction of predicted results are different from labels

		row =  row + 1;

		C_sigma_error(row,1) = C;
		C_sigma_error(row,2) = sigma;
		C_sigma_error(row,3) = err;

	end;
	
end;

[min_err_val,min_err_idx] = min(C_sigma_error(:,3) )

error_min = C_sigma_error(min_err_idx,3);
C = C_sigma_error(min_err_idx,1);
sigma = C_sigma_error(min_err_idx,2);

fprintf('\n C__optimum and Sigma_optimum %f \t %f', C, sigma);

% =========================================================================

end
