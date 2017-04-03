clc
clear all
fileName = 'test.xls';
Data = xlsread(fileName,'test');
last = size(Data,2);
for i=1:1:last
    for j=1:3:75
        plot(Data(i,j));
        plot(Data(i,j+1));
        plot(Data(i,j+2));
    end
end
