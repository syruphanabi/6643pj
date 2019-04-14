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

p = 3;
[Q,R] = givens_update(Q_origin, R_origin, testX(1:p,:));
[Qerrh,Rerrh] = errtest([A;testX(1:p,:)],Q,R,k);

q = 1000;
idx = 1:50:q;
givens_update_res = zeros(length(idx),1);
householder_update = zeros(length(idx),1);
complete = zeros(length(idx),1);

p = 1;
for i = 1:50:q
    tic; 
    [Q,R] = givensqr([A;testX(1:i,:)]);
    complete(p) = toc;

    a = testX(1:i,:);
    tic;
    [Q,R] = givens_update(Q_origin, R_origin, testX(1:i,:));
    givens_update_res(p) = toc;
   
    tic; 
    [Q,R] = house_update(Q_origin, R_origin, testX(1:i,:));
    householder_update(p) = toc;
    
    p = p+1;
end

figure;
plot(idx,givens_update_res,idx,householder_update,idx,complete,'Linewidth',5);
legend('givens update', 'householder update', 'complete');
xlabel('num of new rows');
ylabel('time');

