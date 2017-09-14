function[Subject1,Subject2,Subject3,Subject4] = Graph_Ankle(Subject1,Subject2,Subject3,Subject4,Name1,Name2,Name3,Name4,num)
display(['Note: in Figure ',num2str(num), ' Ankle Distance refers to the z coordinate of ankle joint or the linear distance of the ankle from the camera']);
figure(num)
X1 = 1:1:402;
Subject1.AnkleRightZcm = 100*Subject1.AnkleRightZ;
subplot(4,1,1)
plot(X1,Subject1.AnkleRightZcm,'r');
xlabel('Time in frames');
ylabel('Ankle Distance in cm');
title(['Ankle Distance vs. Time ',Name1]);
hold on

Subject1.AnkleLeftZcm = 100*Subject1.AnkleLeftZ;
subplot(4,1,1)
plot(X1,Subject1.AnkleLeftZcm,'b');
hold on
legend('Right Ankle','Left Ankle')

Subject2.AnkleRightZcm=100*Subject2.AnkleRightZ;
subplot(4,1,2)
plot(X1,Subject2.AnkleRightZcm,'r');
xlabel('Time in Frames');
ylabel('Ankle Distance in cm');
title(['Ankle Distance vs. Time ',Name2]);
hold on

Subject2.AnkleLeftZcm = 100*Subject2.AnkleLeftZ;
subplot(4,1,2)
plot(X1,Subject2.AnkleLeftZcm,'b');
hold on
legend('Right Ankle','Left Ankle')

Subject3.AnkleRightZcm=100*Subject3.AnkleRightZ;
subplot(4,1,3)
plot(X1,Subject3.AnkleRightZcm,'r');
xlabel('Time in Frames');
ylabel('Ankle Distance in cm');
title(['Ankle Distance vs. Time ',Name3]);
hold on

Subject3.AnkleLeftZcm = 100*Subject3.AnkleLeftZ;
subplot(4,1,3)
plot(X1,Subject3.AnkleLeftZcm,'b');
hold on
legend('Right Ankle','Left Ankle')

Subject4.AnkleRightZcm=100*Subject4.AnkleRightZ;
subplot(4,1,4)
plot(X1,Subject4.AnkleRightZcm,'r');
xlabel('Time in Frames');
ylabel('Ankle Distance in cm');
title(['Ankle Distance vs. Time ',Name4]);
hold on

Subject4.AnkleLeftZcm = 100*Subject4.AnkleLeftZ;
subplot(4,1,4)
plot(X1,Subject4.AnkleLeftZcm,'b');
hold on
legend('Right Ankle','Left Ankle')