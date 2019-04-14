clc;
clear;

m = 3000;
n =20;
% c = randperm(39644);
load('Data/c.mat');

[trainX, trainY, testX, testY] = myPCA(m,n,c);
A = trainX;
b = trainY;

tic;
% [Q,R] = qr(A);
% [Q,R] = cgsqr(A);
[Q,R] = mgsqr(A);
% [Q,R] = houseqr(A);
% [Q,R] = givensqr(A);
beta = linsolve(R(1:n,1:n),Q(:,1:n)'*b);
% beta = myNE(A,b);
time = toc;

Q = Q(:,1:n);
R = R(1:n,1:n);

Qerr = norm(eye(n) - Q'*Q, 'fro');
Rerr = norm(A - Q*R, 'fro');

Merr = mean(abs(testX*beta - testY)./testY);

time
Qerr
Rerr
Merr
