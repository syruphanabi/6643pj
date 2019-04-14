function [Qerr,Rerr] = errtest(A,Q,R,k)

    Q = Q(:,1:k);
    R = R(1:k,1:k);

    Qerr = norm(eye(k) - Q'*Q, 'fro');
    Rerr = norm(A - Q*R, 'fro');
    
end