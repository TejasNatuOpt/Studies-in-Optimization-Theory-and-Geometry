function[H] = hessianmat_pen(x,m)
  
  H = [(12*(x(1)-2)^2 + 2 + 4*m*(3*x(1)^2-x(2)))  -4-4*m*x(1); -4-4*m*x(1)  8+2*m];
  
  endfunction
