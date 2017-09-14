function[Subject] = SpineBase(Subject,Name,num)
Subject.SpineBaseZcm = Subject.SpineBaseZ * 100;
X1 = 1:1:402;
figure(num);
subplot(1,1,1);
plot(X1,Subject.SpineBaseZcm,'g')
xlabel('Time in Frames');
ylabel('Distance from Spine Base to Camera');
title(['Spine Distance vs Time',Name]);
end