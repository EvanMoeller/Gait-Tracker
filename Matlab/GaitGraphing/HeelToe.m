function[Subject] = HeelToe(Subject,Name,num)
Subject.Varcm = 100 *sqrt(((Subject.FootRightZ-Subject.AnkleRightZ).^2) + ((Subject.AnkleRightY-Subject.FootRightY).^2));
X1 = 1:1:402;
figure(num);
subplot(1,1,1)
plot(X1,Subject.Varcm,'r')
xlabel('Time in Frames');
ylabel('Var in cm');
title(['Var vs Time ',Name]);
hold on