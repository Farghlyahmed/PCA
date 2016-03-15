function [ X, y ] = datasetGenerator(numsamples, bias, varx1, noisex1toy, noisex2tox1, numuncorr, varuncorr, distvar)
% DATASETGENERATOR: Generates an m x n matrix X, with m samples and n features, and an m dimensional outcome vector y
%   Y = 5 + 2 * x1 + epsilon : epsilon determined by noisex1toy which is the variance of epsilon 
%   Y is a linear function of x1. x1 has a zero mean, variance = varx1
%   x2 = x1 + epislon: variance of epsilon determined by noisex2toex1
%   All other variables uncorrelated with Y 
%   All variables have zero mean and the same variance, determined by varuncorr
%   The distribution of variables is determined by distvar
%   distvar = 1 : Normal distribution
%   bias = 1: includes a constant term, bias = 0: no constant term

%
numfeatures = bias + 2 + numuncorr;
X = zeros(numsamples, numfeatures);
rtnoisex1toy = noisex1toy .^ 0.5;
if distvar == 1
    X = normalDistData(numsamples, bias, numfeatures, varx1, noisex2tox1, varuncorr);
    if bias == 0
        y = 5.*ones(numsamples,1) + 2.*X(:,1) + rtnoisex1toy.*randn(numsamples,1);
    else
        y = 5.*X(:,1) + 2.*X(:,2) + rtnoisex1toy.*randn(numsamples,1);
    end
else
    disp('Error: unknown distribution')
end

end

