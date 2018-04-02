%% load data
load('PB_data.mat'); % get data phno, f0, f1, f2 and f3
J = [f1, f2]; % only use the dataset for F1 and F2
figure; plot(J(:,1), J(:,2), '.'); % produce a plot of F1 against F2
xlabel('F1'); ylabel('F2');