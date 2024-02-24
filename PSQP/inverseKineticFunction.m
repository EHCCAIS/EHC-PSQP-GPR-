
format long
load("point in robot coordinate.mat");
angle = xlsread('angle values.xlsx');

angle = angle(1: 210, 1: 6);
angle(:,2) = - (angle(:,2) + 90);
angle(:,3) = - (angle(:,3) - 90);
angle(:,4) = - angle(:,4);

angle = (angle./180).* pi;

%Modify the collected points
pr = p(1:210,:);

% dataset
L1 = 815;
L2 =  8.522089633996554 * 100 ;
L3 = 1.452476708159203 * 100;
L4 =  8.199752577952532 * 100;
L5 = 2.743243185435589 * 100;

L6 = 3.474542681132154 * 100;

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

eomg = 1;
ev = 0.0001;

sz = size(angle);
for i = 1 : sz
theta1 = angle(i,1);
theta2 = angle(i,2);
theta3 = angle(i,3);
theta4 = angle(i,4);
theta5 = angle(i,5);
theta6 = angle(i,6);


thetalist = [theta1; theta2;  theta3;  theta4;  theta5; theta6];
Ts = FKinSpace(M,Slist,thetalist);
Ts(1:3,4) = pr(i,:)';
[thetalist, success] = IKinSpace(Slist, M, Ts, thetalist, eomg, ev);
if (success) 
    angleReal(i,: ) = thetalist';
    success = 0;
else angleReal(i,: ) = [ 0 0 0 0 0 0];
    i
end

% err(i,:) = Ts(1:3,4)' - pr(i,:);
end


angleError = angleReal - angle;


