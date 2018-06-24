function [ connections ] = initialise_connections( n_units, n_inputs, random )
%INITIALISE_CONNECTIONS Initialise a cell array of matrices, with each
%matrix descibing the connections between two adjacent layers of the
%network
%   n_units is a vector containing the number of units in each layer of the
%   network
%   n_inputs is a scalar describing the number of inputs at the first layer
%   of the network
%   random is a boolean, if true then connections are randomly initialised
%   
%   Can be used for initialising weights, gradients

n_layers = numel(n_units);

connections = cell(1, n_layers);

if random, connections{1} = randn(n_units(1), n_inputs + 1);
else connections{1} = zeros(n_units(1), n_inputs + 1); end
for i = 2:n_layers
    if random, connections{i} = randn(n_units(i), n_units(i-1) + 1);
    else connections{i} = zeros(n_units(i), n_units(i-1) + 1); end
end

end

