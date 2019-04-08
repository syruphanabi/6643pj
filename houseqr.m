function [Q,R] = houseqr(A)
[m,n] = size(A);
Q = eye(m);
R = A;
for i = 1:n
    x = R(i:m,i);
    v = x;
    v(1) = v(1) + sign(x(1))*norm(x);
    % Householder Matrix
    P_small = eye(m-i+1)-2.*v*v'/(v'*v);
    P = [eye(i-1), zeros(i-1, m-i+1);zeros(m-i+1,i-1),P_small];
    R = P * R;
    Q = Q * P';
end
end