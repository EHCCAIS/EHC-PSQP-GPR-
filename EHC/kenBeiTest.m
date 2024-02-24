

xtest = angle_real_test_set;


i= 1;
y_predict(:,i) = predict(gprMdl,xtest);


i= 2;
y_predict(:,i) = predict(gprMd2,xtest);


i= 3;
y_predict(:,i) = predict(gprMd3,xtest);

i= 4;
y_predict(:,i) = predict(gprMd4,xtest);

i= 5;
y_predict(:,i) = predict(gprMd5,xtest);


i= 6;
y_predict(:,i) = predict(gprMd6,xtest);


y_predict = y_predict./100000;

y_shijiaoqi = xtest - y_predict;

angle_teach = y_shijiaoqi .*(180/pi) ;




angle_teach(:,1) = - angle_teach(:,1) + 45.44;
angle_teach(:,2) = - angle_teach(:,2) - 90;
angle_teach(:,3) = - angle_teach(:,3) + 90;
angle_teach(:,4) = - angle_teach(:,4);
angleangle
disp('ANGLE')
filename = 'testdata.xlsx';
xlswrite(filename,angle_teach);