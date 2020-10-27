% Forward and Backward substitution post Cholesky Factorization
% (L'L)d = b
%  L'y = b
%  Ld = y
 

function[d] = fwdbacksubs(L,b,n);
    
    A_temp = L';
    
    %forward substitution
    
    y(1) = (b(1)/A_temp(1,1));
    
    for i = 2:n
     temp = 0; 
      for j = 1:i-1
          
          temp = temp + A_temp(i,j)*y(j);
          
      end
      y(i) = (1/A_temp(i,i))*(b(i) - temp);
    end
    
    
    % backward substitution
    
    d(n) = (y(n)/L(n,n));
    
    for i = n-1:-1:1
      temp = 0;   
      for j = n:-1:i+1  
        
        temp = temp + L(i,j)*d(j);
          
      end
      d(i) = (1/L(i,i))*(y(i)-temp); 
      
    end
    
    
    
    
    
endfunction