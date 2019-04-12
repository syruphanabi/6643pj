function [Q, R] = cgsqr(A)
    m = size(A, 1);
    n = size(A, 2);   
    R = zeros(n,n);
    Q = zeros(m,n);
    R(1,1) = norm(A(:,1),2);
    Q(:,1) = A(:,1)/R(1,1);
    for k = 2:n
        R(1:k-1,k) = Q(1:m,1:k-1)'*A(1:m,k);
        z = A(1:m,k) - Q(1:m,1:k-1)* R(1:k-1,k);
        R(k,k) = norm(z,2);
        Q(1:m,k) = z/R(k,k);
    end
end