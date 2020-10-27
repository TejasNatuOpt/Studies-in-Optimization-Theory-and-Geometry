function [v] = minfun_lp1(x,t,A,c)
  
  [m,n] = size(A);
  d = x;
  v = t*c'*x - log(d')*ones(n,1);
  
endfunction