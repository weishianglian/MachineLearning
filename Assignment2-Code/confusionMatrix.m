function [confM, missErr] = confusionMatrix(labels, ph1Likelihood, ph2Likelihood)
    prep = [ph1Likelihood, ph2Likelihood]; % col1, col2: likelihood of ph1 and ph2
    prep(:,3)=(ph2Likelihood > ph1Likelihood)+1; % col3: predicted results
    prep(:,4) = labels; % col4: actual fact of ph1 and ph2
    prep(:,5) = (prep(:,3)==prep(:,4)); % col5: compared results
    
    % calculate the confusion matrix
    confM = zeros(2,2);
    confM(1,1) = sum(sum((prep(:,3:4)==[1,1]), 2)==2);
    confM(1,2) = sum(sum((prep(:,3:4)==[1,2]), 2)==2);
    confM(2,1) = sum(sum((prep(:,3:4)==[2,1]), 2)==2);
    confM(2,2) = sum(sum((prep(:,3:4)==[2,2]), 2)==2);
    
    % calculate the miss-clasification error
    missErr = sum(sum(confM - confM.*eye(2)))/sum(confM(1:end));
end