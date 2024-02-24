
load("angle_nominal_test_set.mat")
load("angle_nominal_train_set.mat")
load("angle_real_test_set.mat")
load("angle_real_train_set.mat")

train_err = angle_real_train_set - angle_nominal_train_set ;

train_err = train_err.*100000;


% data=zscore(csvread('GaussaianData.csv'));
% Input -> x, Output -> y
% x=data(:,1:end-1);
% y=data(:,end);

for axis = 1 : 6
x = angle_real_train_set;
y = train_err(:,axis);
% Number of data points
N=length(x);
alpha=zeros(N,1);
% Tolerence value
norm1=10e2; tol=0.2;
% Maximum number of iterations
itr=0; maxItr=10e2;
eps=0.1;
% Algorithm
while (norm1>tol && itr<maxItr)
    alpha_old=alpha;
    alpha_=alpha;
    for i=1:N
        alpha(i)=alpha(i) + y(i) -eps*sign(alpha(i))...
            -alpha'*kernel(x,x(i,:),'g')';
        
        if alpha_(i)*alpha(i)<0
            alpha(i)=0;
        end
        
    end
norm1=norm(alpha_old-alpha);
itr=itr+1;
end
% fprintf('Total number of iteration %d',itr)
% Weights
w=sum(alpha.*x)
% Bias
b=mean(y-(w*x')' -eps*ones(N,1))
% Predicted values

x = angle_real_test_set;%angle_real  test 

N=length(x);
for j=1:N
    fx1(j,:)=alpha(j)*kernel(x,x(j,:),'g')';
end
fx=sum(fx1)';
y_predict(:, axis) = fx;

end


%% compensation angle
xtest = angle_nominal_test_set;

y_predict = y_predict./100000;

y_shijiaoqi = xtest - y_predict;

angle_teach = y_shijiaoqi .*(180/pi) ;


angle_teach(:,1) = - angle_teach(:,1) + 45.45;
angle_teach(:,2) = - angle_teach(:,2) - 90;
angle_teach(:,3) = - angle_teach(:,3) + 90;
angle_teach(:,4) = - angle_teach(:,4);

disp('SVG方法 把角度保存成Excel，输出')
filename = 'testdata_svm.xlsx';
xlswrite(filename,angle_teach);

