function theta = gradient_descent(X, y, theta, alpha, iterations, l, do_plot)
    %GRADIENT_DESCENT do Gradient Descent for a given X, y, theta, alpha
    %for a specified number of iterations

    %if less than 6 arguments was given, then set do_plot to be false
    if nargin < 6
        do_plot = false;
    end
    if(do_plot)
        plot_hypothesis(X, y, theta);
        drawnow; pause(0.1); 
    end

    m = size(X, 1); %number of training examples
    cost_vector = []; %will store the results of our cost function

    for it = 1:iterations
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % gradient descent
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        theta_0 = theta(1);
        theta_1 = theta(2);
        theta_2 = theta(3);
        theta_3 = theta(4);
        theta_4 = theta(5);
        theta_5 = theta(6);

        %update theta(1) and store in temporary variable theta_0
        sigma = 0.0;

        for i = 1:m
            hypothesis = calculate_hypothesis(X, theta, i);
            output = y(i);
            sigma = sigma + (hypothesis - output);
        end

        theta_0 = theta_0 - ((alpha * 1.0) / m) * sigma;


        %update theta(2) and store in temporary variable theta_1
        sigma = 0.0;

        for i = 1:m
            hypothesis = calculate_hypothesis(X, theta, i);
            output = y(i);
            sigma = sigma + (hypothesis - output) * X(i, 2);
        end

        theta_1 = theta_1 * (1 - alpha * l / m) - ((alpha * 1.0) / m) * sigma;
        
        %update theta(3) and store in temporary variable theta_2
        sigma = 0.0;

        for i = 1:m
            hypothesis = calculate_hypothesis(X, theta, i);
            output = y(i);
            sigma = sigma + (hypothesis - output) * X(i, 3);
        end

        theta_2 = theta_2 * (1 - alpha * l / m) - ((alpha * 1.0) / m) * sigma;
        
        %update theta(4) and store in temporary variable theta_3
        sigma = 0.0;

        for i = 1:m
            hypothesis = calculate_hypothesis(X, theta, i);
            output = y(i);
            sigma = sigma + (hypothesis - output) * X(i, 4);
        end

        theta_3 = theta_3 * (1 - alpha * l / m) - ((alpha * 1.0) / m) * sigma;
        
        %update theta(5) and store in temporary variable theta_4
        sigma = 0.0;

        for i = 1:m
            hypothesis = calculate_hypothesis(X, theta, i);
            output = y(i);
            sigma = sigma + (hypothesis - output) * X(i, 5);
        end

        theta_4 = theta_4 * (1 - alpha * l / m) - ((alpha * 1.0) / m) * sigma;
        
        %update theta(6) and store in temporary variable theta_5
        sigma = 0.0;

        for i = 1:m
            hypothesis = calculate_hypothesis(X, theta, i);
            output = y(i);
            sigma = sigma + (hypothesis - output) * X(i, 6);
        end

        theta_5 = theta_5 * (1 - alpha * l / m) - ((alpha * 1.0) / m) * sigma;

        %update theta
        theta = [theta_0, theta_1, theta_2, theta_3, theta_4, theta_5];

        %update cost_vector
        cost_vector = [cost_vector; compute_cost_regularised(X, y, theta, l)];

        if do_plot
            plot_hypothesis(X, y, theta);
            drawnow; pause(0.1); 
        end
    end

    disp 'Gradient descent is finished.'
        
    if do_plot
        disp 'Press enter!'
        pause;
    end

    plot_cost(cost_vector);
        
    disp 'Press enter!';
    pause;
end