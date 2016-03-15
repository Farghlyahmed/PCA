function [ PCA_rsq, PCA_train_rsq, opt_rsq, opt_bvec, Xtest_PCA, XTRAIN_PCA,...
b_pcr1, b_pcr2, b_pcr3, b_pcr4, b_pcr5, b_pcr6, b_pcr7, b_pcr8, b_pcr9, b_pcr10] ...
    = pcrFindNumComponents(Xtest, XTRAIN, ytest, yTRAIN)
% PCRFINDNUMCOMPONENTS Finds best number of principal components for a principal component regression given and 
% Function returns the optimal b-vector and rsq

% Transforming data into an orthogonal set
endXTrainindex = size(XTRAIN);
startXTestindex = endXTrainindex + 1;
PCA_rsq = zeros(1,10);
PCA_train_rsq = zeros(1,10);
totX = [XTRAIN;Xtest];
size(totX);
[ Xrebased, varexplained, coeff, prinComps, S ] = prinCompAnalysis(totX, size(totX,2));
disp('Coefficient matrix')
disp(coeff)
disp('Singular values')
disp(S(1:20,:))
XTRAIN_PCA = prinComps(1:endXTrainindex,:);
Xtest_PCA = prinComps(startXTestindex:end,:);

%Creating test sets
[ Xtr1, Xte1, ytr1, yte1 ] = createTestSet( XTRAIN_PCA, yTRAIN );
[ Xtr2, Xte2, ytr2, yte2 ] = createTestSet( XTRAIN_PCA, yTRAIN );
[ Xtr3, Xte3, ytr3, yte3 ] = createTestSet( XTRAIN_PCA, yTRAIN );
[ Xtr4, Xte4, ytr4, yte4 ] = createTestSet( XTRAIN_PCA, yTRAIN );
[ Xtr5, Xte5, ytr5, yte5 ] = createTestSet( XTRAIN_PCA, yTRAIN );
[ Xtr6, Xte6, ytr6, yte6 ] = createTestSet( XTRAIN_PCA, yTRAIN );
[ Xtr7, Xte7, ytr7, yte7 ] = createTestSet( XTRAIN_PCA, yTRAIN );
[ Xtr8, Xte8, ytr8, yte8 ] = createTestSet( XTRAIN_PCA, yTRAIN );
[ Xtr9, Xte9, ytr9, yte9 ] = createTestSet( XTRAIN_PCA, yTRAIN );
[ Xtr10, Xte10, ytr10, yte10 ] = createTestSet( XTRAIN_PCA, yTRAIN );

% Test 1:
disp('Principal component regression: 12 components')
Xtr1 = Xtr1(:,1:12);
Xte1 = [ ones(size(Xte1,1),1) Xte1(:,1:12)];
[b_pcr1 res_norm_pcr] = linearLS(Xtr1,ytr1)
lm = linearRegression(Xtr1,ytr1)
rsq = calcRsq( Xte1, b_pcr1, yte1 );
disp('R squared')
rsq
PCA_rsq(1,1) = rsq;
Xtr1 = [ ones(size(Xtr1,1),1) Xtr1];
rsq_tr = calcRsq( Xtr1, b_pcr1, ytr1 );
PCA_train_rsq(1,1) = rsq_tr;

% Test 2:
disp('Principal component regression: 11 components')
Xtr2 = Xtr2(:,1:11);
Xte2 = [ ones(size(Xte2,1),1) Xte2(:,1:11)];
[b_pcr2 res_norm_pcr] = linearLS(Xtr2,ytr2)
lm = linearRegression(Xtr2,ytr2)
rsq = calcRsq( Xte2, b_pcr2, yte2 );
disp('R squared')
rsq
PCA_rsq(1,2) = rsq;
Xtr2 = [ ones(size(Xtr2,1),1) Xtr2];
rsq_tr = calcRsq( Xtr2, b_pcr2, ytr2 );
PCA_train_rsq(1,2) = rsq_tr;

% Test 3:
disp('Principal component regression: 10 components')
Xtr3 = Xtr3(:,1:10);
Xte3 = [ ones(size(Xte3,1),1) Xte3(:,1:10)];
[b_pcr3 res_norm_pcr] = linearLS(Xtr3,ytr3)
lm = linearRegression(Xtr3,ytr3)
rsq = calcRsq( Xte3, b_pcr3, yte3 );
disp('R squared')
rsq
PCA_rsq(1,3) = rsq;
Xtr3 = [ ones(size(Xtr3,1),1) Xtr3];
rsq_tr = calcRsq( Xtr3, b_pcr3, ytr3 );
PCA_train_rsq(1,3) = rsq_tr;

% Test 4:
disp('Principal component regression: 9 components')
Xtr4 = Xtr4(:,1:9);
Xte4 = [ ones(size(Xte4,1),1) Xte4(:,1:9)];
[b_pcr4 res_norm_pcr] = linearLS(Xtr4,ytr4)
lm = linearRegression(Xtr4,ytr4)
rsq = calcRsq( Xte4, b_pcr4, yte4 );
disp('R squared')
rsq
PCA_rsq(1,4) = rsq;
Xtr4 = [ ones(size(Xtr4,1),1) Xtr4];
rsq_tr = calcRsq( Xtr4, b_pcr4, ytr4 );
PCA_train_rsq(1,4) = rsq_tr;

