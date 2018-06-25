% Load training data
load regression_data;
figure(1); clf;

% Parameters
% Number of inputs to the NN:
n_inputs = 1;
% Number of units in each layer (NB for single output, n_units(end) should be 1):
n_units = [4, 4, 1];
% Total number of layers:
n_layers = numel(n_units);



% Initialise states of the network
weights     = initialise_connections(n_units, n_inputs, true);
activations	= initialise_units(n_units);
deltas      = initialise_units(n_units);



n_iterations = 1000;
learning_rate = 0.002;

while true
for i = 1:n_iterations
    y_predict = zeros(size(x_train));

    gradients = initialise_connections(n_units, n_inputs, false);

    % evaluate predictions and accumulate gradients for each data point
    for j = 1:numel(x_train)
        x = x_train(j);
        target = y_train(j);
        % Evaluate network predictions
        [ y_predict(j), activations ] = forwardprop( x, weights, activations );
        % Backpropogate deltas through the network
        deltas = backprop( y_predict(j), target, weights, deltas, activations );
        % Evaluate gradients
        new_gradients = eval_gradients( deltas, activations, x, gradients );
        % Sum the gradient from each data point
        for k = 1:length(gradients), gradients{k} = gradients{k} + new_gradients{k}; end
    end
    
    % Update each weight
    for k = 1:length(weights)
        weights{k} = weights{k} - learning_rate*gradients{k};
    end

    % celldisp(gradients);
    E = eval_error_function(y_predict, y_train)
    
%     celldisp(activations); celldisp(deltas);
%     celldisp(gradients); celldisp(weights);
plot(x_train, y_train, 'bx', x_train, y_predict, 'r');
grid on; drawnow;

end
end
