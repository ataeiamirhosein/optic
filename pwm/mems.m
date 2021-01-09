%mirror angle control program
go = true;
while go

clc;
close all;
clear;

deg_x = randi(45);
deg_y = randi(45);

%print angle
disp('x angle is: ')
disp(deg_x)
disp('y angle is: ')
disp(deg_y)

% scale from 0 to 45 to 0 to 180

deg_x = deg_x * 4;
deg_y = deg_y * 4;

%variable is between 0 to 180

motor_one = 90;
motor_four = 90;

motor_two = 90;
motor_three = 90;

%update position

if (deg_x < motor_one) && (deg_y < motor_four)
motor_one = deg_x;
motor_two = 180 - deg_y;
motor_three = 180 - deg_x;
motor_four = deg_y;
end

if (deg_x > motor_one) && (deg_y > motor_four)
motor_one = deg_x;
motor_two = 180 - deg_y;
motor_three = 180 - deg_x;
motor_four = deg_y;
end

if (deg_x < motor_one) && (deg_y > motor_four)
motor_one = deg_x;
motor_two = 180 - deg_y;
motor_three = 180 - deg_x;
motor_four = deg_y;
end

if (deg_x > motor_one) && (deg_y < motor_four)
motor_one = deg_x;
motor_two = 180 - deg_y;
motor_three = 180 - deg_x;
motor_four = deg_y;
end

% one of them set to 90

if (deg_x == 90) && (deg_y < motor_four)
motor_one = 90;
motor_two = 180 - deg_y;
motor_three = 90;
motor_four = deg_y;
end

if (deg_x == 90) && (deg_y > motor_four)
motor_one = 90;
motor_two = 180 - deg_y;
motor_three = 90;
motor_four = deg_y;
end

if (deg_x < motor_one) && (deg_y == 90)
motor_one = deg_x;
motor_two = 90;
motor_three = 180 - deg_x;
motor_four = 90;
end

if (deg_x > motor_one) && (deg_y == 90)
motor_one = deg_x;
motor_two = 90;
motor_three = 180 - deg_x;
motor_four = 90;
end

%special situation

if (deg_x == 90) && (deg_y == 90)
motor_one = 90;
motor_two = 90;
motor_three = 90;
motor_four = 90;
end

%run control function

set_pos(motor_one, motor_two, motor_three, motor_four);

%wait for see and run again
pause(6);
go = true;
end