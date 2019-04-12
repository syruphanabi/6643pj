function [Q, R] = givensqr(A)

[m,n] = size(A);
Q = eye(m);
for i = 1:n
    for j = i+1:m
%         [c,s] = givens(A(i,i), A(j,i));
        
%         G = [c,s;-s,c]';
%         B = G*[A(i,:); A(j,:)];
%         A(i,:) = B(1,:);
%         A(j,:) = B(2,:);
        a = A(i,i); b = A(j,i);
        if abs(b) > abs(a)
            if b == 0
                c = 1; s = 0; return;
            end
            r = -a/b; s = 1/sqrt(1+r*r);c = s*r;
        else
            r = -b/a; c = 1/sqrt(1+r*r);s = c*r;
        end

        ti = A(i,:);
        tj = A(j,:);
        A(i,:) = c*ti - s*tj;
        A(j,:) = s*ti + c*tj;
        A(j,i) = 0;
        
        ti = Q(:,i);
        tj = Q(:,j);
        Q(:,i) = c*ti - s*tj;
        Q(:,j) = s*ti + c*tj;
     
    end
end
R = A;
end