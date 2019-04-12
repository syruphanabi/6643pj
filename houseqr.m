function [Q,R] = houseqr(A)
    [m,n] = size(A);
    Q = eye(m);
    R = A;
    for i = 1:n
        v = R(i:m,i);
        alpha = norm(v);
        s = sign(v(1));
        v(1) = v(1) + s*alpha;
        % Householder Matrix
        % P_small = eye(m-i+1)-2.*v*v'/(v'*v);
        % for computation efficience reason, P_small is not used explictly.
        R(i:m,i:n) = R(i:m,i:n) - 2*v*(v'*R(i:m,i:n))/(v'*v);
        Q(:,i:m) = Q(:,i:m) - 2*(Q(:,i:m)*v)*v'/(v'*v);
        
    end
end
