clc
clear
%% Sierra Williams
% Homework 20
% Simpsons 1/3 Rule

%%
clc
clear
function I = Simpson(x,y)
% These are the variables
x = x(end)-x(end-1); % x is the vector that computes the step size
i = (x(end)-x(1))/n; % Computing rhe integral sum of the terms
m = [y(2):y(end-1)]; % all of the numbers in the y vector in the middle
msum = sum(m); % Computes the sum of all the middle numbers in y vector
% Odd and Even
E = round(100*rand(20,1)); % Setting up the elements
even = E(mod(A,2)==0); % Variable for all even numbers
odd = E(mod(a,2)~=0); % Variable for all odd numbers
% When Trapeziodal Rule with an even number
for i = even; % The number of integrals has to be even in order to set up 
    % the Simpsons 1/3 Rule
    I = (x(end)-x(1))*((y(1)+(4*msum)+y(end))/6); %T Equation for Simpson's
    % 1/3 Rule for even number of integrals
end
% Using the Simpson's 1/3 Rule with an odd number, the Trapeziodial Rule 
% is needed because of odd number
for i = odd;
    warning('Use the Trapeziodial Rule on the last interval only');
    I = ((x(end-1)-x(1))*((y(1)+(4*msum)+y(end-1))/6)) % This is the 
    % Simpson's 1/3 Rule equation for odd number of integrals
    T = (x(end)-x(end-1))*((y(end)+y(end-1))/2); % This is the Trapeziodial
    % Equation to be used on the last interval
end
end