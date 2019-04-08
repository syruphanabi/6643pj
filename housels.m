function [x_house, r_house] = housels(A,b) 
[Q,R] = houseqr(A);
[m,n] = size(A);
y = Q'*b;
r_house = norm(y(1:(m-n),:));
x_house = linsolve(R(m-n+1:m,:),y(m-n+1:m,:));
end
