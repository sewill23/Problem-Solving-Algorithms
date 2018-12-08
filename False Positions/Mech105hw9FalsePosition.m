%% Homework 9
% False Position Algorithm
clear all
function [root, fx, ea, iter] = falsePosition (func, Xl, Xu, es, maxiter);
%  This will estimate the root of any function using false position method.
%
% Variable:
% Inputs:
% Xl = the lower guess
% Xu = the upper guess
% es = the desired relative error (should default to 0.0001%)
% maxiter - the number of iterations desired (should default to 200)
% Outputs:
% root = the estimated root location
% fx = the function evaluated at the root location
% ea = the approximate relative error (percentage)
% iter = the number of performed iterations
%
root = 0; % this is the starting value for the root variable
ea = intmax; % this takes away the capped value
iter = 0; % this is the starting value for iter variable
%
format long % gives more decimals
%
if nargin < 3; % function needs at least three input values (f, Xl, Xu)
    error ('Needs to be at least 3 inputs')
else if nargin == 3; % es and maxiter goes to default value
        es = 0.0001;
        maxiter = 200;
    else if nargin == 4; % maxiter goes to defualt value
            maxiter = 200;
        end 
    end
end
%
sign = func(Xu) * func(Xl); % sign stands for sign change; it tests
% functions Xu and Xl need to be multiplied together 
if sign > 0; % sign is a positive number, then you know it was a (-)*(-) or
% or a (+)*(+) meaning no sign change
    error ('There is no sign change so change boundaries')
end
% 
while (ea > es) && (iter < maxiter); % it will run until approximate error 
% and maxiter is larger than the desired error
    badroot = root; % stores the value as a different name to find ea
    root = vpa(Xu-((func(Xu)*(Xl-Xu))/(func(Xl)-func(Xu)))); % formula to
% find the root with two bounds
    if func(root)*func(Xl) > 0; % This redefines the 2 bounds with new root
        Xl = root;
    else if func(root)*func(Xl) < 0;
            Xu = root;
        end
    end 
    if iter > 0; % makes sure that 1 iteration is done before approximate
% relative error is found
        ea = abs((root-badroot)/root)*100; % approximate relative error
        disp(root) % displays the root after the process is complete
    end
    iter = iter + 1; % makes the approximated root the closest
end
end