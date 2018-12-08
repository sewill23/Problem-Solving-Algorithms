%% Heuns Method
% Sierra Williams
% Mech 105
% Homework # 23

%%
function [x,y]=Heun(dydt,tspan,y0,h,es,maxit) % the origional function

if nargin == 4 % number of function input arguements
    maxit = 50; % max number it can be
elseif nargin == 3 % number of function input arguements
    maxit = 50; % max number it can be
    es = 0.001; % to optomize the function 
end
a = tspan(1); % left endpoint
b = tspan(2); % right endpoint
h1 = (b-a)/maxit; % step size
if h1 ~= h
    h = h1; % step size
end
x = zeros(1,maxit+1); % vector of abscissas
y = zeros(1,maxit+1); % vector of ordinates
x = a:h:b;
y(1) = y0; % The initial condition
for j = 1:maxit % maximum number of steps
   k1 = feval(dydt,x(j),y(j)); % execute the function with the given 
   % arguements
   k2 = feval(dydt,x(j+1),y(j)+h*k1);% execute the function with the given 
   % arguements
   y(j+1) = y(j)+(h/2)*(k1+k2); % function given for heuns method
end
figure(1)
plot(x,y,'-+','color','r'); % Plotting the results
title('Heuns Method','FontSize', 20); % giving the plot a title
xlabel('x'); ylabel('y'); % giving the plot labels

end