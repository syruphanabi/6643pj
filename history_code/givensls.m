function [x_givens, r_givens] = givensls(A,b) 
[Q,R] = givensqr(A);
[m,n] = size(A);
y = Q'*b;
r_givens = norm(y(1:(m-n),:));
x_givens = linsolve(R(m-n+1:m,:),y(m-n+1:m,:));
end
