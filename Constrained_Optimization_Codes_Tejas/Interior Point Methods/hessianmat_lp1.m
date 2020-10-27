function[H] = hessianmat_lp1(x,t, A, c)
 [m,n] = size(A);
 d = x;
D = diag(1./d);
H = D^2;

  endfunction
