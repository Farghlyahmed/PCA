# Principal Component Analysis
## Matlab code and data
Matlab code to compare the performance of principal component regression, linear regression and ridge regression in predicting the median household income

This code accompanies a paper on Principal Component Analysis (PCA). It explains what PCA is, the underlying mathematics and explores when it is and is not useful for data analysis. See www.learningmachinelearning.org to access the paper

run Z1_USCountiesAnalysis2_v2.m then Z1_USCounties_holdouttest.m to run the analysis

Dependencies:
Matlab Statistical and machine learning tool box. Functions used from this tool box    
* datasample
  * datasample_alt.m is an alternative implementation to the toolbox function. To use this change line 15 of creatTestTrainSets_v2.m and line 6 of createTestSet.m
* fitlm
* ridge
