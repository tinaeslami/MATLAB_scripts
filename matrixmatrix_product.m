clear
clc

%Calculates matrix-matrix product of an mxk and an kxn matrix.

m = 5;
k = 5;
n = 5;

A = rand(m, k);
B = rand(k, n);
%A = [3 -6 2; 7 1 0; 2 10 -4]
%B = [2 6 1 2; 1 0 4 3; -3 7 -1 0]

for i = 1:m
    for j = 1:n
       C(i,j) = dot(A(i,:),B(:,j))
    end
end

%check
Z = A*B
