function [ deltas ] = backprop( output, target, weights, deltas, activations )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

% Evaluate deltas for final layer of the network
deltas{end} = output - target;

% Backpropogate deltas through the network
for i = (length(deltas)-1) : -1 : 1
    deltas{i} =	(weights{i+1}(:, 1:end-1)'*deltas{i+1}) ...
                ./ (sech(activations{i}).^2);
end

end
