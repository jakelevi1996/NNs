function [ deltas ] = backprop( output, target, weights, deltas, activations )
%BACKPROP calculate the 'delta' for each unit/neuron, which is the partial
%derivative of the error function with respect to the activation of that
%unit. The deltas in the final layer are calculated directly, whereas the
%deltas for all other units are calculated as a function of the deltas of
%units to which the current unit has outgoing connections (IE the units of
%the layer in front). 
%The deltas can be multiplied by the inputs to a neuron in order to
%evaluate the gradient of the error function with respect to a weight.
%   Detailed explanation goes here

% Evaluate deltas for final layer of the network
deltas{end} = output - target;

% Backpropogate deltas through the network
for i = (length(deltas)-1) : -1 : 1
    deltas{i} =	(weights{i+1}(:, 1:end-1)'*deltas{i+1}) ...
                ./ (sech(activations{i}).^2);
end

end
