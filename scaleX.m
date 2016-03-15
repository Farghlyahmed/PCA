function [ scaledX ] = scaleX( X )
% scaleX divides each element of a vector by the standard deviation of 
% that vector
disp('Scaling features....')
numVars = size(X,2);
numSamples = size(X,1);
scaledX = zeros(numSamples,numVars);
for i=1:numVars
    stdDevi = std(X(:,i));
    scaledX(:,i) = X(:,i) ./ stdDevi;
end

end

