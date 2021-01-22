%% set position function (( live ))
function set_pos(m1, m2, m3, m4, s)

%up and down degree find
flag1=m1-90;
flag2=m2-90;
flag3=m3-90;
flag4=m4-90;

%from 0 to 180 for motors position ((each pulse go to specific position))
mm1 = zeros(1,180);
mm2 = zeros(1,180);
mm3 = zeros(1,180);
mm4 = zeros(1,180);

%for saving the degree
deg1 = zeros(1,90);
deg2 = zeros(1,90);
deg3 = zeros(1,90);
deg4 = zeros(1,90);

%% build a pulse shape for each position ((0 to 180 steps))
for t1 = 1:181
if (t1 < m1)
mm1(1, t1) = 5; % 5 volts amplitude considered
end
end

for t2 = 1:181
if (t2 < m2)
mm2(1, t2) = 5; % 5 volts amplitude considered
end
end

for t3 = 1:181
if (t3 < m3)
mm3(1, t3) = 5; % 5 volts amplitude considered
end
end

for t4 = 1:181
if (t4 < m4)
mm4(1, t4) = 5; % 5 volts amplitude considered
end
end

%% simultaneous plotting (( live ))
figure
suptitle('live motors pulse shape')

x = 1:180;

n1 = numel(mm1);
subplot(2,2,1)
hold on
for p1 = 1:n1
plot(x(1:p1), mm1(1:p1))
pause(s)
end
title('motor1')
xlabel('deg')
ylabel('amp')

n2 = numel(mm2);
subplot(2,2,2)
hold on
for p2 = 1:n2
plot(x(1:p2), mm2(1:p2))
pause(s)
end
title('motor2')
xlabel('deg')
ylabel('amp')

n3 = numel(mm3);
subplot(2,2,3)
hold on
for p3 = 1:n3
plot(x(1:p3), mm3(1:p3))
pause(s)
end
title('motor3')
xlabel('deg')
ylabel('amp')

n4 = numel(mm4);
subplot(2,2,4)
hold on
for p4 = 1:n4
plot(x(1:p4), mm4(1:p4))
pause(s)
end
title('motor4')
xlabel('deg')
ylabel('amp')

%% plot degree per time
counter1=0;
for d1 = 1:91
deg1(1,d1)=counter1;
if (counter1 < abs(flag1))
counter1 = counter1 + 1;
end
end

if (flag1<0)
deg1 = deg1(1,:) * (-1);
end

counter2=0;
for d2 = 1:91
deg2(1,d2)=counter2;
if (counter2 < abs(flag2))
counter2 = counter2 + 1;
end
end

if (flag2<0)
deg2 = deg2(1,:) * (-1);
end

counter3=0;
for d3 = 1:91
deg3(1,d3)=counter3;
if (counter3 < abs(flag3))
counter3 = counter3 + 1;
end
end

if (flag3<0)
deg3 = deg3(1,:) * (-1);
end

counter4=0;
for d4 = 1:91
deg4(1,d4)=counter4;
if (counter4 < abs(flag4))
counter4 = counter4 + 1;
end
end

if (flag4<0)
deg4 = deg4(1,:) * (-1);
end

figure
suptitle('degree per time')

subplot(2,2,1)
plot(deg1)
set(gca,'YLim',[-90 90]);
title('motor1')
xlabel('time')
ylabel('deg')

subplot(2,2,2)
plot(deg2)
set(gca,'YLim',[-90 90]);
title('motor2')
xlabel('time')
ylabel('deg')

subplot(2,2,3)
plot(deg3)
set(gca,'YLim',[-90 90]);
title('motor3')
xlabel('time')
ylabel('deg')

subplot(2,2,4)
plot(deg4)
set(gca,'YLim',[-90 90]);
title('motor4')
xlabel('time')
ylabel('deg')

%end of function position and return to main

end