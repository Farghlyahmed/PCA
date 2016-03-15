function [ Xreduced, varexplained, coeff, prinComps, S ] = prinCompAnalysis(X, numPrincipalComponents)
% pca reduces the dimensionality of X from m x n to m x
% numPrincipalComponents using principal component analysis
% Displays relationship between components and features in an 
% n x n matrix where each column represents the coefficients for 
% principal component
% Returns the new dataset Xreduced, and the percentage of variance
% explained by this new dataset

numsamples = size(X, 1);
numfeatures = size(X, 2);
[U S V] = svd(X);
[coeff score latent] = pca(X);
varexp = 0;
totvar = 0;
prinComps = X * V;
Xreduced = prinComps(:,1:numPrincipalComponents);
for i=1:numPrincipalComponents
    varexp = varexp + S(i,i);
end
for i=1:numfeatures
    totvar = totvar + S(i,i);
end
varexplained = varexp / totvar;
