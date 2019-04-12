function x_ne = myNE(A,b)
G = chol(A'*A);
y = linsolve(G',A'*b);
x_ne = linsolve(G,y);
end