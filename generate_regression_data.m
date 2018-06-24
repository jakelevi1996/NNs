n_points = 100;
train_ratio = 0.75;

% x = linspace(0.3, 2.8, n_points);
% y = sin(2*pi*x) + .1*exp(x);
x = linspace(-1,1);
y = x.^2;

% figure(1); clf;
% plot(x, y);
% grid on;

inds = (rand(size(x)) <= train_ratio);

x_train = x;
y_train = y;
x_test = [];
y_test = [];

while (numel(x_train) > n_points*train_ratio)
    ind = randi(numel(x_train));
    
    x_test = [x_test x_train(ind)];
    y_test = [y_test y_train(ind)];
    
    x_train(ind) = [];
    y_train(ind) = [];
end

figure(2); clf;
plot(x_train, y_train, 'bx', x_test, y_test, 'rx');
grid on; legend('Training data', 'Test data');

save regression_data x_train y_train x_test y_test