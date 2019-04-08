function [Q, R] = givensqr(A)
[m,n] = size(A);
Q = eye(m);
for i = 1:n
    for j = i+1:m 
        [c,s] = givens(A(i,i), A(j,i));
        G = [c,s;-s,c]';
        B = G*[A(i,:); A(j,:)];
        A(i,:) = B(1,:);
        A(j,:) = B(2,:);
        G_full = eye(m);
        G_full(i,i) = c;
        G_full(j,i) = -s;
        G_full(i,j) = s;
        G_full(j,j) = c;
        Q = G_full'*Q;
    end
end
R = A;
Q = Q';
end