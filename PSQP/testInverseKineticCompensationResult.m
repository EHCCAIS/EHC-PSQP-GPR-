
L1 = 455;
L2 = 592.4670395821915  ;
L3 =  152.3984753866379    ;
L4 = 641.2021396661246   ;
L5 = 193.16;
L6 = 150.1858692122497   ;

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

    
for i = 1 : 239
theta1 = angleReal(i,1);
theta2 = angleReal(i,2);
theta3 = angleReal(i,3);
theta4 = angleReal(i,4);
theta5 = angleReal(i,5);
theta6 = angleReal(i,6);


thetalist = [theta1; theta2;  theta3;  theta4;  theta5; theta6];
Ts = FKinSpace(M,Slist,thetalist);
err(i,:) = Ts(1:3,4)' - pr(i,:);
end

temp =  err.^2 ;
temp = temp(:,1) +temp(:,2) +temp(:,3);
temp = sqrt(temp);

err_AfterInverseKinetic = temp;
