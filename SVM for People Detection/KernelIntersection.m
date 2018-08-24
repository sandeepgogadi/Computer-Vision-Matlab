function K = KernelIntersection(X1, X2)
   % computes a histogram intersection kernel
   %
   % Input:
   % - X1: an n x d dimensional feature matrix where n is the number of observations, and d is the number of features.
   % - X2: an m x d dimensional feature matrix where m is the number of observations, and d is the number of features.
   % Output:
   % - K: an n x m dimensional kernel matrix where K(i,j) stores a histogram intersection between the data point i in X1, and data point j in X2.
   n = size(X1,1);
   m = size(X2,1);
   d = size(X2,2);
   
   K = zeros(n,m);
   
   for i=1:n
       for j=1:m
           s = 0;
           for k=1:d
               s = s + min(X1(i,k), X2(j,k));
           end
           K(i,j) = s;
       end
   end
   
   
   
end