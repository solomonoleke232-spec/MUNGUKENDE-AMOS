clc;
clear;
close all;
%required volume 
V=10;
%objective function 
f = @(x) 2*pi*x(1)^2 + 2*pi*x(1)*x(2);
%initial guess
x0 = [1; 2];
%constraints
A = [];
b = [];
Aeq = [];
beq = [];
%lower and upper bounds
lb = [0.5; 1];
ub =[3; 10];
%volume constraint 
nonlcon=@(x) deal([], pi*x(1)^2*x(2)-v);
%optimization 
options = optimoptions('fmincoln','Display','iter');
[x, fval]= fmincon(f,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
%display results 
fprintf('optimal radius =%.3f m\n', x(1));
fprintf('optimal height =%.3f m\n', x(2));
fprintf('Minimum surface area  = %.3f m^2\n', fval);
%plots
r = linspace(0.7,2.5,100);
h=V./(pi*r.^2);
Area =2*pi*r.^2 + 2*pi*r.*h;
plot(r, Area, 'Linewidth', 2);
hold on;
plot(x(1),fval, 'ro', 'MarkerSize',8);
xlabel('Radius (m)');
ylabel('Surface Area (m^2)');
title('optimization of water Tank Surface Area');


