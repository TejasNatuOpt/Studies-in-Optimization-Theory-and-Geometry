% Implements the Short Step Primal Dual Algorithm - Stephen Wright
% A more general higher dimensional implementation.  
% Randomly generated instances of linear program in standard form.
% Starting point on the Central Path. 

% dual variable v is denoted by lambdak 

clc
clear all
m = 10 ; n = 5;

A = abs(randn(m,n)); % constraint matrix 
c = abs(randn(n,1)); % objective function

theta = 0.4;

xk = abs(rand(n,1)); % randomly chosen starting point x^{0} 
uk = 20./xk;   % u^{0} on the central path. average = 20

b = A*xk;
tem1 = c-uk;
lambdak = A'\tem1; % corresponding value of v^{0} 

%muk = c; 

sigma = 1 - (1/(sqrt(n)))*theta;

%xk = [xk;lambdak;muk];

eps = 1.0e-6 ;
vk = 20;

%%%%%%%%%%% glpk %%%%%%%%%%%%%%%%
%lb = [0, 0, 0, 0, 0]';
%ub = [];
%ctype = "SSSSSSSSSS";
%vartype = "CCCCC";
%s = 1;

%param.msglev = 1;
%param.itlim = 100;

%[xmin, fmin, status, extra] = ...
 %  glpk(c, A, b, lb, ub, ctype, vartype, s, param);
   
%x_sim = xmin 
%%%%%%%%%%%% glpk %%%%%%%%%%%%%%%

while vk>eps
  
Z = [ A zeros(m,m) zeros(m,n) ; zeros(n,n) A' eye(n,n); diag(uk) zeros(n,m) diag(xk) ];
temp = -1*diag(xk)*diag(uk)*(zeros(n,1)+1) + vk * sigma*(zeros(n,1)+1);
y = [zeros(n,1);zeros(m,1); temp]; 

dk = Z\y;

temp_sol =  [xk ; lambdak; uk] + dk;

xk = temp_sol(1:n);
lambdak = temp_sol(n+1:n+m);
uk  = temp_sol(n+m+1:2*n+m);

vk = (1/n)*(xk'*uk);

endwhile

opt = [xk; lambdak; uk]
xx = xk
ux = uk 