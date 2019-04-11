function [trainX, trainY, testX, testY] = myPCA(n,k)
    var = load('all.csv');
    c = randperm(39644);

    train = var(c(1:n), :);
    Y = train(:,end);
    X = train(:,1:end-1);

    Y(Y<100) = 100;
    Y(Y>10e5) = 10e5;
    Y = log(log(Y));

    %%%%%%%%%%%%%%%%%%%%%%%%%
    X = X';
    [U,S,V] = svd(X);
    Xm = U(:,1:k)' * X;
    Xm = Xm';
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    rank(Xm);

    b = Xm \ Y;
    err1 = mean(abs(Xm*b - Y)./Y);

    test = var(c(n+1:2*n), :);
    Y2 = test(:,end);
    X2 = test(:,1:end-1);

    Y2(Y2<100) = 100;
    Y2(Y2>10e5) = 10e5;
    Y2 = log(log(Y2));

    %%%%%%%%%%%%%%%%%%%%%%%%%
    Xm2 = U(:,1:20)' * X2';
    Xm2 = Xm2';
    %%%%%%%%%%%%%%%%%%%%%%%%%

    err2 = mean(abs(Xm2*b - Y2)./Y2);
    disp(err2);
    
    trainX = Xm;
    trainY = Y;
    testX = Xm2;
    testY = Y2;

end












