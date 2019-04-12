% c = randperm(39644);
load('Data/c.mat');
[trainX, trainY, testX, testY] = myPCA(m,n,c);
A = trainX;
b = trainY;

Aadd = testX;

[Q_origin, R_origin] = mgsqr(A);


[Q,R] = givens_update(Q_origin, R_origin, a);

