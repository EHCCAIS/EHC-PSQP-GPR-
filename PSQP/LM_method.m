%LM method (for compare)
%d1,d4,d6,a1,a2 ,a3,a6,
% L1 = 455;
% L2 =  592.2479 ;
% L3 = 152.864 ;
% L4 = 638.5421;
% L5 = 193.16;
% L6 = 150.3243;




% A = [];
% b = [];
% Aeq = [];
% beq = [];
% lb = [ 0 0 0 0 0 0 0 ];
% 
% Q = fmincon(@fmin,x0,A,b,Aeq,beq,lb);
% Q

x0=[ 592.2479 152.864 638.5421 150.3243 ];
options = optimoptions('lsqnonlin','Display','iter','Algorithm','levenberg-marquardt');
A = [];
b = [];
Aeq = [];
beq = [];
lb = [ 0 0 0 0 0 0 0 ];
ub = [];
nonlcon = [];
x = fmincon(@fmin,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)




% x0=[ 592.2479 152.864 638.5421 150.3243 ];
% x = lsqnonlin(@fmin,x0)
% 
% 
% x0=[ 592.2479 152.864 638.5421 150.3243 0 0 1];
% x = lsqnonlin(@fmin6Dimension,x0)