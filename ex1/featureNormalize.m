function [X_norm, mu, sigma] = featureNormalize(X)
	%FEATURENORMALIZE Normalizes the features in X 
	%   FEATURENORMALIZE(X) returns a normalized version of X where
	%   the mean value of each feature is 0 and the standard deviation
	%   is 1. This is often a good preprocessing step to do when
	%   working with learning algorithms.

	% You need to set these values correctly
	X_norm = X;
	mu = zeros(1, size(X, 2));
	sigma = zeros(1, size(X, 2));
	size(X)

	% ====================== YOUR CODE HERE ======================
	% Instructions: First, for each feature dimension, compute the mean
	%               of the feature and subtract it from the dataset,
	%               storing the mean value in mu. Next, compute the 
	%               standard deviation of each feature and divide
	%               each feature by it's standard deviation, storing
	%               the standard deviation in sigma. 
	%
	%               Note that X is a matrix where each column is a 
	%               feature and each row is an example. You need 
	%               to perform the normalization separately for 
	%               each feature. 
	%
	% Hint: You might find the 'mean' and 'std' functions useful
	% ============================================================
	
	mu = [0, mean(X(:,2)), mean(X(:,3))];

	sigma = [1, std(X(:,2)), std(X(:,3))];

	X1 = X .-[mu(1), mu(2), mu(3)] ;			% substract the mean from each dimension
 
	X2 = X1 ./[sigma(1) ,sigma(2), sigma(3)]	;	% devide by standard deviation

	X_norm = X2 ;

	mu_new = [mean(X_norm(:,2)) mean(X_norm(:,3))]

	sigma_new = [std(X_norm(:,2)) std(X_norm(:,3))]

end
