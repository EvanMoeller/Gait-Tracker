%% Gait Data Calculations
clc
clear all %#ok<CLALL>

%% Reading Data 
[asd] = Read_Data_Side('aaron1.csv',144); %sd in structure name means side view
[wsd] = Read_Data_Side('walter1.csv',139);
[msd] = Read_Data_Side('max1.csv',95);
[cst] = Read_Data('ConnorST.csv',364); % st in structure name means static front view
[mst] = Read_Data('MaxST.csv',1103);
%% Gait Motion Function
Gait('Julia.csv') % these are the 3D viewing functions for watching motion replay
Gait('ConnorST.csv')

%% Static Data 
[cst] = HipCalc(cst,364,'ConnorST',1); % calculating hip joint distamce and hip angle 
[mst] = HipCalc(mst,1103,'MaxST',4);
%% Dynamic Angular Features

% Theta Shoulder %
[wsd] = thetaShCalc(wsd,139,'WalterSD',6); % using angle forumalas from research to calculate dynamic features and filters to attenuate noise
[asd] = thetaShCalc(asd,144,'AaronSD',8);
[msd] = thetaShCalc(msd,95,'MaxSD',10);

% Theta Elbow %
[wsd] = thetaElCalc(wsd,139,'WalterSD',12); % using angle forumalas from research to calculate dynamic features and filters to attenuate noise
[asd] = thetaElCalc(asd,144,'AaronSD',14);
[msd] = thetaElCalc(msd,95,'MaxSD',16);

% Theta Hip %
[wsd] = thetaHpCalc(wsd,139,'WalterSD',18); % using angle forumalas from research to calculate dynamic features and filters to attenuate noise
[asd] = thetaHpCalc(asd,144,'AaronSD',20);
[msd] = thetaHpCalc(msd,95,'MaxSD',22);

% Theta Knee % 
[wsd] = thetaKnCalc(wsd,139,'WalterSD',24); % using angle forumalas from research to calculate dynamic features and filters to attenuate noise
[asd] = thetaKnCalc(asd,144,'AaronSD',26);
[msd] = thetaKnCalc(msd,95,'MaxSD',28);