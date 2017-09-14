function[Subject] = SpineAVG(Subject,Name,num)
Subject.SpineBaseAVGcm = (Subject.SpineBaseZ + Subject.SpineMidZ) * 50;
X1 = 1:1:402;
figure(num);
subplot(1,1,1);
plot(X1,Subject.SpineBaseAVGcm,'g')
xlabel('Time in Frames');
ylabel('Distance from Spine AVG to Camera in cm');
title(['Spine Distance vs Time ',Name]);
hold on
end