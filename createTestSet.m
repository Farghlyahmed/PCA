function [ Xtr Xtest ytr ytest ] = createTestSet( X, y )
% Splits a dataset into a training and test set
%   90% of the data is training, 10% test

sizeXVal = int64(size(X,1) * (9 / 10));
[b idx] = datasample(X, sizeXVal, 'Replace', false);
flag = zeros(size(X,1),1);
for i=1:size(idx,2)
    flag(idx(i),1) = 1;
end
xtrindex = find(flag==1);
xtestindex = find(flag==0);
Xtr = X(xtrindex,:);
ytr = y(xtrindex,:);
Xtest = X(xtestindex,:);
ytest = y(xtestindex,:);

end

