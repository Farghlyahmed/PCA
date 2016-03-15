function [ b, resnorm ] = linearLS( X, y )
% linearLS calculates a linear least squares solution to the matrix equation
% Xb = y and returns b and the two norm of the residual vector

% Adds bias term (constant)
sz = size(X,1);
X = [ones(sz,1) X];

b = X \ y;
xhat = X * b;
res = y - xhat;
resnorm = norm(res);

end

