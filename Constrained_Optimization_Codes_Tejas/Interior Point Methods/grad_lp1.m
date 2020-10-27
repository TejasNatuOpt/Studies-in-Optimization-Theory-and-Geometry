% Gradient for MinFun

function[g] = grad_lp1(x,t, A, c)

[m,n] = size(A);
d = x; D = diag(1./d);
g = t*c - D*ones(n,1);


endfunction