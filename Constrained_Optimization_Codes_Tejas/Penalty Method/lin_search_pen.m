% Line Search Algorithm 
% Based on Algorithm 11.5 from Michel Bierlaire Optimization Principles and Algorithms
% Implements Armijo Wolfe Conditions

function[p] = lin_search_pen(x,d,m)

f = @minfun_pen;
gfx = @grad_pen;

alpha = 1; %0.001;
Beta1 = 10^-4;
Beta2 = 0.99;
lambda = 2;
infty = 10^6;
alpha_l = 0;
alpha_t = infty;

temp1 = f(x + alpha*d, m) - f(x,m) - (alpha*Beta1*(gfx(x,m)'*d)); %11.45
temp2 = (((gfx(x+alpha*d,m))'*d)/(gfx(x, m)'*d)); % 11.47

while  (temp1 > 0) || (temp2 > Beta2)
  
  if temp1 > 0
    
    alpha_t = alpha;
    alpha = 0.5*(alpha_t + alpha_l);
    
  end
  
  if temp2 > Beta2
    
    alpha_l = alpha;
    if alpha_t < infty
      alpha = 0.5*(alpha_l+alpha_t);
    else
      alpha = lambda*alpha;
    end
    
  end

temp1 = f(x + alpha*d, m) - f(x, m) - (alpha*Beta1*(gfx(x,m)'*d));
temp2 = (((gfx(x+alpha*d, m))'*d)/(gfx(x, m)'*d));

endwhile

p = alpha;
 

endfunction

