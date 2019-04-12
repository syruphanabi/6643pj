clc;
clear;

m = 3000;
n =20;

tic;
A = rand(m,n);
b = rand(m,1);
[Q4,R] = houseqr(A);
x4 = linsolve(R(1:n,1:n),Q4(:,1:n)'*b);

Q4 = Q4(:,1:n);
Qerr = norm(eye(n) - Q4'*Q4, 'fro');
Rerr = norm(A - Q4*R(1:n,1:n), 'fro');

toc;