function [ idx ] = datasample(num_samples, size_Test)
%DATASAMPLE Randomly samples a number of unique indices in the range from 1 to the num_samples
% number of indices = size_Test

idx = randi([1 num_samples],1,size_Test);
%disp(idx)
idx = unique(idx);
while size(idx) < size_Test
    num = randi([1 num_samples],1,1);
    idx = [idx num];
    idx = unique(idx);
    %disp(idx)
end

