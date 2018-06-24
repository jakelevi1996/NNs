% Load training data
load regression_data;

% Parameters
% Number of inputs to the NN:
n_inputs = 1;
% Number of units in each layer (NB for single output, n_units(end) should be 1):
n_units = [5, 1, 5, 1];
% Total number of layers:
n_layers = numel(n_units);



% Initialise states of the network
weights     = initialise_connections(n_units, n_inputs, true);
gradients	= initialise_connections(n_units, n_inputs, false);
activations	= initialise_units(n_units);
deltas      = initialise_units(n_units);


% celldisp(weights);
% celldisp(activations);
% 
% x = linspace(-20, 20);
% y = zeros(size(x));
% 
% % Evaluate network
% for i = 1:numel(x)
%     [ y(i), ~ ] = forwardprop( x(i), weights, activations );
% end
% 
% % figure(1);
% clf;
% plot(x,y);
% grid on;

% accumulate gradients for each data point
for i = 1:4%numel(x_train)
    x = x_train(i);
    target = y_train(i);
    % Evaluate network predictions
    [ y, activations ] = forwardprop( x, weights, activations );
    % Backpropogate deltas through the network
    [ deltas ] = backprop( y, target, weights, deltas, activations );
%     celldisp(deltas);
    [ gradients ] = eval_gradients( deltas, activations, weights, input, gradients );
end
