disp('Final results of USCounties_Analysis using holdout dataset')

load Z1_USCountiesAnalysis2_Results_v2.mat

Xtest = [ones(size(Xtest,1),1) Xtest];
Xtest_PCA = [ones(size(Xtest_PCA,1),1) Xtest_PCA];
rsq_lr = calcRsq( Xtest, b_lr, ytest )
rsq_rr = calcRsq( Xtest, rr_opt_bvec, ytest )
sizepcrvec = size(pcr_opt_bvec,1);
Xtest_PCA = Xtest_PCA(:,1:sizepcrvec);
rsq_pcr = calcRsq( Xtest_PCA, pcr_opt_bvec, ytest )

save Z1_USCountiesAnalysis2_FinalResults.mat rsq_lr rsq_rr rsq_pcr