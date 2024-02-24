y_predict = myNeuralNetworkFunction(angle_real_test_set);

xtest = angle_nominal_test_set;


y_predict = y_predict./100000;

y_shijiaoqi = xtest - y_predict;

angle_teach = y_shijiaoqi .*(180/pi) ;

%进行角度转换操作



angle_teach(:,1) = - angle_teach(:,1) + 45.45;%一轴要按标定时，具体分析角度
angle_teach(:,2) = - angle_teach(:,2) - 90;
angle_teach(:,3) = - angle_teach(:,3) + 90;
angle_teach(:,4) = - angle_teach(:,4);

disp('NN')
filename = 'testdata_nn.xlsx';
xlswrite(filename,angle_teach);