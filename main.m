clc;
clear;

data = load('var.csv');
c = randperm(39644);
X = data(c(1:3000), :);
Y = X(:,end);
X = X(:,1:end-1);
% X = X';
% [U,S,V] = svd(X);
% a = sum(sum(U*S*V' - X));
% Xm = U(:,1:50)' * X;

m1 = mean(X);
X = X - m1;
m2 = max(X);
X = X ./ m2;
rankX = rank(X);
A = [X, ones(3000,1)];
rankA = rank(A);

% res = zeros(57,1);
% for i = 1:57
%     B = [A(:,1:i-1), A(:,i+1:57)];
%     res(i) = rank(B);
% end

[xhouse,rhouse] = housels(A,Y);
res = mean(abs(Y - A * xhouse));
basis = mean(abs(Y));

X2 = data(c(3001:6000), :);
Y2 = X2(:,end);
X2 = X2(:,1:end-1);
X2 = (X2 - m1) ./ m2;
A2 = [X2, ones(3000,1)];
[xh2,rh2] = housels(A2,Y2);
res2 = mean(abs(Y2 - A2 * xh2));

    
