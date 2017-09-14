clc
clear all
close all

fileName = 'Aaron.csv';
data = xlsread(fileName);
frames = size(data,1);
endpoint = frames-1;
display(data)
display(frames)
for i=1:1:endpoint
  
      y = [data(i,47),data(i+1,47)];
      y1 = [data(i,59),data(i+1,59)];
      
      plot([i,i+1],y,'r')
      hold on
      plot([i,i+1],y1,'b')
      hold on
     
end