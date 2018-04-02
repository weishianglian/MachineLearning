%% This loads our data
[X, y] = load_data_ex2();

%% Normalise and initialize.
[X, mean_vec, std_vec] = normalise_features(X);

%after normalising we add the bias
X = [ones(size(X, 1), 1), X];

%initialise theta
theta = [0.0, 0.0, 0.0];
alpha = 0.001;
iterations = 10000;

%% 
t = gradient_descent(X, y, theta, alpha, iterations);
disp 'Press enter to exit!';
pause;

%% use trained theta values to make predictions
Z = [1650,3; 3000,4];
rows = size(Z, 1);
Z =(Z - ones(rows, 1) * mean_vec) ./ (ones(rows, 1) * std_vec);
Z = [ones(rows, 1), Z];
predicted_price = zeros(rows, 1);
for i=1:size(Z, 1)
    predicted_price(i) = calculate_hypothesis(Z, t, i);
end


