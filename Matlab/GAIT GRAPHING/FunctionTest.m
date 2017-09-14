%% Gait Data Calculations
clc
clear all

%% Read Aaron
[a]=Read_Data('Aaron.csv',402);
%% Stride Aaron 
aStride = 12*3.28084*(a.KneeRightZ - a.KneeLeftZ);
aApproxStride = abs(a.KneeRightZ - a.KneeLeftZ);
aMaxApproxStride = max(aApproxStride);
display(['Aaron approximate stride is: ',(num2str(12*3.28084*aMaxApproxStride)),'inches'])