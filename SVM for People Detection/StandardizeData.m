function X_new=StandardizeData(X)
   % standardizes data
   %
   % Input:
   % - X: an n x d dimensional feature matrix where n is the number of observations, and d is the number of features.
   % Output:
   % - X_new: an n x d dimensional normalized feature matrix.
   mu_X = mean(X);
   sig_X = std(X);
   
   X_new=(X - mu_X)./sig_X;
end