clear
clc

%Implements row reduction procedure in Gaussian elimination
A = [-1 -2 4; 3 4 -1; 3 2 10];
b = [-7; 5; -11];

row_reduce(A,b)

function[Aaug] = row_reduce(A,b)
Aaug = [A b];
[n,m] = size(Aaug);

for i = 1:n-1 %repeat the loop based on 1-#rows
    for j = i+1:n %count for the next row
     m = -Aaug(j,i)/Aaug(i,i) %finds the elimination factor
     Aaug(j,i:n+1) = Aaug(j,i:n+1)+ (m*Aaug(i,i:n+1)) %row reduction
    end
end

end
