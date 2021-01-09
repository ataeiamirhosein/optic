function set_pos(m1, m2, m3, m4)

% from 0 to 180 to 0 to 10
mm1 = zeros(1,180);
mm2 = zeros(1,180);
mm3 = zeros(1,180);
mm4 = zeros(1,180);

for t1 = 1:181
if (t1 < m1)
mm1(1,t1) = 5; % 5 volt amplitude considered
end
end

for t2 = 1:181
if (t2 < m2)
mm2(1,t2) = 5; % 5 volt amplitude considered
end
end

for t3 = 1:181
if (t3 < m3)
mm3(1,t3) = 5; % 5 volt amplitude considered
end
end

for t4 = 1:181
if (t4 < m4)
mm4(1,t4) = 5; % 5 volt amplitude considered
end
end

%simultaneous plotting
figure
suptitle('motors situation')

x = 1:180;

n1 = numel(mm1);
subplot(2,2,1)
hold on
for p1 = 1:n1
plot(x(1:p1),mm1(1:p1))
pause(0.03)
end
title('motor1')
xlabel('step')
ylabel('amp')

n2 = numel(mm2);
subplot(2,2,2)
hold on
for p2 = 1:n2
plot(x(1:p2),mm2(1:p2))
pause(0.03)
end
title('motor2')
xlabel('step')
ylabel('amp')

n3 = numel(mm3);
subplot(2,2,3)
hold on
for p3 = 1:n3
plot(x(1:p3),mm3(1:p3))
pause(0.03)
end
title('motor3')
xlabel('step')
ylabel('amp')

n4 = numel(mm4);
subplot(2,2,4)
hold on
for p4 = 1:n4
plot(x(1:p4),mm4(1:p4))
pause(0.03)
end
title('motor4')
xlabel('step')
ylabel('amp')

%end of function position and return to main
end