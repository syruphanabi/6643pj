function [Q, R] = givens_update(Q_origin, R_origin, a)
R = [R_origin;a];
[m,n] = size(R_origin);
Q = [Q_origin', zeros(m,1);zeros(1,m),1];
for i = 1:n
    [c,s] = givens(R(i,i),R(m+1,i));
    G = [c,s;-s,c]';
    B = G*[R(i,:); R(m+1,:)];
    R(i,:) = B(1,:);
    R(m+1,:) = B(2,:);
    G_full = eye(m+1);
    G_full(i,i) = c;
    G_full(m+1,i) = -s;
    G_full(i,m+1) = s;
    G_full(m+1,m+1) = c;
    Q = G_full'*Q;
end
Q = Q';
end