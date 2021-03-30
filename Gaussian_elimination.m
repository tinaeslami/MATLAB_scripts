clear
clc

%Implements the gaussian elimination method including row reduction and
%back substitution.

A = [1 1 -1; 0 1 3; -1 0 -2];
b = [9; 3; 2];

gaus_elim(A,b)

function[Aaug] = gaus_elim(A,b)
Aaug = [A b];
[n, m] = size(Aaug);

%Row reduction
for i = 1:n-1 %repeat the loop based on 1-#rows
    for j = i+1:n %count for the next row
     m = -Aaug(j,i)/Aaug(i,i); %finds the elimination factor
     Aaug(j,i:n+1) = Aaug(j,i:n+1)+ (m*Aaug(i,i:n+1)); %row reduction
    end
end

%Back subsitution
x(n)= Aaug(n,n+1)/Aaug(n,n);
for i = n-1:-1:1
    x(i) = (Aaug(i,n+1)-dot(Aaug(i,i+1:n),x(i+1:n)))/Aaug(i,i)
end

end



