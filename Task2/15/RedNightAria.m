clear;  close all; clc

X = load('q2x.dat');
Y = load('q2y.dat');
X = [ones(size(X,1),1),X];
[m,n] = size(X);

plot(X(:,2),Y,'kX');
axis([-6 12 -2 2.5]);
xlabel('X');
ylabel('Y');
title('Red Night Aria''s Graphics','FontSize',16);

Tau = [0.01,0.03,0.1,0.3,1,3,10,100];

for i = 1:length(Tau)
    Theta = zeros(n,m);
    W = zeros(m,m);
    for j = 1:m
        for k = 1:m
            W(k,k) = exp(-(X(j,2)-X(k,2))^2/(2*Tau(i)^2));
        end;
        Theta(:,j) = pinv(X'*W*X)*X'*W*Y;
    end;
    h = diag(X*Theta);
    M = [X(:,2),h];
    M = sortrows(M,1);
    hold on;
    plot(M(:,1),M(:,2));
end;

legend('training data','tau=0.01','tau=0.03','tau=0.1','tau=0.3','tau=1.0','tau=3.0','tau=10.0','tau=100.0');