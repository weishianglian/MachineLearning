function hypothesis = calculate_hypothesis(X, theta, training_example)
    %CALCULATE_HYPOTHESIS This calculates the hypothesis for a given X,
    %theta and specified training example
    
%     hypothesis = 0.0;
    hypothesis = theta(1) * X(training_example, 1) + theta(2) * X(training_example, 2) + theta(3) * X(training_example, 3) + theta(4) * X(training_example, 4) + theta(5) * X(training_example, 5) + theta(6) * X(training_example, 6);
end

