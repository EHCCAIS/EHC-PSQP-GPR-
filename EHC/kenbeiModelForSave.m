load("angle_nominal_test_set.mat")
load("angle_nominal_train_set.mat")
load("angle_real_test_set.mat")
load("angle_real_train_set.mat")

% 用误差，扩大10的五次方倍

% train_err = angleReal - angle ;
train_err = angle_real_train_set - angle_nominal_train_set ;

train_err = train_err.*100000;


x_train = angle_real_train_set;
y_train = train_err;


%% 1 AXIA
    i = 1;
    x = x_train;
    y = y_train(:,i);
    Xtrain = x;
    ytrain = y;


    X = x;
    sigma0 = std(ytrain);
    sigmaF0 = sigma0;
    d = size(X,2);
    sigmaM0 = 10*ones(d,1);


   

    rng default
    gprMdl = fitrgp(X,ytrain,'KernelFunction','squaredexponential',...
    'OptimizeHyperparameters','auto','HyperparameterOptimizationOptions',...
    struct('AcquisitionFunctionName','expected-improvement-plus'));


%% 2AXIA
    i = 2;
    x = x_train;
    y = y_train(:,i);
    Xtrain = x;
    ytrain = y;


    X = x;
    sigma0 = std(ytrain);
    sigmaF0 = sigma0;
    d = size(X,2);
    sigmaM0 = 10*ones(d,1);



    gprMd2 = fitrgp(X,ytrain,'KernelFunction','squaredexponential',...
    'OptimizeHyperparameters','auto','HyperparameterOptimizationOptions',...
    struct('AcquisitionFunctionName','expected-improvement-plus'));


 %% 3AXIA
    i = 3;
    x = x_train;
    y = y_train(:,i);
    Xtrain = x;
    ytrain = y;


    X = x;
    sigma0 = std(ytrain);
    sigmaF0 = sigma0;
    d = size(X,2);
    sigmaM0 = 10*ones(d,1);


    rng default
    
    gprMd3 = fitrgp(X,ytrain,'KernelFunction','squaredexponential',...
    'OptimizeHyperparameters','auto','HyperparameterOptimizationOptions',...
    struct('AcquisitionFunctionName','expected-improvement-plus'));


  %% 4AXIA
    i = 4;
    x = x_train;
    y = y_train(:,i);
    Xtrain = x;
    ytrain = y;


    X = x;
    sigma0 = std(ytrain);
    sigmaF0 = sigma0;
    d = size(X,2);
    sigmaM0 = 10*ones(d,1);


    rng default
     
    gprMd4 = fitrgp(X,ytrain,'KernelFunction','squaredexponential',...
    'OptimizeHyperparameters','auto','HyperparameterOptimizationOptions',...
    struct('AcquisitionFunctionName','expected-improvement-plus'));


      %% 5AXIA
    i = 5;
    x = x_train;
    y = y_train(:,i);
    Xtrain = x;
    ytrain = y;


    X = x;
    sigma0 = std(ytrain);
    sigmaF0 = sigma0;
    d = size(X,2);
    sigmaM0 = 10*ones(d,1);


    rng default
    gprMd5 = fitrgp(X,ytrain,'KernelFunction','squaredexponential',...
    'OptimizeHyperparameters','auto','HyperparameterOptimizationOptions',...
    struct('AcquisitionFunctionName','expected-improvement-plus'));


          %% 6AXIA
    i = 6;
    x = x_train;
    y = y_train(:,i);
    Xtrain = x;
    ytrain = y;


    X = x;
    sigma0 = std(ytrain);
    sigmaF0 = sigma0;
    d = size(X,2);
    sigmaM0 = 10*ones(d,1);


    rng default
    gprMd6 = fitrgp(X,ytrain,'KernelFunction','squaredexponential',...
    'OptimizeHyperparameters','auto','HyperparameterOptimizationOptions',...
    struct('AcquisitionFunctionName','expected-improvement-plus'));



% angle_predict = mapminmax('reverse',y_predict,PS2);

% figure;
% plot(ytest,'r');
% hold on;
% plot(ypred,'b');
% legend('True response','GPR predicted values','Location','Best');
% hold off
% % plot(ytest - ypred);
% 
% angle_predict(:,i) = ypred.*(pi/180);