clear all; close all;
% load the dataset
load('PB_data.mat');
% get phoneme 1, 2 data from the first and second formant frequencies
ph1F1 = f1(phno==1); ph1F2 = f2(phno==1);
ph2F1 = f1(phno==2); ph2F2 = f2(phno==2);
% load the arguments (p, mu, s2) of mog model built in task2
% mog of phoneme1,2 and K=3
K = 6;
% load('ph1K3M.mat'); 
% load('ph2K3M.mat');
load('ph1K6M.mat');
load('ph2K6M.mat');

% find the minimum and the maximum value of F1 and F2 for the first two phonemes
minF1 = min([ph1F1; ph2F1]);
maxF1 = max([ph1F1; ph2F1]);
minF2 = min([ph1F2; ph2F2]);
maxF2 = max([ph1F2; ph2F2]);
M = zeros(length(minF2:maxF2), length(minF1:maxF1));

% loop for filling classification matrix
for i = minF2:maxF2
    for j = minF1:maxF1
       [ph1Likelihood, ph2Likelihood, phClass] = classifier([j, i], K, ph1Mu, ph1S2, ph1P, ph2Mu, ph2S2, ph2P);
        M(i-minF2+1, j-minF1+1) = phClass;
    end
end
figure; imagesc([100 700], [1500 4000], M); set(gca, 'YDir', 'normal');