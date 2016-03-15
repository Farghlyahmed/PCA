function [ rsq ] = calcRsq( X, b_pred, y )
% Calculates and returns rsquared


xhat = X * b_pred;
res = y - xhat;
RSS = norm(res)^2;
totalRes = y - mean(y);
TSS = norm(totalRes)^2;
rsq = 1 - RSS / TSS;

end

