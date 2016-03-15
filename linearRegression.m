function [ lm ] = linearRegression( X, y )
% linearRegression returns the results of fitting a linear model of y to
% the data X

lm = fitlm(X, y);

end

