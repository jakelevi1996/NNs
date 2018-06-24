% Parameters
% Number of inputs to the NN:
n_inputs = 1;
% Number of units in each layer (NB for single output, n_units(end) should be 1):
n_units = [3, 1];
% Total number of layers:
n_layers = numel(n_units);



% Initialise weights (including biases) for inputs to each unit
weights = cell(1, n_layers);
weights{1} = randn(n_units(1), n_inputs + 1);
for i = 2:n_layers
    weights{i} = randn(n_units(i), n_units(i-1) + 1);
end

% Initialise cell array to store activations for each layer of units
activations = cell(1, n_layers);
for i = 1:n_layers
    activations{i} = zeros(n_units(i), 1);
end


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