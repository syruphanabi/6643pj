function [Q, R] = house_update(Q_origin, R_origin, a)
R = [R_origin;a];
[m,n] = size(R_origin);
Q = [Q_origin, zeros(m,1);zeros(1,m),1];
for i = 1:n
    x = [R(i,i);R(m+1,i)];
    v = zeros(m+2-i,1);
    v(m+2-i) = x(2);
    v(1) = x(1) + sign(x(1))*norm(x);
    % Householder Matrix
    P_small = eye(m-i+2)-2.*v*v'/(v'*v);
    P = [eye(i-1), zeros(i-1, m-i+2);zeros(m-i+2,i-1),P_small];
    P
    R = P * R;
    Q = Q * P';
end
end