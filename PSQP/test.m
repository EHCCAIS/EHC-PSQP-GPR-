format long
load("point in robot coordinate.mat");
angle = xlsread('angle value.xlsx');

%According to actual settings
angle(1,1) = 0;
angle(1,2) = 0;
angle(1,3) = 0;
angle(1,4) = 0;
angle(1,5) = 0;
angle(1,6) = 0;

L1 = 815;
L2 =  850 ;
L3 = 145 ;
L4 = 820;
L5 = 170;
L6 = 350;

 M=[ 0  0 1 L4 + L5 + L6;
     0 -1 0            0;
     1  0 0 L1 + L2 + L3;
     0  0 0            1 ]  ;

Slist =[ [0; 0; 1;        0;            0;          0], ...d
        [0; -1; 0;       L1;            0;       - L6],...
        [0; -1; 0;  L1 + L2;            0;       - L6],...
        [1; 0; 0;        0;  L1 + L2 + L3;          0],...
        [0; 1; 0; -(L1+L2+L3);             0;  L6 + L4],...
        [1; 0; 0;        0;   L1 + L2 + L3;         0]];


i = 1;
theta1 = angle(i,1);
theta2 = angle(i,2);
theta3 = angle(i,3);
theta4 = angle(i,4);
theta5 = angle(i,5);
theta6 = angle(i,6);


thetalist = [theta1; theta2;  theta3;  theta4;  theta5; theta6];
Ts = FKinSpace(M,Slist,thetalist);
fk(1,:) = Ts(1:3,4)'
