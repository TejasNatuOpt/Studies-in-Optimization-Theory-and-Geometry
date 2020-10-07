% Code implements the Penalty funtion method to solve example 9.2.4 from Bazaraa Shetty and Sherali
% Uses Modified Newton's Method to solve the unconstrained optimization problem ...
% ... at each stage.

clc
clear all

f = @minfun_pen;
gfx = @grad_pen;
hess = @hessianmat_pen;

tol = 10^-4;

xk = [2;1]; % Initiaization
mu = 0.1; % Start with penalty parameter mu=0.1
beta = 10; % Increase mu by this factor 

for i=1:5
  
  temp = gfx(xk,mu);
  grad_norm  = norm(temp);
  H = hess(xk,mu);
  
  while grad_norm > tol
    
    [L,t] = Modified_Chol(H);
     dk = fwdbacksubs(L,-temp,2);
     alpha_k = lin_search_pen(xk,dk', mu);
     xk = xk + alpha_k*dk';
     H = hess(xk,mu);
     temp = gfx(xk,mu);
     grad_norm = norm(temp);
  
  endwhile

  xk_temp=xk % optimal solution for mu{k} 
   
  y(i) = xk(1);
  z(i) = xk(2);
   
  tu1 = mu*(xk(1)^2-xk(2))*(xk(1)^2-xk(2)) % mu(k)*alpha(x) --> 0 as mu(k) increases
  tu2 = (xk(1)^2-xk(2))*(xk(1)^2-xk(2)) % alpha(x) --> 0 as mu(k) increases

  mu = beta*mu
  
endfor 
x_star = xk % optimal solution for the given constrained problem

clf;
 colormap ("default");
 f = @(x,y) (x.-2).^4 + (x.-2*y).^2;
 ezcontour (f, [-2, 2]);
 hold on;

plot(y,z,'-o')
hold on;

zz = linspace(-3,3,1000);
zy = zz.^2;
plot(zz,zy)
title ("Iterates for the constrained problem")




