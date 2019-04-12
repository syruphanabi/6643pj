function [Q,R] = houseqr(A)
    [m,n] = size(A);
    Q = eye(m);
    R = A;
    for i = 1:n
        v = R(i:m,i);
        alpha = norm(v);
        v(1) = v(1) + sign(v(1))*alpha;
        % Householder Matrix
        % P_small = eye(m-i+1)-2.*v*v'/(v'*v);
        % for computation efficience reason, P_small is not used explictly.
        R(i,i) = -alpha; R(i+1:m,i) = 0; 
        R(i:m,i+1:n) = R(i:m,i+1:n) - 2*v*(v'*R(i:m,i+1:n))/(v'*v);
        Q(i,i:m) = Q(i,i:m) - 2*(Q(i,i:m)*v)*v'/(v'*v);
        
    end
end
