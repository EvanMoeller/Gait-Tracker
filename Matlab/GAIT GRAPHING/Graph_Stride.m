function[Subject1,Subject2,Subject3,Subject4] = Graph_Stride(Subject1,Subject2,Subject3,Subject4,Name1,Name2,Name3,Name4,num)
X1 = 1:1:402;
figure(num);
subplot(2,1,1);
plot(X1,Subject1.Stridecm,'k');
xlabel('Time in Frames');
ylabel('Distance Between knee joints in cm');
title('Stride vs Time');
hold on

subplot(2,1,1);
plot(X1,Subject2.Stridecm,'r');
xlabel('Time in Frames');
ylabel('Distance Between knee joints in cm');
title('Stride vs Time');
hold on

subplot(2,1,1);
plot(X1,Subject3.Stridecm,'g');
xlabel('Time in Frames');
ylabel('Distance Between knee joints in cm');
title('Stride vs Time');
hold on

subplot(2,1,1);
plot(X1,Subject4.Stridecm,'b');
xlabel('Time in Frames');
ylabel('Distance Between knee joints in cm');
title('Stride vs Time');
hold on
legend(Name1,Name2,Name3,Name4);
end
