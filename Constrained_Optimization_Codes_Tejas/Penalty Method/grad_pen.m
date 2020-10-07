% Gradient for minFun_pen

function[u] = grad_pen(x,m)

u = [4*(x(1)-2)^(3) + 2*(x(1) - 2*x(2)) + 4*m*x(1)*(x(1)^2 - x(2)) ; -4*(x(1)-2*x(2)) - 2*m*(x(1)^2 - x(2)) ];

endfunction