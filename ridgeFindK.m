function [ opt_k, RR_rsq_train, RR_rsq_test, opt_bvec, opt_rsq, b_all ] = ridgeFindK( Xtr1, Xtr2, Xtr3, Xtr4, Xtr5, ...
                                        Xtr6, Xtr7, Xtr8, Xtr9, Xtr10, ...
                                        ytr1, ytr2, ytr3, ytr4, ytr5, ...
                                        ytr6, ytr7, ytr8, ytr9, ytr10, ...
                                        Xte1, Xte2, Xte3, Xte4, Xte5, ...
                                        Xte6, Xte7, Xte8, Xte9, Xte10, ...
                                        yte1, yte2, yte3, yte4, yte5, ...
                                        yte6, yte7, yte8, yte9, yte10)
% RIDGEFINDK finds the optimal weight, k, on the regularization component of the ridge regression cost function. 
% k = 0 --> linear regression, k --> infinity --> constant function

disp('Ridge regression')
k_choices = [0.001,0.003,0.01,0.03,0.1,0.3,1,3,10,30]
b_all = zeros(size(Xtr1,2)+1,10); 
size(b_all);
size(k_choices);
size(Xtr1);
size(ytr1);

b_all(:,1) = ridge(ytr1,Xtr1,k_choices(1,1),0);
b_all(:,2) = ridge(ytr2,Xtr2,k_choices(1,2),0);
b_all(:,3) = ridge(ytr3,Xtr3,k_choices(1,3),0);
b_all(:,4) = ridge(ytr4,Xtr4,k_choices(1,4),0);
b_all(:,5) = ridge(ytr5,Xtr5,k_choices(1,5),0);
b_all(:,6) = ridge(ytr6,Xtr6,k_choices(1,6),0);
b_all(:,7) = ridge(ytr7,Xtr7,k_choices(1,7),0);
b_all(:,8) = ridge(ytr8,Xtr8,k_choices(1,8),0);
b_all(:,9) = ridge(ytr9,Xtr9,k_choices(1,9),0);
b_all(:,10) = ridge(ytr10,Xtr10,k_choices(1,10),0);

b_all;
figure
plot(log(k_choices),b_all,'LineWidth',2)
grid on
xlabel('Ridge Parameter (log scale)')
ylabel('Standardized Coefficient')
title('{\bf Ridge Trace}')
legend('x1','x2','x3','x4','x5','x6','x7','x8', ...
    'x9','x10','x11','x12','x13','x14','x15')

bnorms = zeros(1,10);
for i=1:10
    bnorms(1,i) = norm(b_all(:,i));
end
bnorms

RR_rsq_train = zeros(1,10);
RR_rsq_test = zeros(1,10);
Xtr1 = [ ones(size(Xtr1,1),1) Xtr1];
Xte1 = [ ones(size(Xte1,1),1) Xte1];
rsq_tr = calcRsq( Xtr1, b_all(:,1), ytr1 );
rsq_te = calcRsq( Xte1, b_all(:,1), yte1 );
RR_rsq_train(1,1) = rsq_tr;
RR_rsq_test(1,1) = rsq_te;

Xtr2 = [ ones(size(Xtr2,1),1) Xtr2];
Xte2 = [ ones(size(Xte2,1),1) Xte2];
rsq_tr = calcRsq( Xtr2, b_all(:,2), ytr2 );
rsq_te = calcRsq( Xte2, b_all(:,2), yte2 );
RR_rsq_train(1,2) = rsq_tr;
RR_rsq_test(1,2) = rsq_te;

Xtr3 = [ ones(size(Xtr3,1),1) Xtr3];
Xte3 = [ ones(size(Xte3,1),1) Xte3];
rsq_tr = calcRsq( Xtr3, b_all(:,3), ytr3 );
rsq_te = calcRsq( Xte3, b_all(:,3), yte3 );
RR_rsq_train(1,3) = rsq_tr;
RR_rsq_test(1,3) = rsq_te;

Xtr4 = [ ones(size(Xtr4,1),1) Xtr4];
Xte4 = [ ones(size(Xte4,1),1) Xte4];
rsq_tr = calcRsq( Xtr4, b_all(:,4), ytr4 );
rsq_te = calcRsq( Xte4, b_all(:,4), yte4 );
RR_rsq_train(1,4) = rsq_tr;
RR_rsq_test(1,4) = rsq_te;

Xtr5 = [ ones(size(Xtr5,1),1) Xtr5];
Xte5 = [ ones(size(Xte5,1),1) Xte5];
rsq_tr = calcRsq( Xtr5, b_all(:,5), ytr5 );
rsq_te = calcRsq( Xte5, b_all(:,5), yte5 );
RR_rsq_train(1,5) = rsq_tr;
RR_rsq_test(1,5) = rsq_te;

Xtr6 = [ ones(size(Xtr6,1),1) Xtr6];
Xte6 = [ ones(size(Xte6,1),1) Xte6];
rsq_tr = calcRsq( Xtr6, b_all(:,6), ytr6 );
rsq_te = calcRsq( Xte6, b_all(:,6), yte6 );
RR_rsq_train(1,6) = rsq_tr;
RR_rsq_test(1,6) = rsq_te;

Xtr7 = [ ones(size(Xtr7,1),1) Xtr7];
Xte7 = [ ones(size(Xte7,1),1) Xte7];
rsq_tr = calcRsq( Xtr7, b_all(:,7), ytr7 );
rsq_te = calcRsq( Xte7, b_all(:,7), yte7 );
RR_rsq_train(1,7) = rsq_tr;
RR_rsq_test(1,7) = rsq_te;

Xtr8 = [ ones(size(Xtr8,1),1) Xtr8];
Xte8 = [ ones(size(Xte8,1),1) Xte8];
rsq_tr = calcRsq( Xtr8, b_all(:,8), ytr8 );
rsq_te = calcRsq( Xte8, b_all(:,8), yte8 );
RR_rsq_train(1,8) = rsq_tr;
RR_rsq_test(1,8) = rsq_te;

Xtr9 = [ ones(size(Xtr9,1),1) Xtr9];
Xte9 = [ ones(size(Xte9,1),1) Xte9];
rsq_tr = calcRsq( Xtr9, b_all(:,9), ytr9 );
rsq_te = calcRsq( Xte9, b_all(:,9), yte9 );
RR_rsq_train(1,9) = rsq_tr;
RR_rsq_test(1,9) = rsq_te;

Xtr10 = [ ones(size(Xtr10,1),1) Xtr10];
Xte10 = [ ones(size(Xte10,1),1) Xte10];
rsq_tr = calcRsq( Xtr10, b_all(:,10), ytr10 );
rsq_te = calcRsq( Xte10, b_all(:,10), yte10 );
RR_rsq_train(1,10) = rsq_tr;
RR_rsq_test(1,10) = rsq_te;

opt_bvec = b_all(:,8);
opt_rsq = RR_rsq_test(1,8);
opt_k = k_choices(1,8);

figure
rsqAll = [RR_rsq_test' RR_rsq_train'];
plot(log(k_choices),rsqAll,'LineWidth',2)
grid on
xlabel('Value of k (log scale)')
ylabel('Ridge regression rsq')
title('{\bf Ridge regression rsq}')
legend('rsq test','rsq training')

end

