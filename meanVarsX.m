function [ meanX, varX ] = meanVarsX( X )
% meanVarsX calculates the mean and variance for the matrix X 

numfeatures = size(X,2); 
meanX = zeros(numfeatures,1);
varX = zeros(numfeatures,1);
for i=1:numfeatures
    meanX(i,1) = mean(X(:,i));
    varX(i,1) = var(X(:,i));
end
meanX = meanX';
varX = varX';
