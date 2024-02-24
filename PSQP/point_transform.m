%Convert coordinates from laser coordinate system to robot coordinate system

 % eg : load('matlab.mat')
nums = xlsread('end effect position.xlsx');

xyz1 = nums(:,1:3);
xyz1(:, 4) = 1;
% x = nums(:, 1);
% y = nums(:, 2);
% z = nums(:, 3);


%Calculate converted points
p = invT *xyz1';
p = p';
p = p(:, 1:3);


save('points in robot coordinate.mat', 'p');