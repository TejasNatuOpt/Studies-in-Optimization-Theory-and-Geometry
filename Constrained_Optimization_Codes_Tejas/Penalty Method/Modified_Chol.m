% Function Modified Cholesky Factorization
% Algorithm 11.7 from Michel Bierlaire Optimization Principles and Algorithms

function[L,t] = Modified_Chol(A)

    %L = 2*A;
    %tk = A(2,3);
    
for i = 1:2
  v(i) = A(i,i) ; 
end

temp1 = 0;

for i = 1:2
  for j = 1:2
     temp1 = temp1+(A(i,j))^2;
  end
end

frobA = (temp1)^0.5;


if min(v) >0
  
  tk = 0;
  
else
  
  tk = frobA;

end 

flag1 = 10;



while flag1 ~= 0 
  A_temp = A + tk*eye(2);
  [R,flag] = chol(A_temp); 
  flag1 = flag;
  
if flag1 ~=0
  tk = max((2*tk),0.5*frobA);
  endif
endwhile

L = R;
t = tk;
    
endfunction 
