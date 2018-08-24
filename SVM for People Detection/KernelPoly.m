function K = KernelPoly(X1, X2)
   % computes a second degree polynomial kernel
   %
   % Input:
   % - X1: an n x d dimensional feature matrix where n is the number of observations, and d is the number of features.
   % - X2: an m x d dimensional feature matrix where m is the number of observations, and d is the number of features.
   % Output:
   % - K: an n x m dimensional kernel matrix where K(i,j) stores a square of the dot product between the data point i in X1, and data point j in X2. The dot product should be raised to the power of 2.
   K = (X1 * X2').^2;
end