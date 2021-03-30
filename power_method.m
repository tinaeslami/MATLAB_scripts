clear
clc
%{
Implements power method for finding the largest (in modulus) eigenvalue of
a diagonalisable square matrix and the associated eigenvector. Stop
iteration when the the difference between two successive approximations to
the eigenvalue is smaller than a given parameter epsilon.
%}

A = [7 9; 9 7];

x = [1; 0]; % Initial guess for x with largest entry=1

iteration = 0; % Keeps track of iterations
value = 1; % Used to enter the while loop
epsilon = 10e-4; % Difference between two successive approximations

while (value >= epsilon)
    p = A*x; % p = A*x_k
    nk = max(abs(p)); % Largest eigenvalue
    xnext = (1/nk)*p; % Normalise
    iteration = iteration+1; % Add 1 to the # of iterations
    value = norm(p - nk*x); % Update the epsilon check
    x = xnext; % Make xnext the new x 
end

x % Print largest eigevector
nk % Print the eigenvalue associated with the largest eigenvector
iteration % Print how many iterations were completed
value % Print the difference between two successive approximations
