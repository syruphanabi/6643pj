clc;
clear;

m = 3000;
n = 20;

disp("num of samples: " + m);
disp("num of features: " + n);


% #########################################################################
% time comparastion

tic;
Qerr = 0;
Rerr = 0;
for i = 1:10
    A = rand(m,n);
    b = rand(m,1);
    [Q1,R] = qr(A);
    x1 = linsolve(R(1:n,1:n),Q1(:,1:n)'*b);
    Qerr = Qerr + norm(eye(m) - Q1'*Q1, 'fro');
    Rerr = Rerr + norm(A - Q1*R, 'fro');
end
time = toc;
time = time/10;
disp("time used by embeded QR: " + time);
disp("orthogonality of Q from embeded QR: " + Qerr/10);
disp("err of QR from embeded QR: " + Rerr/10);

tic;
Qerr = 0;
Rerr = 0;
for i = 1:10
    A = rand(m,n);
    b = rand(m,1);
    [Q2,R] = cgsqr(A);
    x2 = linsolve(R(1:n,1:n),Q2(:,1:n)'*b);
    Qerr = Qerr + norm(eye(n) - Q2'*Q2, 'fro');
    Rerr = Rerr + norm(A - Q2*R, 'fro');
end
time = toc;
time = time/10;
disp("time used by our CGS: " + time);
disp("orthogonality of Q from our CGS: " + Qerr/10);
disp("err of QR from our CGS: " + Rerr/10);


tic;
Qerr = 0;
Rerr = 0;
for i = 1:10
    A = rand(m,n);
    b = rand(m,1);
    [Q3,R] = mgsqr(A);
    x3 = linsolve(R(1:n,1:n),Q3(:,1:n)'*b);
    Qerr = Qerr + norm(eye(n) - Q3'*Q3, 'fro');
    Rerr = Rerr + norm(A - Q3*R, 'fro');
end
time = toc;
time = time/10;
disp("time used by our MGS: " + time);
disp("orthogonality of Q from our MGS: " + Qerr/10);
disp("err of QR from our MGS: " + Rerr/10);


tic;
Qerr = 0;
Rerr = 0;
for i = 1:5
    A = rand(m,n);
    b = rand(m,1);
    [Q4,R] = houseqr(A);
    x4 = linsolve(R(1:n,1:n),Q4(:,1:n)'*b);
    Qerr = Qerr + norm(eye(m) - Q4'*Q4, 'fro');
    Rerr = Rerr + norm(A - Q4*R, 'fro');
end
time = toc;
time = time/5;
disp("time used by our Householder: " + time);
disp("orthogonality of Q from our Householder: " + Qerr/10);
disp("err of QR from our Householder: " + Rerr/10);



tic;
Qerr = 0;
Rerr = 0;
for i = 1:10
    A = rand(m,n);
    b = rand(m,1);
    [Q5,R] = givensqr(A);
    x5 = linsolve(R(1:n,1:n),Q5(:,1:n)'*b);
    Qerr = Qerr + norm(eye(m) - Q5'*Q5, 'fro');
    Rerr = Rerr + norm(A - Q5*R, 'fro');
end
time = toc;
time = time/10;
disp("time used by our Givens: " + time);
disp("orthogonality of Q from our Givens: " + Qerr/10);
disp("err of QR from our Givens: " + Rerr/10);



tic;
for i = 1:10
    A = rand(m,n);
    b = rand(m,1);
    x6 = myNE(A,b);
end
time = toc;
time = time/10;
disp("time used by Normal Equation (Cholesky): " + time);
