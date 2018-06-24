function [ gradients ] = eval_gradients( deltas, activations, input, gradients )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

% Evaluate the first layer gradients of the error function WRT the weights
% using the input

gradients{1} = deltas{1} * [input', 1];


for i = 2:length(deltas)
    gradients{i} = deltas{i} * [activations{i-1}', 1];
end

celldisp(gradients);


end