% Test 5:
disp('Principal component regression: 8 components')
Xtr5 = Xtr5(:,1:8);
Xte5 = [ ones(size(Xte5,1),1) Xte5(:,1:8)];
[b_pcr5 res_norm_pcr] = linearLS(Xtr5,ytr5)
lm = linearRegression(Xtr5,ytr5)
rsq = calcRsq( Xte5, b_pcr5, yte5 );
disp('R squared')
rsq
PCA_rsq(1,5) = rsq;
Xtr5 = [ ones(size(Xtr5,1),1) Xtr5];
rsq_tr = calcRsq( Xtr5, b_pcr5, ytr5 );
PCA_train_rsq(1,5) = rsq_tr;

% Test 6:
disp('Principal component regression: 7 components')
Xtr6 = Xtr6(:,1:7);
Xte6 = [ ones(size(Xte6,1),1) Xte6(:,1:7)];
[b_pcr6 res_norm_pcr] = linearLS(Xtr6,ytr6)
lm = linearRegression(Xtr6,ytr6)
rsq = calcRsq( Xte6, b_pcr6, yte6 );
disp('R squared')
rsq
PCA_rsq(1,6) = rsq;
Xtr6 = [ ones(size(Xtr6,1),1) Xtr6];
rsq_tr = calcRsq( Xtr6, b_pcr6, ytr6 );
PCA_train_rsq(1,6) = rsq_tr;

% Test 7:
disp('Principal component regression: 6 components')
Xtr7 = Xtr7(:,1:6);
Xte7 = [ ones(size(Xte7,1),1) Xte7(:,1:6)];
[b_pcr7 res_norm_pcr] = linearLS(Xtr7,ytr7)
lm = linearRegression(Xtr7,ytr7)
rsq = calcRsq( Xte7, b_pcr7, yte7 );
disp('R squared')
rsq
PCA_rsq(1,7) = rsq;
Xtr7 = [ ones(size(Xtr7,1),1) Xtr7];
rsq_tr = calcRsq( Xtr7, b_pcr7, ytr7 );
PCA_train_rsq(1,7) = rsq_tr;

% Test 8:
disp('Principal component regression: 5 components')
Xtr8 = Xtr8(:,1:5);
Xte8 = [ ones(size(Xte8,1),1) Xte8(:,1:5)];
[b_pcr8 res_norm_pcr] = linearLS(Xtr8,ytr8)
lm = linearRegression(Xtr8,ytr8)
rsq = calcRsq( Xte8, b_pcr8, yte8 );
disp('R squared')
rsq
PCA_rsq(1,8) = rsq;
Xtr8 = [ ones(size(Xtr8,1),1) Xtr8];
rsq_tr = calcRsq( Xtr8, b_pcr8, ytr8 );
PCA_train_rsq(1,8) = rsq_tr;

% Test 9:
disp('Principal component regression: 4 components')
Xtr9 = Xtr9(:,1:4);
Xte9 = [ ones(size(Xte9,1),1) Xte9(:,1:4)];
[b_pcr9 res_norm_pcr] = linearLS(Xtr9,ytr9)
lm = linearRegression(Xtr9,ytr9)
rsq = calcRsq( Xte9, b_pcr9, yte9 );
disp('R squared')
rsq
PCA_rsq(1,9) = rsq;
Xtr9 = [ ones(size(Xtr9,1),1) Xtr9];
rsq_tr = calcRsq( Xtr9, b_pcr9, ytr9 );
PCA_train_rsq(1,9) = rsq_tr;

% Test 10:
disp('Principal component regression: 3 components')
Xtr10 = Xtr10(:,1:3);
Xte10 = [ ones(size(Xte10,1),1) Xte10(:,1:3)];
[b_pcr10 res_norm_pcr] = linearLS(Xtr10,ytr10)
lm = linearRegression(Xtr10,ytr10)
rsq = calcRsq( Xte10, b_pcr10, yte10 );
disp('R squared')
rsq
PCA_rsq(1,10) = rsq;
Xtr10 = [ ones(size(Xtr10,1),1) Xtr10];
rsq_tr = calcRsq( Xtr10, b_pcr10, ytr10 );
PCA_train_rsq(1,10) = rsq_tr;

PCA_rsq;
opt_bvec = b_pcr8;
opt_rsq = PCA_rsq(1,8);

figure
numcomps = [12,11,10,9,8,7,6,5,4,3]
rsqAll = [PCA_rsq' PCA_train_rsq']
plot(numcomps,rsqAll,'LineWidth',2)
grid on
xlabel('Number of principal components')
ylabel('Principal component regression rsq')
title('{\bf Principal component rsq}')
legend('rsq test','rsq training')

end

