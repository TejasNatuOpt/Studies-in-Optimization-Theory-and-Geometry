% Line Search Algorithm 
% Based on Algorithm 11.5 from Michel Bierlaire Optimization Principles and Algorithms
% Implements Armijo Wolfe Conditions

function[p] = lin_search_lp(xk,d, t, A, b, c)

f = @minfun_lp;
gfx = @grad_lp;

%x = [10;1];
%d = [-2/(sqrt(5));1/(sqrt(5))];

ALPHA = 0.1; %0.001;
BETA = 0.7;

s=1;
      while (min([b - A*(xk+s*d)] ) < 0)
          s = BETA*s
      endwhile 
      
      temp1 = f(xk+s*d, t, A, b, c);
      temp2 = f(xk, t, A, b, c)+ALPHA*s*gfx(xk, t, A, b, c)'*d;
      while temp1 > temp2
           
          s = BETA*s 
          temp1 = f(xk+s*d, t, A, b, c);
          temp2 = f(xk, t, A, b, c)+ALPHA*s*gfx(xk, t, A, b, c)'*d;
            
      endwhile 
    
    p=s
    
endfunction

