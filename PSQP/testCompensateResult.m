
format long
load("point in robot coordinate.mat");
pr = p;
angle = xlsread('angle value.xlsx');
angle = angle(1: 210, 1: 6);

%According to actual settings
angle(:,1) = - (angle(:,1) -45.44);
angle(:,2) = - (angle(:,2) + 90);
angle(:,3) = - (angle(:,3) - 90);
angle(:,4) = - angle(:,4);

angle = (angle./180).* pi;
%%

L1 = 815;
L2 =  850 ;
L3 = 145 ;
L4 = 820;
L5 = 2.741428685270667* 100; 
L6 = 350;

 M=[ 0  0 1 L4 + L5 + L6;
     0 -1 0            0;
     1  0 0 L1 + L2 + L3;
     0  0 0            1 ]  ;

Slist = [[0; 0; 1;        0;            0;          0], ...d
        [0; -1; 0;       L1;            0;       - L6],...
        [0; -1; 0;  L1 + L2;            0;       - L6],...
        [1; 0; 0;        0;  L1 + L2 + L3;          0],...
        [0; 1; 0; -(L1+L2+L3);             0;  L6 + L4],...
        [1; 0; 0;        0;   L1 + L2 + L3;         0]];

for i = 1 : 210
    theta1 = angle(i,1);
    theta2 = angle(i,2);
    theta3 = angle(i,3);
    theta4 = angle(i,4);
    theta5 = angle(i,5);
    theta6 = angle(i,6);


    thetalist = [theta1; theta2;  theta3;  theta4;  theta5; theta6];
    Ts = FKinSpace(M,Slist,thetalist);
    err_BeforeCompensate(i,:) = Ts(1:3,4)' - pr(i,:);
end

temp =  err_BeforeCompensate.^2 ;
temp = temp(:,1) +temp(:,2) +temp(:,3);
temp = sqrt(temp);
err_BeforeCompensateSum = temp;

%% SQP with rod length and zero deviation
L1 = x4(1);
L2 =   x4(2);
L3 =   x4(3);
L4 =   x4(4);
L5 =  x4(5); 
L6 =   x4(6);


 M=[ 0  0 1 L4 + L5 + L6;
     0 -1 0            0;
     1  0 0 L1 + L2 + L3;
     0  0 0            1 ]  ;

Slist = [[0; 0; 1;        0;            0;          0], ...d
        [0; -1; 0;       L1;            0;       - L6],...
        [0; -1; 0;  L1 + L2;            0;       - L6],...
        [1; 0; 0;        0;  L1 + L2 + L3;          0],...
        [0; 1; 0; -(L1+L2+L3);             0;  L6 + L4],...
        [1; 0; 0;        0;   L1 + L2 + L3;         0]];

for i = 1 : 210
theta1 = angle(i,1)+  x4(7);
theta2 = angle(i,2) +   x4(8);
theta3 = angle(i,3) +   x4(9);
theta4 = angle(i,4) +   x4(10);
theta5 = angle(i,5) +   x4(11);
theta6 = angle(i,6)+  x4(12);


thetalist = [theta1; theta2;  theta3;  theta4;  theta5; theta6];
Ts = FKinSpace(M,Slist,thetalist);
err_AfterCompensateAndAngleAndLength(i,1:3) = Ts(1:3,4)' - pr(i,:);
end
temp =  err_AfterCompensateAndAngleAndLength.^2 ;
temp = temp(:,1) +temp(:,2) +temp(:,3);
temp = sqrt(temp);
err_AfterCompensateAndAngleAndLengthSum = temp;

%% SQP with rod length, zero deviation and ¦Ø1 
L1 = x5(1);
L2 =   x5(2);
L3 =   x5(3);
L4 =   x5(4);
L5 =  x5(5); 
L6 =   x5(6); 


 M=[ 0  0 1 L4 + L5 + L6;
     0 -1 0            0;
     1  0 0 L1 + L2 + L3;
     0  0 0            1 ]  ;

Slist = [[x5(13); x5(14);x5(15);        0;            0;          0], ...d
        [0; -1; 0;       L1;            0;       - L6],...
        [0; -1; 0;  L1 + L2;            0;       - L6],...
        [1; 0; 0;        0;  L1 + L2 + L3;          0],...
        [0; 1; 0; -(L1+L2+L3);             0;  L6 + L4],...
        [1; 0; 0;        0;   L1 + L2 + L3;         0]];

for i = 1 : 210
theta1 = angle(i,1)+  x5(7);
theta2 = angle(i,2) +   x5(8);
theta3 = angle(i,3) +   x5(9);
theta4 = angle(i,4) +   x5(10);
theta5 = angle(i,5) +   x5(11);
theta6 = angle(i,6)+  x5(12);


thetalist = [theta1; theta2;  theta3;  theta4;  theta5; theta6];
Ts = FKinSpace(M,Slist,thetalist);
err_AfterCompensateAndAngleAndLengthAndXYZ(i,1:3) = Ts(1:3,4)' - pr(i,:);
end
temp =  err_AfterCompensateAndAngleAndLengthAndXYZ.^2 ;
temp = temp(:,1) +temp(:,2) +temp(:,3);
temp = sqrt(temp);
err_AfterCompensateAndAngleAndLengthAndXYZSum = temp;



%% PLM
L1 = x6(1);
L2 =   x6(2);
L3 =   x6(3);
L4 =   x6(4);
L5 =  x6(5);
L6 =   x6(6);


 M=[ 0  0 1 L4 + L5 + L6;
     0 -1 0            0;
     1  0 0 L1 + L2 + L3;
     0  0 0            1 ]  ;

Slist = [[0; 0; 1;        0;            0;          0], ...d
        [0; -1; 0;       L1;            0;       - L6],...
        [0; -1; 0;  L1 + L2;            0;       - L6],...
        [1; 0; 0;        0;  L1 + L2 + L3;          0],...
        [0; 1; 0; -(L1+L2+L3);             0;  L6 + L4],...
        [1; 0; 0;        0;   L1 + L2 + L3;         0]];

for i = 1 : 210
theta1 = angle(i,1)+  x6(7);
theta2 = angle(i,2) +   x6(8);
theta3 = angle(i,3) +   x6(9);
theta4 = angle(i,4) +   x6(10);
theta5 = angle(i,5) +   x6(11);
theta6 = angle(i,6)+  x6(12);


thetalist = [theta1; theta2;  theta3;  theta4;  theta5; theta6];
Ts = FKinSpace(M,Slist,thetalist);
err_lsqnonlin(i,1:3) = Ts(1:3,4)' - pr(i,:);
end
temp =  err_lsqnonlin.^2 ;
temp = temp(:,1) +temp(:,2) +temp(:,3);
temp = sqrt(temp);
err_lsqnonlinSum = temp;

