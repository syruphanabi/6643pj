function [x_ne, r_ne] = nels(A,b)
G = chol(A'*A);
y = linsolve(G',A'*b);
x_ne = linsolve(G,y);
r_ne = norm(A*x_ne-b);
end