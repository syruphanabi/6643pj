clc;
clear;

load('Data/c.mat');


idx = 1:1:50;


[trainX, trainY, testX, testY] = myPrepare(n,c);
A = trainX;
b = trainY;
[Q,R] = mgsqr(A);
beta = linsolve(R(1:n,1:n),Q(:,1:n)'*b);
Merr = mean(abs(testX*beta - testY)./testY);
base = Merr * ones(50,1);



res = zeros(50,1);
for i = 1:50
    [trainX, trainY, testX, testY] = myPCA(m,i,c);
    A = trainX;
    b = trainY;
    [Q,R] = mgsqr(A);
    beta = linsolve(R(1:i,1:i),Q(:,1:i)'*b);
    res(i) = mean(abs(testX*beta - testY)./testY);
end


figure;
plot(idx,base,idx,res,'Linewidth',5);
legend('lasso','pca');
xlabel('num of component');
ylabel('average percentage err');
    