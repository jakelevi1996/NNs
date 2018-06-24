function [ units ] = initialise_units( n_units )
%INITIALISE_UNITS initialise a cell array of vectors, in which each vector
%corresponds to a layer of the network, and each element corresponds to a
%unit within the layer
%   n_units is a vector containing the number of units in each layer of the
%   network
%   
%   Can be used for initialising activations, deltas for each unit


% Total number of layers:
n_layers = numel(n_units);

% Initialise cell array
units = cell(1, n_layers);

% Initialise vector of zeros for each layer, with each element
% corresponding to a unit
for i = 1:n_layers
    units{i} = zeros(n_units(i), 1);
end

end

