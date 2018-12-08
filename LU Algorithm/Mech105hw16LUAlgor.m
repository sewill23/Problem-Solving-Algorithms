%% Homework 16
    % LU Factorization (with Partial Pivoting) Algoithm Development
    % Sierra Williams
%
function [L,U,P] = LU_pivot(A)
%
% Variables
% Inputs:
% A = coefficient matrix in the format of A = [a(11) a(12); a(21) a(22)]
% Outputs:
% L = lower triangular matrix
% U = upper triangular matrix
% P = pivot matrix
%
% The Main Conditiions of the Function
b = length(A);
U = A; % The matrix A (input) is the same as the U matrix
L = zeros(b,b); % This creates the identity matrix
P = (0:b-1)'; % this is also the identity matrix
%
% Partial Pivot
for j = 1:b; % This sets up one row of the matrix with A being the 
    %first row
[~,ind] = max(abs(U(j:b,j))); % This looks at the first columns in each row
% and is trying to find the absolute max that needs to be pivoted.
ind = ind+(j-1); % This helps determine which rows to switch
g = P(j); P(j)=P(ind); P(ind)=g; 
g = L(j,1:j-1); L(j,1:j-1)=L(ind,1:j-1); L(ind,1:j-1)=g;
g = U(j,j:end); U(j,j:end)=U(ind,j:end); U(ind,j:end)=g; % These switch the
%row so that the max is at the top. Doing this now helps you keep track
%of the row switches
%
% Forward Elimination becuase LUx = d
L(j,j) = 1; % Let the first row first column equal one
for i = (1+j):size(U,1) % This createws your I matrix
c = U(i,j)/U(j,j); % This finds your ratios to create the new matrix
U(i,j:b) = U(i,j:b)-U(j,j:b)*c; % Youre finding the other "R3"
L(i,j) = c; % This replaces what you found in the new matrix
end
end
P = zeros(b,b);
P(P(:)*b+(1:b)') = 1; % inserts 1s in the diagonal essientally
%
function Ainv = MatrixInverse(A)
[L,U,P] = LU_pivot(A); % New triangle matrix

% Find the Identity matrix by solving the linear system
I = eye(size(A));
s = size(A,1);
Ainv = zeros(size(A));
for i = 1:s
b = I(:,i);
Ainv(:,i) = TriangleBackwardSub(U,TriangleForwardSub(L,P*b));
end
%
% Backward Substitution
function C = TriangleBackwardSub(U,b) % Solves C = U \ B;
s = length(b);
C = zeros(s,1); % identity matrix
C(s) = b(s)/U(s,s); %creates ratios
for j = (s-1):-1:1 % sets up new row
C(j) = (b(j) -sum(U(j,j+1:end)'.*C(j+1:end)))/U(j,j); % new matrix
end
%
% Forward Substitution
function C = TriangleForwardSub(L,b) % This solves for C which is L divided
%by b
b = length(b);
C = zeros(b,1);
C(1) = b(1)/L(1,1);
for j = 2:b
C(j) = (b(j) -sum(L(j,1:j-1)'.*C(1:j-1)))/L(j,j); % new matrix
end
%
% Display Results At The End
display(L); % This displays L
display(U); % This displays U
check1 = L*U; % This checks to make sure your answer is correct because 
% when multiplyng them you should return with your A matrix since U is
% equal with A
check2 = P*A;