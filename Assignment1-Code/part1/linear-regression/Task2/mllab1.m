%% This loads our data
[X, y] = load_data_ex1();

%% initialize
theta = [0.0, 0.0]; %The weights of our model.

% alpha = 0.01; %The step size for gradient descent.
alpha = 0.00001;
iterations = 50;

%do plotting
do_plot = true;

%% run gradient descent
t = gradient_descent(X, y, theta, alpha, iterations, do_plot);