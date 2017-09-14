%% Gait Data Calculations
clc
clear all

%% Reading Text File Aaron
[a]=Read_Data('Aaron.csv',402);

%% Reading Text File Aaron 2
[aa]=Read_Data('Aaron2.csv',402);

%% Reading Text File Julia
[j]=Read_Data('Julia.csv',402);

%% Reading Text File Julia2
[jj]=Read_Data('Julia2.csv',402);

%% Reading Text File Evan
[e]=Read_Data('Evan.csv',402);

%% Reading Text File Connor
[c]=Read_Data('Connor.csv',402);

%% Reading Text File Connor 2
[cc]=Read_Data('Connor2.csv',402);

%% Stride Aaron 
[a]=Stride(a,'Aaron');% note stride outputs in cm

%% Stride Aaron 2
[aa]=Stride(aa,'Aaron2');

%% Stride Julia
[j]=Stride(j,'Julia');

%% Stride Julia 2
[jj]=Stride(jj,'Julia2');

%% Stride Evan
[e]=Stride(e,'Evan');

%% Connor Stride
[c]=Stride(c,'Connor');

%% Connor Stride 2
[cc]=Stride(cc,'Connor2');

%% Graph Stride
[a,j,e,c] = Graph_Stride(a,j,e,c,'Aaron','Julia','Evan','Connor',1);

%% Graph Stride 2
[aa,jj,e,cc] = Graph_Stride(aa,jj,e,cc,'Aaron2','Julia2','Evan','Connor2',2);

%% Test Ankle Distance from Camera (Z) Aaron 1 Connor 1, Evan 1 and Julia 2
[a,c,e,jj] = Graph_Ankle(a,c,e,jj,'Aaron','Connor','Evan','Julia2',3); % note outputs in cm

%% FALL SEMESTER 2017 %%
%% Test For Speed Calculations
[a] = SpineAVG(a,'Aaron',7); % note output matrix has units cm for all elements
[c] = SpineAVG(c,'Connor',8);
[e] = SpineAVG(e,'Evan',9);
[jj] = SpineAVG(jj,'Julia2',10);
[cc] = SpineAVG(cc,'Connor2',11);
[aa] = SpineAVG(aa,'Aaron2',12);

% Eyeball method of calculating velcoity (process varies per indivdual in
% all numbers (since replaced by VelApprox function)

% slope1 = (1/105)*abs(a.SpineBaseAVGcm(50) - a.SpineBaseAVGcm(155))
% slope2 = (1/115)*abs(a.SpineBaseAVGcm(155)-a.SpineBaseAVGcm(270))
% slope3 = (1/105)*abs(a.SpineBaseAVGcm(270)-a.SpineBaseAVGcm(375))
% Va = (1/3)*(slope1 + slope2 + slope3)

[a] = VelApprox(a,402,50); % note function outputs in meters per second ** must have SpineAVG ran for same person before running **
[c] = VelApprox(c,402,25);
[jj] = VelApprox(jj,402,40);
[cc] = VelApprox(cc,402,15);
[aa] = VelApprox(aa,402,40);
%% Test For Angular Speed Calculations
[a] = OmegaBApprox(a,402,50);
[a] = OmegaAApprox(a,402,50);

[c] = OmegaBApprox(c,402,25);
[c] = OmegaAApprox(c,402,25);

[jj] = OmegaBApprox(jj,402,40);
[jj] = OmegaAApprox(jj,402,40);

[cc] = OmegaBApprox(cc,402,15);
[cc] = OmegaAApprox(cc,402,15);

[aa] = OmegaBApprox(aa,402,40);
[aa] = OmegaAApprox(aa,402,40);

%% Test For Useful Frames
[e] = HeelToe(e,'Evan',8); % found to be unreliable in current form

%% Gait Motion Function
Gait('Aaron.csv')
Gait('Connor.csv')


