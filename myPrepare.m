function [trainX, trainY, testX, testY] = myPrepare(n,c)

    var = load('Data/afterlasso.csv');
%     c = randperm(39644);
    
    % train
    train = var(c(1:n), :);
    Y = train(:,end);
    X = train(:,1:end-1);
    Y(Y<100) = 100;
    Y(Y>10e5) = 10e5;
    Y = log(log(Y));
    % hist(Y,40);
    
    b = X \ Y;
    err1 = mean(abs(X*b - Y)./Y);

    % test
    test = var(c(n+1:2*n), :);
    Y2 = test(:,end);
    X2 = test(:,1:end-1);
    Y2(Y2<100) = 100;
    Y2(Y2>10e5) = 10e5;
    Y2 = log(log(Y2));
    err2 = mean(abs(X2*b - Y2)./Y2);
    disp(err2);
    
    trainX = X;
    trainY = Y;
    testX = X2;
    testY = Y2;

end