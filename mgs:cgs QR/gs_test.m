A = randn(10,4);
b = randn(10,1);

% [Q_mgs, R_mgs] = mgsqr(A);
% [Q_cgs, R_cgs] = cgsqr(A);
% disp(R_cgs);
% disp(R_mgs);

[x_mgs,r_mgs] = mgsls(A,b);
[x_cgs,r_cgs] = cgsls(A,b);

disp(x_mgs);
disp(x_cgs);


