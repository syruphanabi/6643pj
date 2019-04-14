function [Q, R] = givens_update(Q_origin, R_origin, a)
    
    [p,n] = size(a);
    [m,m] = size(Q_origin);
    Q = eye(m+p); Q(1:m,1:m) = Q_origin; %[Q_origin, zeros(m,p);zeros(p,m),eye(p)];
    R = zeros(m+p,n); R(1:m,:) = R_origin; R(m+1:m+p,:) = a; %[R_origin;a];
    
    for i = 1:n
        for j = 1:p
            
            a = R(i,i); b = R(m+j,i);
            if abs(b) > abs(a)
                if b == 0
                    c = 1; s = 0; return;
                end
                r = -a/b; s = 1/sqrt(1+r*r);c = s*r;
            else
                r = -b/a; c = 1/sqrt(1+r*r);s = c*r;
            end
            
            ti = R(i,:);
            tj = R(m+j,:);
            R(i,:) = c*ti - s*tj;
            R(m+j,:) = s*ti + c*tj;
            R(m+j,i) = 0;

            ti = Q(:,i);
            tj = Q(:,m+j);
            Q(:,i) = c*ti - s*tj;
            Q(:,m+j) = s*ti + c*tj;
        end
    end
end