disp('Analysis of US counties data: 15 features')
clear

% Source: census.gov http : //quickfacts.census.gov/qfd/downloaddata.html
load('counties_data.mat')
load('counties_result.mat')
X = counties_data;
% Y = median household income 2007 - 2013
y = counties_result(:,2);

% Variable selection
% Population measures: 
% 1: pop 2014: 2
% 2: pop 2010 April: 3
% 3: pop 2010: 5
% 4: Veterans: 23
% 5: Housing Units: 25
% 6: Private non farm employment (abs): 33
% 7: Total number of firms: 36
% 8: Manfacturing shipments (value) 43
% 9: Retail sales (value) 45
% 10: Accommodation and food services sales (value) 47
% 11: Foreign born persons (%): 19
% 12: High school graduate or higher (%): 21
% 13: Bachelor's degree or higher (%): 22
% 14: Persons below the poverty level (%): 31
% 15: Women owned firms (%): 42

numsamples = (size(X,1));
finalX = zeros(numsamples,15);
index_data = [2, 3, 5, 23, 25, 33, 36, 43, 45, 47, 19, 21, 22, 31, 42];
for i=1:15
    finalX(:,i) = X(:,index_data(i));
end

% Scaling and mean normalizing features
fig = figure
fig.Position = [100 100 950 950]
plotStateData2(finalX,y,'Counties 2: raw data')
    
finalX = meanNormalize(finalX);
finalX = scaleX(finalX);
disp('Feature covariance matrix')
cov_features = (finalX' * finalX) * (1 / (numsamples - 1))
[meanx varx] = meanVarsX(finalX)

fig = figure
fig.Position = [100 100 950 950]
plotStateData3(finalX,y,'Counties 2: norm,sc')

% Generating training and test datasets
[ Xtest, XTRAIN, Xtr1, Xtr2, Xtr3, Xtr4, Xtr5, Xtr6, Xtr7, Xtr8, Xtr9, Xtr10, ...
                 Xte1, Xte2, Xte3, Xte4, Xte5, Xte6, Xte7, Xte8, Xte9, Xte10, ...
  ytest, yTRAIN, ytr1, ytr2, ytr3, ytr4, ytr5, ytr6, ytr7, ytr8, ytr9, ytr10, ...
                 yte1, yte2, yte3, yte4, yte5, yte6, yte7, yte8, yte9, yte10 ...
           ] = createTestTrainSets_v2( finalX, y );

disp('Training models on training data...')       
disp('Unregularised linear regression')
[b_lr res_norm_lr] = linearLS(XTRAIN,yTRAIN)
lm = linearRegression(XTRAIN,yTRAIN)
% Calculating R squared
RSS_lr = res_norm_lr^2;
totalRes = yTRAIN - mean(yTRAIN);
TSS_lr = norm(totalRes)^2;
disp('R Squared')
rsq_lr = 1 - RSS_lr / TSS_lr

disp('Ridge regression')
[ k, RR_rsq_train, RR_rsq_test, rr_opt_bvec, rr_opt_rsq, RR_all_bvec ] = ridgeFindK( Xtr1, Xtr2, Xtr3, Xtr4, Xtr5, ...
                                        Xtr6, Xtr7, Xtr8, Xtr9, Xtr10, ...
                                        ytr1, ytr2, ytr3, ytr4, ytr5, ...
                                        ytr6, ytr7, ytr8, ytr9, ytr10, ...
                                        Xte1, Xte2, Xte3, Xte4, Xte5, ...
                                        Xte6, Xte7, Xte8, Xte9, Xte10, ...
                                        yte1, yte2, yte3, yte4, yte5, ...
                                        yte6, yte7, yte8, yte9, yte10);

disp('Principle component analysis')
[ PCA_rsq, PCA_train_rsq, pcr_opt_rsq, pcr_opt_bvec, Xtest_PCA, XTRAIN_PCA...
 b_pcr1, b_pcr2, b_pcr3, b_pcr4, b_pcr5, b_pcr6, b_pcr7, b_pcr8, b_pcr9, b_pcr10] ...
    = pcrFindNumComponents(Xtest, XTRAIN, ytest, yTRAIN);

disp('b vector: linear regression')
disp(b_lr)
rsq_lr
disp('Ridge regression: test rsq')
RR_rsq_test
disp('Ridge regression: training rsq')
RR_rsq_train
disp('Ridge regression: b vector')
rr_opt_bvec
rr_opt_rsq
disp('Ridge regression: all bvectors')
RR_all_bvec
disp('Principal component regression: test rsq')
disp(PCA_rsq)
disp('Principal component regression: training rsq')
disp(PCA_train_rsq)
disp('Principal component regression: b vector')
disp(pcr_opt_bvec)
pcr_opt_rsq
disp('Principal component regression: all b vectors')
b_pcr1
b_pcr2
b_pcr3
b_pcr4
b_pcr5
b_pcr6
b_pcr7
b_pcr8
b_pcr9
b_pcr10

save Z1_USCountiesAnalysis2_Results_v2.mat Xtest_PCA Xtest ytest b_lr pcr_opt_bvec rr_opt_bvec

disp('Combining linear regression and pcr')
XTrainall = [XTRAIN XTRAIN_PCA(:,1:5)];
[b_comb res_norm_comb] = linearLS(XTrainall,yTRAIN);
lm = linearRegression(XTRAIN,yTRAIN);
XTrainall = [ones(size(XTrainall,1),1) XTrainall];
rsq_train_lrANDpcr = calcRsq( XTrainall, b_comb, yTRAIN )
XTestall = [Xtest Xtest_PCA(:,1:5)];
XTestall = [ones(size(XTestall,1),1) XTestall];
rsq_test_lrANDpcr = calcRsq( XTestall, b_comb, ytest)

disp('Combining ridge regression and pcr')
XTrainall = [XTRAIN XTRAIN_PCA(:,1:5)];
b_comb2 = ridge(yTRAIN,XTrainall,3,0);
XTrainall = [ones(size(XTrainall,1),1) XTrainall];
rsq_train_rrANDpcr = calcRsq( XTrainall, b_comb2, yTRAIN )
XTestall = [Xtest Xtest_PCA(:,1:5)];
XTestall = [ones(size(XTestall,1),1) XTestall];
rsq_test_rrANDpcr = calcRsq( XTestall, b_comb2, ytest)

save Z1_USCountiesAnalysis2_Results_v2_Comb.mat rsq_train_lrANDpcr rsq_test_lrANDpcr...
    rsq_train_rrANDpcr rsq_test_rrANDpcr