function [Q, R] = mgsqr(A)
    m = size(A, 1);
    n = size(A, 2);
    R = zeros(n,n);
    Q = zeros(m,n);
    R(1,1) = norm(A(:,1),2);
    Q(:,1) = A(:,1)/R(1,1);
    for k = 1:n % Use Algorithm 5.2.6
        R(k,k)=norm(A(1:m,k),2);
        Q(1:m,k)=A(1:m,k)/R(k,k);
        for j = k+1:n
            R(k,j)=Q(1:m,k)'*A(1:m,j);
            A(1:m,j)=A(1:m,j)-Q(1:m,k)*R(k,j);
        end
    end
end