% Short step algorithm implementation ... 
% ... to solve randomly generated instances of linear program in standard form...
% - By Tejas Natu

% Implements the Short Step Primal Dual Algorithm as given in Stephen Wright's book...
% ... Primal Dual Interior Point Methods.

% A general higher dimensional implementation.  

% Starting point on the Central Path. 
% dual variable v is denoted by lambdak 


clc
clear all
m = 5 ; n = 10;

A = randn(m,n); % constraint matrix 

theta = 0.4;

xk = abs(rand(n,1)); % randomly chosen starting point x^{0} 
uk = 20./xk;   % u^{0} on the central path. average = 20
lambdak = randn(m,1);

b = A*xk;
c = A'*lambdak + uk;
 

sigma = 1 - (1/(sqrt(n)))*theta % theta = delta = 0.4

eps = 1.0e-6 ;
vk = 20;

%%%%%%%%%%% glpk %%%%%%%%%%%%%%%%
lb = [0, 0, 0, 0, 0,0,0,0,0,0]';
ub = [];
ctype = "SSSSS";
vartype = "CCCCCCCCCC";
s = 1;

param.msglev = 1;
param.itlim = 100;

[xmin, fmin, status, extra] = ...
   glpk(c, A, b, lb, ub, ctype, vartype, s, param);
   
x_sim = xmin 
%%%%%%%%%%%% glpk %%%%%%%%%%%%%%%
i=1;
dgap(i) = vk;
%iter(i) = i;
while vk>eps
i=i+1 

Z = [ zeros(n,n) A' eye(n,n); A zeros(m,m) zeros(m,n) ; diag(uk) zeros(n,m) diag(xk) ];
temp = -1*diag(xk)*diag(uk)*(zeros(n,1)+1) + vk * sigma*(zeros(n,1)+1);
y = [zeros(n,1);zeros(m,1); temp]; 

dk = Z\y;

temp_sol =  [xk ; lambdak; uk] + dk;

xk = temp_sol(1:n);
lambdak = temp_sol(n+1:n+m);
uk  = temp_sol(n+m+1:2*n+m);

vk = (1/n)*(xk'*uk);
dgap(i) = vk ;
%iter(i) = i;
endwhile

iter=i;
opt = [xk; lambdak; uk]
xx = xk
ux = uk 

for j=1:iter-1
  
  rat(j) = dgap(j+1)/dgap(j) ;
  
endfor

fid = fopen('ShortStep_1010.txt','wt');
for ii = 1:iter-1
    fprintf(fid,'%g\t',rat(:,ii));
    fprintf(fid,'\n');
end
fclose(fid)