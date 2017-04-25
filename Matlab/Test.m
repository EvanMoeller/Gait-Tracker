clc
clear all
close all

fileName = 'Connor.xls';
data = xlsread(fileName);
frames = size(data,1);
thing = frames-1;
display(data)
display(frames)
xvals = zeros(1,thing);
x1vals = zeros(1,thing);
yvals = zeros(1,thing);
y1vals = zeros(1,thing);
zvals = zeros(1,thing);
z1vals = zeros(1,thing);

for i=1:1:thing
    
      x = [data(i,43),data(i+1,43)];
      x1 = [data(i,55),data(i+1,55)];
  
      y = [data(i,44),data(i+1,44)];
      y1 = [data(i,56),data(i+1,56)];
      
      z = [data(i,45),data(i+1,45)];
      z1 = [data(i,57),data(i+1,57)];
      
      xvals(1,i) = data(i,43);
      x1vals(1,i) = data(i,55);
      yvals(1,i) = data(i,44);
      y1vals(1,i) = data(i,56);
      zvals(1,i) = data(i,45);
      z1vals(1,i) = data(i,57);
      
%       subplot(3,1,1)
%       plot([i,i+1],x,'r')
%       plot([i,i+1],x1,'b')
%       title('X-axis')
%       hold on
%       
%       subplot(3,1,2)
%       plot([i,i+1],y,'r')
%       plot([i,i+1],y1,'b')
%        title('Y-axis')
%       hold on
%       
%       subplot(3,1,3)
%       plot([i,i+1],z,'r')
%       plot([i,i+1],z1,'b')
%        title('Z-axis')
%       hold on
     
end


      subplot(2,2,1)
      plot(xvals,'r')
      hold on
      plot(x1vals,'b')
      title('X-axis')
      
      
      subplot(2,2,2)
      plot(yvals,'r')
      hold on
      plot(y1vals,'b')
       title('Y-axis')
      
      
      subplot(2,2,3)
      plot(zvals,'r')
      hold on
      plot(z1vals,'b')
       title('Z-axis')
       
       arr = abs(diff(zvals));
       arr2 = abs(diff(z1vals));
       
      subplot(2,2,4)
   %  findpeaks(arr,'MinPeakProminence',0.05)
   % findpeaks(arr2,'MinPeakProminence',0.05)
     plot('YData',arr,'r')
     hold on
     plot('YData',arr2,'b')
     
% figure(h)
% f = fit(zvals,'fourier');
% plot(f)
   



