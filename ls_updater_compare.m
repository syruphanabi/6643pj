clc;
clear;

load('Data/c.mat');
n = 3000; k = 20;

[trainX, trainY, testX, testY] = myPCA(n,k,c);
A = trainX;
b = trainY;

Aadd = testX;

[Q_origin, R_origin] = givensqr(A);
[Qerr,Rerr] = errtest(A,Q_origin,R_origin,k);


q = 1000;
idx = 1:50:q;
update = zeros(length(idx),1);
complete = zeros(length(idx),1);

p = 1;
for i = 1:50:q
    tic; 
    [Q,R] = givensqr([A;testX(1:i,:)]);
    complete(p) = toc;

    tic; 
    [Q,R] = givens_update(Q_origin, R_origin, testX(1:i,:));
    update(p) = toc;
    
    p = p+1;
end

figure;
plot(idx,update,idx,complete,'Linewidth',5);
legend('update', 'complete');
xlabel('num of new rows');
ylabel('time');

