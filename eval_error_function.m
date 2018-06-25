function [ E ] = eval_error_function( y, target )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

E = .5 * sum((y - target).^2);

end

