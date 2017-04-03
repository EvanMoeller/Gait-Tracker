clc

fileName = 'test.xls';
data = xlsread(fileName);
frames = size(data,2);
display(data)
display(frames)
for i=1:1:frames
    for j=1:3:76
      plot3(frames(i,j), frames(i,j+1), frames(i,j+2))
    end
    input('Press enter to continue')
end