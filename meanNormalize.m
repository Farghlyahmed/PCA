function [ XNorm ] = meanNormalize( X )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

disp('Normalising X...')
XNorm = zeros(size(X,1),size(X,2));
numvars = size(X,2);
[meanX varX] = meanVarsX(X);
for i=1:numvars
    XNorm(:,i) = X(:,i) - meanX(i);
end
[meanX varX] = meanVarsX(XNorm);
end

