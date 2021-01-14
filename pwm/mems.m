%mirror angle control program
go = true;
while go

clc;
close all;
clear;

sec = 0.02; % pls do not change it (( constant simulation time ))

deg_x = randi(45);
deg_y = randi(45);

%print angle
disp('# mirror(x) angle is: ')
disp(deg_x)
disp('# mirror(y) angle is: ')
disp(deg_y)

%scale from 0 to 45 to 0 to 180

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

%one of them set to 90

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

%run all motors control function (( each motor step is equal to one deg ))

set_pos(motor_one, motor_two, motor_three, motor_four, sec);

el_ti1 = motor_one * sec;
disp('- elapsed time motor1: ')
disp(el_ti1)

el_ti2 = motor_two * sec;
disp('- elapsed time motor2: ')
disp(el_ti2)

el_ti3 = motor_three * sec;
disp('- elapsed time motor3: ')
disp(el_ti3)

el_ti4 = motor_four * sec;
disp('- elapsed time motor4: ')
disp(el_ti4)

time = zeros(1,4);
time(1,1) = el_ti1;
time(1,2) = el_ti2;
time(1,3) = el_ti3;
time(1,4) = el_ti4;
t = max(time);

ttt = t / sec;

%time complexity
disp('@ greater elapsed time need: ')
disp(t)

tt = zeros(1,200);

for i = 1:200
if (i < ttt)
tt(1,i) = 5;
end
end

%amp shaping (( tau ))
tt(1,ttt-3) = 3.5;
tt(1,ttt-2) = 2.5;
tt(1,ttt-1) = 1.5;

%time plot
figure
suptitle('amplitude per time')

xx = 1:200;

b = numel(tt);

for ii = 1:b
plot(xx(1:ii) / 50, (tt(1:ii)))
set(gca,'XLim',[0 4]);
set(gca,'YLim',[0 6]); % is constant because amp is allways 5 volts
set(gca,'XTick',[0 0.5 1 1.5 2 2.5 3 3.5 4])
set(gca,'YTick',[0 1 2 3 4 5 6])
end

xlabel('time')
ylabel('amp')

%wait for see and run again
pause(10);
go = true;
end