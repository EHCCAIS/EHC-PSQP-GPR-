%gpr
load("angle_nominal_test_set.mat")
load("angle_nominal_train_set.mat")
load("angle_real_test_set.mat")
load("angle_real_train_set.mat")


train_err = angle_real_train_set - angle_nominal_train_set ;
test_err = angle_real_test_set - angle_nominal_test_set ;

train_err = train_err.*100000;
test_err = test_err.*100000;

% train_err = train_err;
% test_err = test_err;

x_train = angle_nominal_train_set;
y_train = train_err;
x_test = angle_nominal_test_set;
y_test = test_err;



for i = 1 : 6
%         i = 1;
    x = x_train;
    y = y_train(:,i);
    Xtrain = x;
    ytrain = y;


    X = x;
    sigma0 = std(ytrain);
    sigmaF0 = sigma0;
    d = size(X,2);
    sigmaM0 = 10*ones(d,1);

%     gprMdl = fitrgp(X,ytrain,'Basis','constant','FitMethod','exact',...
%     'PredictMethod','exact','KernelFunction','ardsquaredexponential',...
%     'KernelParameters',[sigmaM0;sigmaF0],'Sigma',sigma0,'Standardize',1)
    rng default
    gprMdl = fitrgp(X,ytrain,'KernelFunction','squaredexponential',...
    'OptimizeHyperparameters','auto','HyperparameterOptimizationOptions',...
    struct('AcquisitionFunctionName','expected-improvement-plus'));

    xtest = x_test;
    ytest = y_test(:,i);
%     L = loss(gprMdl,xtest,ytest)
    ypred = predict(gprMdl,xtest);
%     y_predict(:,1)
    y_predict(:,i) = ypred;
end

y_predict = y_predict./100000;

% y_predict = y_predict;

angle_predict = y_predict + angle_nominal_test_set;

