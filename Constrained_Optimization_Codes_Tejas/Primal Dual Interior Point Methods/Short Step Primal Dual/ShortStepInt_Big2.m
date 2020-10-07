% Implements the Short Step Primal Dual Algorithm - Stephen Wright
% A more general higher dimensional implementation.  
% Randomly generated instances of linear program in standard form.
% Starting point in the neighborhood N_{2}(\theta). 

% dual variable v is denoted by lambdak 

clc
clear all
m = 90 ; n = 70;

A = randn(m,n); % constraint matrix
c = randn(n,1); % objective function 

theta = 0.4;

xk = abs(rand(n,1)); % randomly chosen starting point 
uk = abs(rand(n,1)); % randomly chosen initial dual variable (wrt inequality constraint)


b = A*xk;
tem1 = c-uk;
lambdak = A'\tem1;

sigma = 1 - (1/(sqrt(n)))*theta;


eps = 1.0e-6 ;
vk = (1/n)*(xk'*uk);
vk_temp = vk; % book keeping, to see the value of average value of x^{T}u at the beginning to compare with the value at the end

%%%%%%%%%%% glpk %%%%%%%%%%%%%%%% 
%lb = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]';
%ub = [];
%ctype = "SSSSS";
%vartype = "CCCCCCCCCC";
%s = 1;

%param.msglev = 1;
%param.itlim = 100;

%[xmin, fmin, status, extra] = ...
 %  glpk(c, A, b, lb, ub, ctype, vartype, s, param); 
   
%x_sim = xmin 
%%%%%%%%%%%% glpk %%%%%%%%%%%%%%%%

i=0;

while vk>eps

i=i+1

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

iter=i