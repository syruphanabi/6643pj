function [Q, R] = house_update(Q_origin, R_origin, a)
%     R = [R_origin;a];
%     [m,n] = size(R_origin);
%     [m,m] = size(Q_origin);
%     Q = [Q_origin, zeros(m,1);zeros(1,m),1];
    [p,n] = size(a);
    [m,m] = size(Q_origin);
    Q = eye(m+p); Q(1:m,1:m) = Q_origin; 
    R = zeros(m+p,n); R(1:m,:) = R_origin; R(m+1:m+p,:) = a; 
    
    for i = 1:n
%         x = [R(i,i);R(m+1,i)];
%         v = zeros(m+2-i,1);
%         v(m+2-i) = x(2);
%         v(1) = x(1) + sign(x(1))*norm(x);
        
        v = zeros(p+1,1);
        v(1) = R(i,i);
        v(2:end) = R(m+1:m+p,i);
        v(1) = v(1) + sign(v(1))*norm(v);
        
        tmp = v'*[R(i,i:n);R(m+1:end,i:n)];
        R(i,i:n) = R(i,i:n) - 2*v(1)*tmp/(v'*v);
        R(m+1:end,i:n) = R(m+1:end,i:n) - 2*v(2:end)*tmp/(v'*v);
        
%         R(i:m,i:n) = R(i:m,i:n) - 2*v*(v'*R(i:m,i:n))/(v'*v);
        tmp = Q(:,i)*v(1) + Q(:,m+1:end)*v(2:end);
        Q(:,i) = Q(:,i) - 2*tmp*v(1)/(v'*v);
        Q(:,m+1:end) = Q(:,m+1:end) - 2*tmp*v(2:end)'/(v'*v);
%         Q(:,i:m) = Q(:,i:m) - 2*(Q(:,i:m)*v)*v'/(v'*v);

        % Householder Matrix
%         P_small = eye(m-i+2)-2.*v*v'/(v'*v);
%         P = [eye(i-1), zeros(i-1, m-i+2);zeros(m-i+2,i-1),P_small];
%         P;
%         R = P * R;
%         Q = Q * P';
    end
end