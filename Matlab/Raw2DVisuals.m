clc
clear all
close all

fileName = 'Connor.xls';
data = xlsread(fileName);
frames = size(data,1);
thing = frames-1;
display(data)
display(frames)
for i=1:1:thing

  
      y = [data(i,47),data(i+1,47)];
      y1 = [data(i,59),data(i+1,59)];
      
      plot([i,i+1],y)
      hold on
      plot([i,i+1],y1)
      hold on
     
end
