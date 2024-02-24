
x0=[ 850 145 820  350 ]; 

%% SQP with rod length and zero deviation
x0=[ 850 145 820  350 0 0 0 0];

options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
A = [];
b = [];
Aeq = [];
beq = [];
lb = [0  0   0   0  -3 -3 -3 -3 ];
ub = [ 880  150   830   360  3 3 3 3];
nonlcon = [];
disp('SQP with rod length and zero deviation')
x2 = fmincon(@fmin_4angle,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
x2   

%% SQP with rod length, zero deviation and ¦Ø1
x0=[800 850 145 820 260 350 0  0 0 0 0 0];

options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
A = [];
b = [];
Aeq = [];
beq = [];
lb = [0  0   0   0 0 0 -3 -3 -3 -3 -3 -3];
ub = [900  880  150   830  290 360  3 3 3 3 3 3];
nonlcon = [];
disp('SQP with rod length, zero deviation and ¦Ø1')
x4 = fmincon(@fmin_6angle_l6,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
x4   



%% PLM
x0=[815 850 145 820 2.741428685270667* 100 350 0  0 0 0 0 0];
options = optimoptions(@lsqnonlin,'Algorithm','trust-region-reflective','Display','iter');
options.Algorithm = 'levenberg-marquardt';
x6 = lsqnonlin(@fmin_6angle_l6,x0,[],[],options)



