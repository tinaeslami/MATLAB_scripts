clear
clc

%Implements Jacobi method for iterative solution of linear systems Ax=b.
%Can be used to examine the convergence speed by changing n, d and epsilon
%values.

n = input('Input matrix size n: ');
d = 2 %magnitude of diagonal entry
A = gallery('tridiag',n,-1,d,-1)
b(1:n) = 1;
b = b';

iteration = 0; % Keeps track of iterations
value = 1; % Used to enter the while loop
epsilon = 10e-4; % Difference between two successive approximations

[n, m] = size(A);
x(n,1) = 0; %initial guess
d = diag(diag(A)); %extract diagonal from A and make that a diagonal matrix

%Optional. Not necessary for this specific question
%Check for diagonally dominant matrix
for N = 1:n
    row = abs(A(n,:)); %extract n-th row we are going to add
    s = sum(row) - row(n); %Sum all the elements in the row but subtract the diagonal element
    if row(n) <= s % if diagonal element is less than or equal to the sum, give error
        error('[A] is not a diagonally dominant matrix but it should be!')
    end
end 

while (value >= epsilon)
   dx = inv(d) * (b-A*x);
   x = x + dx;
   value = max(abs(dx./x));
   iteration = iteration + 1
end

%Check answer
check = A\b;

