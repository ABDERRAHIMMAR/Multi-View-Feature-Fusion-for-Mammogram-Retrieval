function [trainZ,testZ] = ccaFuse(trainLBPHF, trainMSH,trainMCC, testLBPHF, testMSH,testMCC, mode)
% CCAFUSE applies feature level fusion using a method based on Canonical
% Correlation Analysis (CCA). 
% Feature fusion is the process of combining two feature vectors to obtain 
% a single feature vector, which is more discriminative than any of the 
% input feature vectors. 
% CCAFUSE gets the train and test data matrices from two modalities X & Y,
% and consolidates them into a single feature set 
% hadhi normalement il fonction ili bech na3mlou beha il fusion
% 
%   Details can be found in:
%   
%   M. Haghighat, M. Abdel-Mottaleb, W. Alhalabi, "Fully Automatic Face 
%   Normalization and Single Sample Face Recognition in Unconstrained 
%   Environments," Expert Systems With Applications, vol. 47, pp. 23-34, 
%   April 2016.
%   http://dx.doi.org/10.1016/j.eswa.2015.10.047
% effectivement hadhi hya
% 
% Inputs:
%       trainX	:	nxp matrix containing the first set of training data
%                   n:  number of training samples
%                   p:  dimensionality of the first feature set
% 
%       trainY	:	nxq matrix containing the second set of training data
%                   q:  dimensionality of the second feature set
% 
%       testX	:	mxp matrix containing the first set of test data
%                   m:  number of test samples
% 
%       testY	:	mxq matrix containing the second set of test data
% 
%       mode    :   fusion mode: 'concat' or 'sum' (default: 'sum')
% 
% Outputs:
%       trainZ  :   matrix containing the fused training data
%       testZ   :   matrix containing the fused test data
% 
% 
% Sample use:
% [trainZ,testZ] = ccaFuse(trainX, trainY, testX, testY, 'sum');
% 
% 
% (C)	Mohammad Haghighat, University of Miami
%       haghighat@ieee.org
%       PLEASE CITE THE ABOVE PAPER IF YOU USE THIS CODE.


[n,p] = size(trainLBPHF);
if size(trainMSH,1) ~= n
    error('trainX and trainY must have the same number of samples.');
elseif n == 1
    error('trainX and trainY must have more than one sample.');
end
q = size(trainMSH,2);


if size(testLBPHF,2) ~= p
    error('trainX and testX must have the same dimensions.');
end

if size(testMSH,2) ~= q
    error('trainY and testY must have the same dimensions.');
end

if size(testLBPHF,1) ~= size(testMSH,1)
    error('testX and testY must have the same number of samples.');
end

if ~exist('mode', 'var')
    mode = 'sum';	% Default fusion mode
end


%% Center the variables

meanMCC = mean(trainLBPHF);
meanMSH = mean(trainMSH);
trainLBHF = bsxfun(@minus, trainLBHF, meanMCC);
testLBPHF = bsxfun(@minus, testLBPHF,  meanMCC);
trainMSH = bsxfun(@minus, trainMSH, meanMSH);
testMSH  = bsxfun(@minus, testMSH,  meanMSH);


% %% Dimensionality reduction using PCA for the first data X
% 
% % Calculate the covariance matrix
% if n >= p
%     C = trainMCC' * trainMCC;	% pxp
% else
%     C = trainMCC  * trainMCC';	% nxn
% end
% 
% % Perform eigenvalue decomposition
% [eigVecs, eigVals] = eig(C);
% eigVals = abs(diag(eigVals));
% 
% % Ignore zero eigenvalues
% maxEigVal = max(eigVals);
% zeroEigIdx = find((eigVals/maxEigVal)<1e-6);
% eigVals(zeroEigIdx) = [];
% eigVecs(:,zeroEigIdx) = [];
% 
% % Sort in descending order
% [~,index] = sort(eigVals,'descend');
% eigVals = eigVals(index);
% eigVecs = eigVecs(:,index);
% 
% % Obtain the projection matrix
% if n >= p
%     Wxpca = eigVecs;
% else
%     Wxpca = trainMCC' * eigVecs * diag(1 ./ sqrt(eigVals));
% end
% clear C eigVecs eigVals maxEigVal zeroEigIndex
% 
% % Update the first train and test data
% trainMCC = trainMCC * Wxpca;
% testMCC = testMCC * Wxpca;
% 
% 
% %% Dimensionality reduction using PCA for the second data Y
% 
% % Calculate the covariance matrix
% if n >= q
%     C = trainMSH' * trainMSH;	% qxq
% else
%     C = trainMSH  * trainMSH';	% nxn
% end
% 
% % Perform eigenvalue decomposition
% [eigVecs, eigVals] = eig(C);
% eigVals = abs(diag(eigVals));
% 
% % Ignore zero eigenvalues
% maxEigVal = max(eigVals);
% zeroEigIndex = find((eigVals/maxEigVal)<1e-6);
% eigVals(zeroEigIndex) = [];
% eigVecs(:,zeroEigIndex) = [];
% 
% % Sort in descending order
% [~,index] = sort(eigVals,'descend');
% eigVals = eigVals(index);
% eigVecs = eigVecs(:,index);
% 
% % Obtain the projection matrix
% if n >= q
%     Wypca = eigVecs;
% else
%     Wypca = trainMSH' * eigVecs * diag(1 ./ sqrt(eigVals));
% end
% clear C eigVecs eigVals maxEigVal zeroEigIndex
% 
% % Update the second train and test data
% trainMSH = trainMSH * Wypca;
% testMSH = testMSH * Wypca;


%% Fusion using Canonical Correlation Analysis (CCA)

[Wxcca,Wycca] = canoncorr(trainLBPHF,trainMSH);

trainLBPHFcca = trainLBPHF * Wxcca;
trainMSHcca = trainMSH * Wycca;
testLBPHFcca = testLBPHF * Wxcca;
testMSHcca = testMSH * Wycca;

if strcmp(mode, 'concat')	% Fusion by concatenation (Z1)
    trainZ = [trainLBPHFcca, trainMSHcca];
    testZ  = [testLBPHFcca, testMSHcca];
else                        % Fusion by summation (Z2)
    trainZ = trainLBPHFcca + trainMSHcca;
    testZ  = testLBPHFcca + testMSHcca;
end