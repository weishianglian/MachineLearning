clear all; close all;
% load the dataset
load('PB_data.mat');

% get phoneme 1, 2 data from the first and second formant frequencies
ph1F1 = f1(phno==1); ph1F2 = f2(phno==1);
ph2F1 = f1(phno==2); ph2F2 = f2(phno==2);
ph1Data = [ph1F1, ph1F2]; ph2Data = [ph2F1, ph2F2];

% show the discriminated results
figure; hold on;
plot(ph1Data(:,1), ph1Data(:,2), '.b');
plot(ph2Data(:,1), ph2Data(:,2), '.r');
xlabel('F1'); ylabel('F2'); hold off;

% load the arguments (p, mu, s2) of mog model built in task2
% mog of phoneme1,2 and K=3
K = 3;
load('ph1K3M.mat'); 
load('ph2K3M.mat');
% load('ph1K6M.mat');
% load('ph2K6M.mat');

% put test data and information
testData = [ph1Data; ph2Data];
[n, D] = size(testData);

% classification function
[ph1Likelihood, ph2Likelihood, phClass] = classifier(testData, K, ph1Mu, ph1S2, ph1P, ph2Mu, ph2S2, ph2P);
ph1Vector = testData(((ph2Likelihood > ph1Likelihood)+1)==1, :);
ph2Vector = testData(((ph2Likelihood > ph1Likelihood)+1)==2, :);

% label the testData with phonemes
labels = ones(length(testData), 1); 
labels(length(ph1Data)+1:end, 1) = 2;

% calculate the confusion matrix and get miss classification error
[confM, missErr] = confusionMatrix(labels, ph1Likelihood, ph2Likelihood);

% show the discriminated results
figure; hold on;
plot(ph1Vector(:,1), ph1Vector(:,2), '.b');
plot(ph2Vector(:,1), ph2Vector(:,2), '.r');
xlabel('F1'); ylabel('F2'); hold off;

    