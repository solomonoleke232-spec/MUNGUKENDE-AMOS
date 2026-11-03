clc;
clear; 
close all;
%given parameters
n = 0.015;
s = 0.001;
A = 1.2;
%objective function (negative discharge)
f = @(x)-(1/n)*A*(A/(x(1)+ 2*x(2)))^(2/3)*sqrt(s);
%initial guess
x0 =[1.5; 0.8];
%constraints
Aeq = [];
Beq = [];
Aineq = [];
Bineq = [];
%bounds
lb=[0.5; 0.3];
ub=[4; 1.5];
%cross sectional area constraint
nonlcon = @(x) deal ([],x(1)*x(2)-A);
%optimization
[x,fval] =fmincon(f,x0,Aineq,bineq,Aeq,beq,lb,ub,nonlcon);
%results
Qmax= -fval;
fprintf('optimal width =%.3f m\n', x(1));
fprintf('optimal depth = %.3f m\n', x(2));
fprintf('Minimum discharge  = %.4f m^3/s\n', Qmax);
%plot
y = linspace(0.3,1.5,100);
b=A./y;
Q=(1/n)*A.*(A./(b+2*y)).^(2/3)*sqrt(s);
Plot(y,Qmax);
hold on;
plot(x(2),Qmax);
xlabel('Channel Depth (m)');
ylabel('Discharge (m^3/s)');
title('Optimization of Drainage channel Discharge');
grid on;
clc;
clear; 
close all;
%given parameters
n = 0.015;
s = 0.001;
A = 1.2;
%objective function (negative discharge)
f = @(x)-(1/n)*A*(A/(x(1)+ 2*x(2)))^(2/3)*sqrt(s);
%initial guess
X0 =[1.5; 0.8];
%constraints
Aeq = [];
Beq = [];
Aineq = [];
Bineq = [];
%bounds
lb=[0.5; 0.3];
ub=[4; 1.5];
%cross sectional area constraint
nonlcon = @(x) deal ([],x(1)*x(2)-A);
%optimization
[x,fval] =fmincon(f,x0,Aineq,bineq,Aeq,beq,lb,ub,nonlcon);
%results
Qmax= -fval;
fprintf('optimal width =%.3f m\n', x(1));
fprintf('optimal depth = %.3f m\n', x(2));
fprintf('Minimum discharge  = %.4f m^3/s\n', Qmax);
%plot
y = linspace(0.3,1.5,100);
b=A./y;
Q=(1/n)*A.*(A./(b+2*y)).^(2/3)*sqrt(s);
Plot(y,Qmax);
hold on;
plot(x(2),Qmax);
xlabel('Channel Depth (m)');
ylabel('Discharge (m^3/s)');
title('Optimization of Drainage channel Discharge');

