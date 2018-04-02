function [ph1Likelihood, ph2Likelihood, phClass] = classifier(testData, K, ph1Mu, ph1S2, ph1P, ph2Mu, ph2S2, ph2P)
    % initialise likelihood vector for the two MoG models
    [n, D] = size(testData);
    ph1Likelihood = zeros(n, K);
    ph2Likelihood = zeros(n, K);

    % use the hypothesis to calculate the probability
    for ph1K = 1:K
        ph1Likelihood(:,ph1K) = ph1P(ph1K) * (2*pi)^(-D/2) * det(ph1S2(:,:,K))^(-1/2) * ...
            exp(-1/2*sum((testData'-repmat(ph1Mu(:,ph1K),1,n))'*inv(ph1S2(:,:,ph1K)).*...
            (testData'-repmat(ph1Mu(:,ph1K),1,n))', 2));
    end
    for ph2K = 1:K
        ph2Likelihood(:,ph2K) = ph2P(ph2K) * (2*pi)^(-D/2) * det(ph2S2(:,:,K))^(-1/2) * ...
            exp(-1/2*sum((testData'-repmat(ph2Mu(:,ph2K),1,n))'*inv(ph2S2(:,:,ph2K)).*...
            (testData'-repmat(ph2Mu(:,ph2K),1,n))', 2));
    end
    
    % sum the probability from each Gaussian model to express a MoGs
    ph1Likelihood = sum(ph1Likelihood, 2);
    ph2Likelihood = sum(ph2Likelihood, 2);
    
    % classfiy phoneme betwee 1 and 2
    phClass = (sum(ph2Likelihood) > sum(ph1Likelihood))+1;
end