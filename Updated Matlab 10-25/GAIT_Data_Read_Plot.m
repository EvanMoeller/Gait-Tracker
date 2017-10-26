%% Gait Data Calculations
clc
clear all

%% Reading Data 
[asd] = Read_Data_Side('aaron1.csv',144); %sd in structure name means side view
[cst] = Read_Data('ConnorST.csv',364); % st in structure name means static front view
[wsd] = Read_Data_Side('walter1.csv',139);

%% Gait Motion Function
Gait('Julia.csv') % these are the 3D viewing functions for watching motion replay
Gait('ConnorST.csv')

%% Static Data 
[cst] = HipCalc(cst,364,'ConnorST',1); % calculating hip joint distamce and hip angle 

%% Dynamic Angular Features

% Theta Shoulder %
[wsd] = thetaShCalc(wsd,139,'WalterSD',4); % using angle forumalas from research to calculate dynamic features and filters to attenuate noise
[asd] = thetaShCalc(asd,144,'AaronSD',6);

% Theta Elbow %
[wsd] = thetaElCalc(wsd,139,'WalterSD',8); % using angle forumalas from research to calculate dynamic features and filters to attenuate noise
[asd] = thetaElCalc(asd,144,'AaronSD',10);

% Theta Hip %
[wsd] = thetaHpCalc(wsd,139,'WalterSD',12); % using angle forumalas from research to calculate dynamic features and filters to attenuate noise
[asd] = thetaHpCalc(asd,144,'AaronSD',14);

% Theta Knee % 
[wsd] = thetaKnCalc(wsd,139,'WalterSD',16); % using angle forumalas from research to calculate dynamic features and filters to attenuate noise
[asd] = thetaKnCalc(asd,144,'AaronSD',18);