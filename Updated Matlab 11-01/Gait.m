function[fileName] = Gait(fileName)

data = xlsread(fileName);
frames = size(data,1);
display(data)
display(frames)
for i=1:1:frames
      x0 = [data(i,1), data(i,4)];   %spinebase to spinemid
      y0 = [data(i,2), data(i,5)];
      z0 = [data(i,3), data(i,6)];
      plot3(x0, y0, z0)
      hold on
      axis equal
      axis off
      view(1,60)
      x1 = [data(i,4), data(i,61)];   %spinemid to spineshoulder
      y1 = [data(i,5), data(i,62)];
      z1 = [data(i,6), data(i,63)];
      plot3(x1, y1, z1)
      hold on
      x15 = [data(i,61), data(i,7)];   %spineshoulder to neck
      y15 = [data(i,62), data(i,8)];
      z15 = [data(i,63), data(i,9)];
      plot3(x15, y15, z15)
      hold on
      x16 = [data(i,1), data(i,4)];   %spinebase to spinemid
      y16 = [data(i,2), data(i,5)];
      z16 = [data(i,3), data(i,6)];
      plot3(x16, y16, z16)
      hold on
      x2 = [data(i,7), data(i,10)];  %neck to head
      y2 = [data(i,8), data(i,11)];
      z2 = [data(i,9), data(i,12)];
      plot3(x2, y2, z2)
      hold on
      x3 = [data(i,61), data(i,13)];  %spineshoulder to shoulder left
      y3 = [data(i,62), data(i,14)];
      z3 = [data(i,63), data(i,15)];
      plot3(x3, y3, z3)
      hold on
      x4 = [data(i,61), data(i,25)];  %spineshoulder to shoulder right
      y4 = [data(i,62), data(i,26)];
      z4 = [data(i,63), data(i,27)];
      plot3(x4, y4, z4)
      hold on
      x5 = [data(i,13), data(i,16)];   %shoulder left to elbow left
      y5 = [data(i,14), data(i,17)];
      z5 = [data(i,15), data(i,18)];
      plot3(x5, y5, z5)
      hold on
      x6 = [data(i,16), data(i,19)];   %elbow left to wrist left
      y6 = [data(i,17), data(i,20)];
      z6 = [data(i,18), data(i,21)];
      plot3(x6, y6, z6)
      hold on
      x7 = [data(i,19), data(i,22)];   %wrist left to hand left
      y7 = [data(i,20), data(i,23)];
      z7 = [data(i,21), data(i,24)];
      plot3(x7, y7, z7)
      hold on
      x8 = [data(i,25), data(i,28)];   %shoulder right to elbow right
      y8 = [data(i,26), data(i,29)];
      z8 = [data(i,27), data(i,30)];
      plot3(x8, y8, z8)
      hold on
      x9 = [data(i,28), data(i,31)];   %elbow right to wrist right
      y9 = [data(i,29), data(i,32)];
      z9 = [data(i,30), data(i,33)];
      plot3(x9, y9, z9)
      hold on
      x10 = [data(i,31), data(i,34)];   %wrist right to hand right
      y10 = [data(i,32), data(i,35)];
      z10 = [data(i,33), data(i,36)];
      plot3(x10, y10, z10)
      hold on
      x11 = [data(i,37), data(i,1)];   %hip left to spinebase
      y11 = [data(i,38), data(i,2)];
      z11 = [data(i,39), data(i,3)];
      plot3(x11, y11, z11)
      hold on
      x12 = [data(i,37), data(i,40)];   %hip left to knee left
      y12 = [data(i,38), data(i,41)];
      z12 = [data(i,39), data(i,42)];
      plot3(x12, y12, z12)
      hold on
      x13 = [data(i,40), data(i,43)];   %knee left to ankle left
      y13 = [data(i,41), data(i,44)];
      z13 = [data(i,42), data(i,45)];
      plot3(x13, y13, z13)
      hold on
      x14 = [data(i,43), data(i,46)];   %ankle left to foot left
      y14 = [data(i,44), data(i,47)];
      z14 = [data(i,45), data(i,48)];
      plot3(x14, y14, z14)
      hold on
      x17 = [data(i,1), data(i,49)];   %spinebase to hip right
      y17 = [data(i,2), data(i,50)];
      z17 = [data(i,3), data(i,51)];
      plot3(x17, y17, z17)
      hold on
      x18 = [data(i,49), data(i,52)];   %hip right to knee right
      y18 = [data(i,50), data(i,53)];
      z18 = [data(i,51), data(i,54)];
      plot3(x18, y18, z18)
      hold on
      x19 = [data(i,52), data(i,55)];   %knee right to ankle right
      y19 = [data(i,53), data(i,56)];
      z19 = [data(i,54), data(i,57)];
      plot3(x19, y19, z19)
      hold on
      x20 = [data(i,55), data(i,58)];   %ankle right to foot right
      y20 = [data(i,56), data(i,59)];
      z20 = [data(i,57), data(i,60)];
      plot3(x20, y20, z20)
      hold on 
      
      for j=1:3:63              %plots nodes
        plot3(data(i,j), data(i,j+1), data(i,j+2),'*')
        hold on
      end
  %    input('Press enter to continue')
      pause(0.01)
      cla

end
end