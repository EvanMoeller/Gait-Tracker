%% Gait Data Calculations
clc
clear all %#ok<CLALL>

%% Reading Data 
[asd] = Read_Data_Side('aaron1.csv',144); %sd in structure name means side view
[wsd] = Read_Data_Side('walter1.csv',139);
[msd] = Read_Data_Side('max1.csv',95);
[jsd] = Read_Data_Side('jacqueline1.csv',115);
[cst] = Read_Data('ConnorST.csv',364); % st in structure name means static front view
[mst] = Read_Data('MaxST.csv',1103);
[ast] = Read_Data('AaronST.csv',2050);
[jst] = Read_Data('JacquelineST.csv',1384);
[ast2] = Read_Data('AaronST2.csv',910);
[wst] = Read_Data('WalterST.csv',919);
[wst2] = Read_Data('WalterST2.csv',1062);

%% Gait Motion Function
Gait('aaron1.csv') % these are the 3D viewing functions for watching motion replay
Gait('ConnorST.csv')

%% Static Data 

% HipD and Gamma %
[cst] = HipCalc(cst,364,'ConnorST',1); % calculating hip joint distamce and hip angle 
[mst] = HipCalc(mst,1103,'MaxST',4);
[ast] = HipCalc(ast,2050,'AaronST',7);
[ast2] = HipCalc(ast2,910,'AaronST2',45);
[jst] = HipCalc(jst,1384,'JacquelineST',34);
[wst] = HipCalc(wst,919,'AaronST',48);
[wst2] = HipCalc(wst2,1062,'AaronST',51);

%% Dynamic Angular Features

% Theta Shoulder %
[wsd] = thetaShCalc(wsd,139,'WalterSD',10); % using angle forumalas from research to calculate dynamic features and filters to attenuate noise
[asd] = thetaShCalc(asd,144,'AaronSD',12);
[msd] = thetaShCalc(msd,95,'MaxSD',14);
[jsd] = thetaShCalc(jsd,115,'JacquelineSD',37);

% Theta Elbow %
[wsd] = thetaElCalc(wsd,139,'WalterSD',16); % using angle forumalas from research to calculate dynamic features and filters to attenuate noise
[asd] = thetaElCalc(asd,144,'AaronSD',18);
[msd] = thetaElCalc(msd,95,'MaxSD',20);
[jsd] = thetaElCalc(jsd,115,'JacquelineSD',39);

% Theta Hip %
[wsd] = thetaHpCalc(wsd,139,'WalterSD',22); % using angle forumalas from research to calculate dynamic features and filters to attenuate noise
[asd] = thetaHpCalc(asd,144,'AaronSD',24);
[msd] = thetaHpCalc(msd,95,'MaxSD',26);
[jsd] = thetaHpCalc(jsd,115,'JacquelineSD',41);

% Theta Knee % 
[wsd] = thetaKnCalc(wsd,139,'WalterSD',28); % using angle forumalas from research to calculate dynamic features and filters to attenuate noise
[asd] = thetaKnCalc(asd,144,'AaronSD',30);
[msd] = thetaKnCalc(msd,95,'MaxSD',32);
[jsd] = thetaKnCalc(jsd,115,'JacquelineSD',43);

%% KNN / Weka Testing
NormHip = [mst.NormH;ast.NormH;jst.NormH;ast2.NormH;wst.NormH;wst2.NormH];%
NormGamma = [mst.NormG;ast.NormG;jst.NormG;ast2.NormG;wst.NormG;wst2.NormG];
y = [0;0;1;0;0;0];

X = [NormHip NormGamma];
mdl = fitcknn(X,y);
Xnew = [NormHip NormGamma];
label = predict(mdl,Xnew);

%-------------------------------------------------------------------------%

NormHip1 = [mst.NormH;ast.NormH;jst.NormH];%
NormGamma1 = [mst.NormG;ast.NormG;jst.NormG];
y1 = [0;0;1];

X1 = [NormHip1 NormGamma1];
mdl1 = fitcknn(X1,y1);

NormHip1T = [ast2.NormH;wst.NormH;wst2.NormH];
NormGamma1T = [ast2.NormG;wst.NormG;wst2.NormG];
Xnew1 = [NormHip1T NormGamma1T];
ynew1 = [0;0;0];
label1 = predict(mdl1,Xnew1);

% Compare 
Comp = [y,label];
Comp2 = [ynew1,label1];