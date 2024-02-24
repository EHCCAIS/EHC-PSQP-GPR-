% POE equation correctness test
% syms L1 L2 L3 L4 L5 L6
format long
load("point in robot coordinate.mat");
angle = xlsread('angle value.xlsx');
angle = angle(1: 210, 1: 6);
%According to actual settings
angle(:,1) = - (angle(:,1) -45.44); 
angle(:,2) = - (angle(:,2) + 90);
angle(:,3) = - (angle(:,3) - 90);
angle(:,4) = - angle(:,4);
% angle(:,5) = - angle(:,5);
% angle(:,5) = angle(:,5) + 90;

angle = (angle./180).* pi;


pr = p(1:210,:);




L1 = 815;
L2 =  850 ;
L3 = 145 ;
L4 = 820;
L5 = 274.3243;
L6 = 350; 
     M=[ 0  0 1 L4 + L5 + L6;
         0 -1 0            0;
         1  0 0 L1 + L2 + L3;
         0  0 0            1 ]  ;

    Slist = [[0; 0; 1 ;        0;            0;          0], ...d
            [0; -1; 0;       L1;            0;       - L6],...
            [0; -1; 0;  L1 + L2;            0;       - L6],...
            [1; 0; 0;        0;  L1 + L2 + L3;          0],...
            [0; 1; 0; -(L1+L2+L3);             0;  L6 + L4],...
            [1; 0; 0;        0;   L1 + L2 + L3;         0]];
% 
% sz = size(angle);
% i = 1;
% theta1 = angle(i,1);
% theta2 = angle(i,2);
% theta3 = angle(i,3);
% theta4 = angle(i,4);
% theta5 = angle(i,5);
% theta6 = angle(i,6);
% 
% 
% thetalist = [theta1; theta2;  theta3;  theta4;  theta5; theta6];
% Ts = FKinSpace(M,Slist,thetalist);
% fk(1,:) = Ts(1:3,4)';
% 
% for i = 2 : 50
% theta1 = angle(i,1);
% theta2 = angle(i,2);
% theta3 = angle(i,3);
% theta4 = angle(i,4);
% theta5 = angle(i,5);
% theta6 = angle(i,6);
% 
% 
% thetalist = [theta1; theta2;  theta3;  theta4;  theta5; theta6];
% Ts = FKinSpace(M,Slist,thetalist);
% % err(i,:) = Ts(1:3,4)' - pr(i,:);
% fk(i,:) = Ts(1:3,4)';
% err_fk(i - 1, :) =  fk(i,:) -fk(i - 1,:);
% err_p(i- 1,:) = pr(i,:) - pr(i - 1,:); 
% end
% 
% 
% err_fk_m = err_fk(:,1).^2 + err_fk(:,2).^2 + err_fk(:,3).^2;
% err_fk_n = err_p(:,1).^2 + err_p(:,2).^2 + err_p(:,3).^2;

sz = size(angle);
for i = 1 : sz(1)
theta1 = angle(i,1);
theta2 = angle(i,2);
theta3 = angle(i,3);
theta4 = angle(i,4);
theta5 = angle(i,5);
theta6 = angle(i,6);


thetalist = [theta1; theta2;  theta3;  theta4;  theta5; theta6];
Ts = FKinSpace(M,Slist,thetalist);
err(i,:) = Ts(1:3,4)' - pr(i,:);
end

