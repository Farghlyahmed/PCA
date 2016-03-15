function [ Xtest, XTRAIN, Xtr1, Xtr2, Xtr3, Xtr4, Xtr5, Xtr6, Xtr7, Xtr8, Xtr9, Xtr10, ...
                        Xte1, Xte2, Xte3, Xte4, Xte5, Xte6, Xte7, Xte8, Xte9, Xte10, ...
           ytest, yTRAIN, ytr1, ytr2, ytr3, ytr4, ytr5, ytr6, ytr7, ytr8, ytr9, ytr10, ...
                        yte1, yte2, yte3, yte4, yte5, yte6, yte7, yte8, yte9, yte10 ...
           ] = createTestTrainSets_v2( X, y )
% CREATETESTTRAINSETS_v2 Splits datasets X and y into a test set, Xtest and yTest, and 10 cross validation sets
% Each cross validation set consists of four datasets
% For exampple: cross validation 1 = [Xtr1, ytr1, Xte1, yte2]
% [Xtr1, ytr1] is the training data, [Xte1, yte2] is the test data   

sizeTest = size(X,1) / 5;
sizeTest = int64(sizeTest);
sizeXVal = int64(size(X,1) * (4 / 5) * (9 / 10));

[b idx] = datasample(X, sizeTest, 'Replace', false);
flag = zeros(size(X,1),1);
for i=1:size(idx,2)
    flag(idx(i),1) = 1;
end
xtestindex = find(flag==1);
xtrainindex = find(flag==0);
Xtest = X(xtestindex,:);
ytest = y(xtestindex,:);
XTRAIN = X(xtrainindex,:);
yTRAIN = y(xtrainindex,:);

[Xtr1, Xte1, ytr1, yte1 ] = createTestSet( XTRAIN, yTRAIN );
[Xtr2, Xte2, ytr2, yte2 ] = createTestSet( XTRAIN, yTRAIN );
[Xtr3, Xte3, ytr3, yte3 ] = createTestSet( XTRAIN, yTRAIN );
[Xtr4, Xte4, ytr4, yte4 ] = createTestSet( XTRAIN, yTRAIN );
[Xtr5, Xte5, ytr5, yte5 ] = createTestSet( XTRAIN, yTRAIN );
[Xtr6, Xte6, ytr6, yte6 ] = createTestSet( XTRAIN, yTRAIN );
[Xtr7, Xte7, ytr7, yte7 ] = createTestSet( XTRAIN, yTRAIN );
[Xtr8, Xte8, ytr8, yte8 ] = createTestSet( XTRAIN, yTRAIN );
[Xtr9, Xte9, ytr9, yte9 ] = createTestSet( XTRAIN, yTRAIN );
[Xtr10, Xte10, ytr10, yte10 ] = createTestSet( XTRAIN, yTRAIN );

end

