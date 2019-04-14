clc;
clear;

load('Data/c.mat');
n = 3000; k = 20;

[trainX, trainY, testX, testY] = myPCA(n,k,c);
A = trainX;
b = trainY;

Aadd = testX;

[Q_origin, R_origin] = mgsqr(A);
[Qerr,Rerr] = errtest(A,Q_origin,R_origin,k);

p = 3;
a = testX(1:p,:);
tic;
% [Q,R] = givens_update(Q_origin, R_origin, a);
[Q,R] = house_update(Q_origin, R_origin, a);
toc;
[Qerrg,Rerrg] = errtest(A,Q,R,k);

