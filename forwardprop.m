function [ output, activations ] = forwardprop( input, weights, activations )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

n_layers = length(weights);

% Activations of first hidden layer using input
activations{1} = weights{1} * [input; 1];

% Activations of intermediate hidden layers with tanh activation functions
for i = 2:(n_layers)
    activations{i} = weights{i} * tanh([activations{i-1}; 1]);
end

% For regression:
output = activations{end};

% For classification:
% output = logistic(activations{end});

end

