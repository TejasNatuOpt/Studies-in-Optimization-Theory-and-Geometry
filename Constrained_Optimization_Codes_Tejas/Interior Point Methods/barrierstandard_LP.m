%Barrier Method - By Tejas Natu

% Solves the linear programming using the Barrier Method
% General Implementation 
% Performs backtracking in the code itself 

% Backtracking code learnt and taken from ...
%... statweb.stanford.edu/~candes/teaching/acm113/Handouts/sumt.pdf

clc
clear all
m = 5; n = 10;
ALPHA = .1; BETA = .7;

A = randn(m,n);

x0 = abs(randn(n,1));
s = 1./x0; % s is u
z = rand(m,1);


b = A*x0;
c = A'*z+s;

%%%%%%%%%% GNU LP Kit %%%%%%%%%%%%%

lb = [0, 0, 0, 0, 0,0,0,0,0,0]';
ub = [];
ctype = "SSSSS";
vartype = "CCCCCCCCCC";
s = 1;

param.msglev = 1;
param.itlim = intmax;

[xmin, fmin, status, extra] = ...
   glpk(c, A, b, lb, ub, ctype, vartype, s, param);
   
x_sim = xmin 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = 1;
mu = 50;

f = @minfun_lp1;
gfx = @grad_lp1;
hess = @hessianmat_lp1;

eps = 10^-6;

dgap = n/t
xk=x0
zk=z
i=0;
while dgap > 1e-5
  i=i+1;
  lambda2 = 20 ;
  eps12 = 0.5*lambda2 ;
  
  j=0;
while eps12 > eps 
       j=j+1;
       
      dx = [hess(xk, t, A, c) A'; A zeros(m,m)]\[-gfx(xk, t, A, c);zeros(m,1)];
      d = dx(1:n);
      dtil = dx(n+1:n+m);
      s=1;
      y = xk+s*d;
      while (min([xk+s*d] ) < 0)
          s = BETA*s;
      end 
      s = s
      temp1 = f(xk+s*d, t, A, c);
      temp2 = f(xk, t, A, c)+ALPHA*s*gfx(xk, t, A, c)'*d;
     while temp1 > temp2
           
          s = BETA*s ;
          temp1 = f(xk+s*d, t, A, c);
          temp2 = f(xk, t, A, c)+ALPHA*s*gfx(xk, t, A, c)'*d;
         
      endwhile   
      
     xk = xk + s*d;
     zk = zk + s*dtil;
     lambda2 = d'*(hess(xk, t, A, c))*d;
     eps12 = 0.5*lambda2;
      
endwhile
niter = j
t = mu*t
dgap = n/t

endwhile 

i=i
x_star = xk
%x_sim = x_sim 