clc;
clear;
close all;
%objective function 
f = @(Q) 0.03*Q(1)^2 + 0.02*Q(2)^2;
%initial guess
Q0 = [50; 50];
%water demand constraint 
Aeq = [1 1];
beq = 100;
%lower and upper bounds
lb =[0; 0];
ub =[80; 70];
%volume constraint 
nonlcon=@(x) deal([], pi*x(1)^2*x(2)-v);
%optimization 
options = optimoptions('fmincon', 'Display' , 'iter');
[Q, fval]= fmincon(f,Q0,[],[],Aeq,beq,lb,ub,[],options);
%display results 
fprintf('Pump 1 flow =%.2f L/s\n', Q(1));
fprintf('Pump 2 flow = %.2f L/s\n', Q(2));
fprintf('Minimum operating cost index  =%.2f  m^2\n', fval);
%plots
q1= linspace(30,80,100);
q2 =100-q1;
Cost= 0.03*q1.^2+0.02*q2.^2;
plot(q1,cost,'LineWidth',2);
hold on;
plot((Q1),fval,'ro');
xlabel('Pump 1 Flow Rate (L/s)');
ylabel('Operating Cost Index');
title('Minimization of Water Pump Operating Cost');
grind on;
legend('operating cost' ,'optimal solution');

