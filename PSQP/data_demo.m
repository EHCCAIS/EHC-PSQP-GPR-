format long
load("degree value.mat") %degree
load("point in robot coordinate.mat") %point
position = pr;

angle(:,2) =angle(:,2) + 90 ;
angle(:,5) =angle(:,5) + 90 ;

angle =angle.*(pi/180);

% d_theta2 = 5634.2 ;
% d_theta3 = 1.7;
% d_theta4 = 1.7;
% d_theta5 = 7190.8;
% d_theta6 = 1.1;
% angle(:,2) =angle(:,2) + 90 +d_theta2;
% angle(:,3) =angle(:,3) +d_theta2;
% angle(:,4) =angle(:,4)+d_theta2;
% angle(:,5) =angle(:,5) + 90+d_theta5;
% angle(:,6) =angle(:,6)+d_theta6;


i=1;
theta6 = angle(i,6);

% T67 = [cos(theta6)   sin(theta6)         0         100;
%  -sin(theta6)    cos(theta6)         0        100;
%        0         0    1.0000              10;
%          0         0         0    1.0000;
%     ];

% According to actual settings
L1=Link([0       455      150.3243     pi/2      0     ]); 
L2=Link([pi/2    0       592.2479   0         0     ]);
L3=Link([0       0        152.864    pi/2      0     ]);
L4=Link([0       638.5421  0       pi/2      0     ]);
L5=Link([0       0        0       -pi/2      0     ]);
L6=Link([0       193.16      0        0         0     ]);
robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','manman'); 


temp = robot.fkine(angle(1,:));
temp = double(temp) ;
% temp = T67*temp;

fk_positon(1,:) = ( temp(1:3,4) )';


for i=2:239
    
% theta6 = angle(i,6);

% T67 = [cos(theta6)   sin(theta6)         0         10;
%  -sin(theta6)    cos(theta6)         0        10;
%        0         0    1.0000              10;
%          0         0         0    1.0000;
%     ];
    
temp = robot.fkine(angle(i,:));
temp = double(temp) ;
% temp = T67*temp;
fk_positon(i,:) = ( temp(1:3,4) )';


% 
% p(i-1) = vecnorm( position(i,:) - position(i-1,:) ) ;
% f(i-1) = vecnorm( fk_positon(i,:) - fk_positon(i-1,:) );

% p(i-1) = vecnorm( position(i,:) - position(1,:) ) ;
% f(i-1) = vecnorm( fk_positon(i,:) - fk_positon(1,:) );

end

% f-p

err = fk_positon - position;

% 13组 86组  143组 169组 190组