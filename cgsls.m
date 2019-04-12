function [x, r] = cgsls(A, b)
[Q, R] = cgsqr(A);
y1 = Q' * b;
n=size(A,2);
c=y1(1:n);
x = linsolve(R,c);
r = norm(A*x - b);
end