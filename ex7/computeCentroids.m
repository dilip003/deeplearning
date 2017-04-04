function centroids = computeCentroids(X, idx, K)
	%data points assigned to each centroid.
	%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
	%   computing the means of the data points assigned to each centroid. It is
	%   given a dataset X where each row is a single data point, a vector
	%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
	%   example, and K, the number of centroids. You should return a matrix
	%   centroids, where each row of centroids is the mean of the data points
	%   assigned to it.
	%

	% Useful variables
	[m n] = size(X);

	% You need to return the following variables correctly.
	%COMPUTECENTROIDS returns the new centroids by computing the means of the 

	centroids = zeros(K, n);
	centroids_count = zeros(K,1);

	% ====================== YOUR CODE HERE ======================
	% Instructions: Go over every centroid and compute mean of all points that
	%               belong to it. Concretely, the row vector centroids(i, :)
	%               should contain the mean of the data points assigned to
	%               centroid i.
	%
	% Note: You can use a for-loop over the centroids to compute this.
	%

	for k = 1:K

		for i=1:m
			if( idx(i) == k )
				centroids(k,:) = centroids(k,:) + X(i,:);
				centroids_count(k) = centroids_count(k) + 1;

			endif;	

		end;	

	end;

	centroids = centroids ./centroids_count;

	%for k = 1:K
	%	idx_c_k = (idx == k);
	%	total_idx_c_k = sum(idx_c_k);
	%	X_c_k = X .* idx_c_k;
	%	centroids(k,:) = sum(X_c_k)/total_idx_c_k;

	%end;

	

	% =============================================================


end

