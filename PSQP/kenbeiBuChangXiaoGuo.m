pw = [
%  289.8936	2419.2073	171.9342
% 223.6474	2465.0027	188.0035
% 306.8300	2476.4756	269.7253
% 215.8100	2440.5554	185.7427
% 246.7547	2354.3157	96.3334  



290.0185	2419.1338	171.8785
223.6453	2464.9988	187.9532
306.8402	2476.4758	269.7382
215.8150	2440.5491	185.7566
246.7843	2354.2974	96.3396
160.4663	2343.9375	49.3953
154.6904	2357.6238	49.4370
155.5690	2393.5625	144.9758
];
pw(:, 4) = 1;
pw = pw';

T = [
  -0.136756102796848   0.990595569797454  -0.004264439643931   702.860343266781
  -0.990511159118481  -0.136801089262059  -0.013156961597461   3392.518269133386
  -0.013616607858823   0.002424680261984   0.999904349883551  -1034.557100554563
                   0                   0                   0   1.000000000000000
                   ] ;
invT = inv(T);               
pr = invT * pw;
pr =pr(1:3, :);
pr = pr';

L1 = 455;
L2 =  593.3520219767223  ;
L3 =  149.2203506147382  ;
L4 = 636.6943313630186  ;
L5 = 192.772363;
L6 =  127.1942268396575  ;

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

for i = 1 : 5
theta1 = xtest(i,1);
theta2 = xtest(i,2);
theta3 = xtest(i,3);
theta4 = xtest(i,4);
theta5 = xtest(i,5);
theta6 = xtest(i,6);


thetalist = [theta1; theta2;  theta3;  theta4;  theta5; theta6];
Ts = FKinSpace(M,Slist,thetalist);
err_AfterCompensate(i,:) = Ts(1:3,4)' - pr(i,:);
end
temp =  err_AfterCompensate.^2 ;
temp = temp(:,1) +temp(:,2) +temp(:,3);
temp = sqrt(temp);
err_AfterCompensateSum = temp;