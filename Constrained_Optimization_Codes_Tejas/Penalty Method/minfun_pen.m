function [v] = minfun_pen(x,m)
  
  v = (x(1)-2)^(4) + (x(1)-2*x(2))^(2) + m*(x(1)^2 - x(2))^2;
  
endfunction
