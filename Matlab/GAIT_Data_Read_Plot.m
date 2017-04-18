%% Gait Data Calculations
clc
clear all

%% Read Excel File Aaron 
fileName = 'test.xls';
Data = xlsread(fileName,'test');
last = size(Data,2);
%for i=1:1:last
    %for j=1:3:75
      %  plot(Data(i,j));
       % plot(Data(i,j+1));
       % plot(Data(i,j+2));
   % end
%end

%% Reading Text File Aaron
afilename = 'Aaron.csv';
Data = dlmread(afilename);
T = 402; % 498
aSpineBaseX = Data(1:1:T,1);
aSpineBaseY = Data(1:1:T,2);
aSpineBaseZ = Data(1:1:T,3);
aSpineMidX = Data(1:1:T,4);
aSpineMidY = Data(1:1:T,5);
aSpineMidZ = Data(1:1:T,6);
aNeckX = Data(1:1:T,7);
aNeckY = Data(1:1:T,8);
aNeckZ = Data(1:1:T,9);
aHeadX = Data(1:1:T,10);
aHeadY = Data(1:1:T,11);
aHeadZ = Data(1:1:T,12);
aShoulderLeftX = Data(1:1:T,13);
aShoulderLeftY = Data(1:1:T,14);
aShoulderLeftZ = Data(1:1:T,15);
aElbowLeftX = Data(1:1:T,16);
aElbowLeftY = Data(1:1:T,17);
aElbowLeftZ = Data(1:1:T,18);
aWristLeftX = Data(1:1:T,19);
aWristLeftY = Data(1:1:T,20);
aWristLeftZ = Data(1:1:T,21);
aHandLeftX = Data(1:1:T,22);
aHandLeftY = Data(1:1:T,23);
aHandLeftZ = Data(1:1:T,24);
aShoulderRightX = Data(1:1:T,25);
aShoulderRightY = Data(1:1:T,26);
aShoulderRightZ = Data(1:1:T,27);
aElbowRightX = Data(1:1:T,28);
aElbowRightY = Data(1:1:T,29);
aElbowRightZ = Data(1:1:T,30);
aWristRightX = Data(1:1:T,31);
aWristRightY = Data(1:1:T,32);
aWristRightZ = Data(1:1:T,33);
aHandRightX = Data(1:1:T,34);
aHandRightY = Data(1:1:T,35);
aHandRightZ = Data(1:1:T,36);
aHipLeftX = Data(1:1:T,37);
aHipLeftY = Data(1:1:T,38);
aHipLeftZ = Data(1:1:T,39);
aKneeLeftX = Data(1:1:T,40);
aKneeLeftY = Data(1:1:T,41);
aKneeLeftZ = Data(1:1:T,42);
aAnkleLeftX = Data(1:1:T,43);
aAnkleLeftY = Data(1:1:T,44);
aAnkleLeftZ = Data(1:1:T,45);
aFootLeftX = Data(1:1:T,46);
aFootLeftY = Data(1:1:T,47);
aFootLeftZ = Data(1:1:T,48);
aHipRightX = Data(1:1:T,49);
aHipRightY = Data(1:1:T,50);
aHipRightZ = Data(1:1:T,51);
aKneeRightX = Data(1:1:T,52);
aKneeRightY = Data(1:1:T,53);
aKneeRightZ = Data(1:1:T,54);
aAnkleRightX = Data(1:1:T,55);
aAnkleRightY = Data(1:1:T,56);
aAnkleRightZ = Data(1:1:T,57);
aFootRightX = Data(1:1:T,58);
aFootRightY = Data(1:1:T,59);
aFootRightZ = Data(1:1:T,60);
aSpineShoulderX = Data(1:1:T,61);
aSpineShoulderY = Data(1:1:T,62);
aSpineShoulderZ = Data(1:1:T,63);
aHandTipLeftX = Data(1:1:T,64);
aHandTipLeftY = Data(1:1:T,65);
aHandTipLeftZ = Data(1:1:T,66);
aThumbLeftX = Data(1:1:T,67);
aThumbLeftY = Data(1:1:T,68);
aThumbLeftZ = Data(1:1:T,69);
aHandTipRightX = Data(1:1:T,70);
aHandTipRightY = Data(1:1:T,71);
aHandTipRightZ = Data(1:1:T,72);
aThumbRightX = Data(1:1:T,73);
aThumbRightY = Data(1:1:T,74);
aThumbRightZ = Data(1:1:T,75);

%% Reading Text File Aaron 2
aafilename = 'Aaron2.csv';
Data = dlmread(aafilename);
T = 402; % 471
aaSpineBaseX = Data(1:1:T,1);
aaSpineBaseY = Data(1:1:T,2);
aaSpineBaseZ = Data(1:1:T,3);
aaSpineMidX = Data(1:1:T,4);
aaSpineMidY = Data(1:1:T,5);
aaSpineMidZ = Data(1:1:T,6);
aaNeckX = Data(1:1:T,7);
aaNeckY = Data(1:1:T,8);
aaNeckZ = Data(1:1:T,9);
aaHeadX = Data(1:1:T,10);
aaHeadY = Data(1:1:T,11);
aaHeadZ = Data(1:1:T,12);
aaShoulderLeftX = Data(1:1:T,13);
aaShoulderLeftY = Data(1:1:T,14);
aaShoulderLeftZ = Data(1:1:T,15);
aaElbowLeftX = Data(1:1:T,16);
aaElbowLeftY = Data(1:1:T,17);
aaElbowLeftZ = Data(1:1:T,18);
aaWristLeftX = Data(1:1:T,19);
aaWristLeftY = Data(1:1:T,20);
aaWristLeftZ = Data(1:1:T,21);
aaHandLeftX = Data(1:1:T,22);
aaHandLeftY = Data(1:1:T,23);
aaHandLeftZ = Data(1:1:T,24);
aaShoulderRightX = Data(1:1:T,25);
aaShoulderRightY = Data(1:1:T,26);
aaShoulderRightZ = Data(1:1:T,27);
aaElbowRightX = Data(1:1:T,28);
aaElbowRightY = Data(1:1:T,29);
aaElbowRightZ = Data(1:1:T,30);
aaWristRightX = Data(1:1:T,31);
aaWristRightY = Data(1:1:T,32);
aaWristRightZ = Data(1:1:T,33);
aaHandRightX = Data(1:1:T,34);
aaHandRightY = Data(1:1:T,35);
aaHandRightZ = Data(1:1:T,36);
aaHipLeftX = Data(1:1:T,37);
aaHipLeftY = Data(1:1:T,38);
aaHipLeftZ = Data(1:1:T,39);
aaKneeLeftX = Data(1:1:T,40);
aaKneeLeftY = Data(1:1:T,41);
aaKneeLeftZ = Data(1:1:T,42);
aaAnkleLeftX = Data(1:1:T,43);
aaAnkleLeftY = Data(1:1:T,44);
aaAnkleLeftZ = Data(1:1:T,45);
aaFootLeftX = Data(1:1:T,46);
aaFootLeftY = Data(1:1:T,47);
aaFootLeftZ = Data(1:1:T,48);
aaHipRightX = Data(1:1:T,49);
aaHipRightY = Data(1:1:T,50);
aaHipRightZ = Data(1:1:T,51);
aaKneeRightX = Data(1:1:T,52);
aaKneeRightY = Data(1:1:T,53);
aaKneeRightZ = Data(1:1:T,54);
aaAnkleRightX = Data(1:1:T,55);
aaAnkleRightY = Data(1:1:T,56);
aaAnkleRightZ = Data(1:1:T,57);
aaFootRightX = Data(1:1:T,58);
aaFootRightY = Data(1:1:T,59);
aaFootRightZ = Data(1:1:T,60);
aaSpineShoulderX = Data(1:1:T,61);
aaSpineShoulderY = Data(1:1:T,62);
aaSpineShoulderZ = Data(1:1:T,63);
aaHandTipLeftX = Data(1:1:T,64);
aaHandTipLeftY = Data(1:1:T,65);
aaHandTipLeftZ = Data(1:1:T,66);
aaThumbLeftX = Data(1:1:T,67);
aaThumbLeftY = Data(1:1:T,68);
aaThumbLeftZ = Data(1:1:T,69);
aaHandTipRightX = Data(1:1:T,70);
aaHandTipRightY = Data(1:1:T,71);
aaHandTipRightZ = Data(1:1:T,72);
aaThumbRightX = Data(1:1:T,73);
aaThumbRightY = Data(1:1:T,74);
aaThumbRightZ = Data(1:1:T,75);

%% Reading Text File Julia
jfilename = 'Julia.csv';
Data = dlmread(jfilename);
T = 402; % 816 (402)
jSpineBaseX = Data(1:1:T,1);
jSpineBaseY = Data(1:1:T,2);
jSpineBaseZ = Data(1:1:T,3);
jSpineMidX = Data(1:1:T,4);
jSpineMidY = Data(1:1:T,5);
jSpineMidZ = Data(1:1:T,6);
jNeckX = Data(1:1:T,7);
jNeckY = Data(1:1:T,8);
jNeckZ = Data(1:1:T,9);
jHeadX = Data(1:1:T,10);
jHeadY = Data(1:1:T,11);
jHeadZ = Data(1:1:T,12);
jShoulderLeftX = Data(1:1:T,13);
jShoulderLeftY = Data(1:1:T,14);
jShoulderLeftZ = Data(1:1:T,15);
jElbowLeftX = Data(1:1:T,16);
jElbowLeftY = Data(1:1:T,17);
jElbowLeftZ = Data(1:1:T,18);
jWristLeftX = Data(1:1:T,19);
jWristLeftY = Data(1:1:T,20);
jWristLeftZ = Data(1:1:T,21);
jHandLeftX = Data(1:1:T,22);
jHandLeftY = Data(1:1:T,23);
jHandLeftZ = Data(1:1:T,24);
jShoulderRightX = Data(1:1:T,25);
jShoulderRightY = Data(1:1:T,26);
jShoulderRightZ = Data(1:1:T,27);
jElbowRightX = Data(1:1:T,28);
jElbowRightY = Data(1:1:T,29);
jElbowRightZ = Data(1:1:T,30);
jWristRightX = Data(1:1:T,31);
jWristRightY = Data(1:1:T,32);
jWristRightZ = Data(1:1:T,33);
jHandRightX = Data(1:1:T,34);
jHandRightY = Data(1:1:T,35);
jHandRightZ = Data(1:1:T,36);
jHipLeftX = Data(1:1:T,37);
jHipLeftY = Data(1:1:T,38);
jHipLeftZ = Data(1:1:T,39);
jKneeLeftX = Data(1:1:T,40);
jKneeLeftY = Data(1:1:T,41);
jKneeLeftZ = Data(1:1:T,42);
jAnkleLeftX = Data(1:1:T,43);
jAnkleLeftY = Data(1:1:T,44);
jAnkleLeftZ = Data(1:1:T,45);
jFootLeftX = Data(1:1:T,46);
jFootLeftY = Data(1:1:T,47);
jFootLeftZ = Data(1:1:T,48);
jHipRightX = Data(1:1:T,49);
jHipRightY = Data(1:1:T,50);
jHipRightZ = Data(1:1:T,51);
jKneeRightX = Data(1:1:T,52);
jKneeRightY = Data(1:1:T,53);
jKneeRightZ = Data(1:1:T,54);
jAnkleRightX = Data(1:1:T,55);
jAnkleRightY = Data(1:1:T,56);
jAnkleRightZ = Data(1:1:T,57);
jFootRightX = Data(1:1:T,58);
jFootRightY = Data(1:1:T,59);
jFootRightZ = Data(1:1:T,60);
jSpineShoulderX = Data(1:1:T,61);
jSpineShoulderY = Data(1:1:T,62);
jSpineShoulderZ = Data(1:1:T,63);
jHandTipLeftX = Data(1:1:T,64);
jHandTipLeftY = Data(1:1:T,65);
jHandTipLeftZ = Data(1:1:T,66);
jThumbLeftX = Data(1:1:T,67);
jThumbLeftY = Data(1:1:T,68);
jThumbLeftZ = Data(1:1:T,69);
jHandTipRightX = Data(1:1:T,70);
jHandTipRightY = Data(1:1:T,71);
jHandTipRightZ = Data(1:1:T,72);
jThumbRightX = Data(1:1:T,73);
jThumbRightY = Data(1:1:T,74);
jThumbRightZ = Data(1:1:T,75);

%% Reading Text File Julia2
jjfilename = 'Julia2.csv';
Data = dlmread(jjfilename);
T = 402; % 449
jjSpineBaseX = Data(1:1:T,1);
jjSpineBaseY = Data(1:1:T,2);
jjSpineBaseZ = Data(1:1:T,3);
jjSpineMidX = Data(1:1:T,4);
jjSpineMidY = Data(1:1:T,5);
jjSpineMidZ = Data(1:1:T,6);
jjNeckX = Data(1:1:T,7);
jjNeckY = Data(1:1:T,8);
jjNeckZ = Data(1:1:T,9);
jjHeadX = Data(1:1:T,10);
jjHeadY = Data(1:1:T,11);
jjHeadZ = Data(1:1:T,12);
jjShoulderLeftX = Data(1:1:T,13);
jjShoulderLeftY = Data(1:1:T,14);
jjShoulderLeftZ = Data(1:1:T,15);
jjElbowLeftX = Data(1:1:T,16);
jjElbowLeftY = Data(1:1:T,17);
jjElbowLeftZ = Data(1:1:T,18);
jjWristLeftX = Data(1:1:T,19);
jjWristLeftY = Data(1:1:T,20);
jjWristLeftZ = Data(1:1:T,21);
jjHandLeftX = Data(1:1:T,22);
jjHandLeftY = Data(1:1:T,23);
jjHandLeftZ = Data(1:1:T,24);
jjShoulderRightX = Data(1:1:T,25);
jjShoulderRightY = Data(1:1:T,26);
jjShoulderRightZ = Data(1:1:T,27);
jjElbowRightX = Data(1:1:T,28);
jjElbowRightY = Data(1:1:T,29);
jjElbowRightZ = Data(1:1:T,30);
jjWristRightX = Data(1:1:T,31);
jjWristRightY = Data(1:1:T,32);
jjWristRightZ = Data(1:1:T,33);
jjHandRightX = Data(1:1:T,34);
jjHandRightY = Data(1:1:T,35);
jjHandRightZ = Data(1:1:T,36);
jjHipLeftX = Data(1:1:T,37);
jjHipLeftY = Data(1:1:T,38);
jjHipLeftZ = Data(1:1:T,39);
jjKneeLeftX = Data(1:1:T,40);
jjKneeLeftY = Data(1:1:T,41);
jjKneeLeftZ = Data(1:1:T,42);
jjAnkleLeftX = Data(1:1:T,43);
jjAnkleLeftY = Data(1:1:T,44);
jjAnkleLeftZ = Data(1:1:T,45);
jjFootLeftX = Data(1:1:T,46);
jjFootLeftY = Data(1:1:T,47);
jjFootLeftZ = Data(1:1:T,48);
jjHipRightX = Data(1:1:T,49);
jjHipRightY = Data(1:1:T,50);
jjHipRightZ = Data(1:1:T,51);
jjKneeRightX = Data(1:1:T,52);
jjKneeRightY = Data(1:1:T,53);
jjKneeRightZ = Data(1:1:T,54);
jjAnkleRightX = Data(1:1:T,55);
jjAnkleRightY = Data(1:1:T,56);
jjAnkleRightZ = Data(1:1:T,57);
jjFootRightX = Data(1:1:T,58);
jjFootRightY = Data(1:1:T,59);
jjFootRightZ = Data(1:1:T,60);
jjSpineShoulderX = Data(1:1:T,61);
jjSpineShoulderY = Data(1:1:T,62);
jjSpineShoulderZ = Data(1:1:T,63);
jjHandTipLeftX = Data(1:1:T,64);
jjHandTipLeftY = Data(1:1:T,65);
jjHandTipLeftZ = Data(1:1:T,66);
jjThumbLeftX = Data(1:1:T,67);
jjThumbLeftY = Data(1:1:T,68);
jjThumbLeftZ = Data(1:1:T,69);
jjHandTipRightX = Data(1:1:T,70);
jjHandTipRightY = Data(1:1:T,71);
jjHandTipRightZ = Data(1:1:T,72);
jjThumbRightX = Data(1:1:T,73);
jjThumbRightY = Data(1:1:T,74);
jjThumbRightZ = Data(1:1:T,75);

%% Reading Text File Evan
efilename = 'Evan.csv';
Data = dlmread(efilename);
T = 402;
eSpineBaseX = Data(1:1:T,1);
eSpineBaseY = Data(1:1:T,2);
eSpineBaseZ = Data(1:1:T,3);
eSpineMidX = Data(1:1:T,4);
eSpineMidY = Data(1:1:T,5);
eSpineMidZ = Data(1:1:T,6);
eNeckX = Data(1:1:T,7);
eNeckY = Data(1:1:T,8);
eNeckZ = Data(1:1:T,9);
eHeadX = Data(1:1:T,10);
eHeadY = Data(1:1:T,11);
eHeadZ = Data(1:1:T,12);
eShoulderLeftX = Data(1:1:T,13);
eShoulderLeftY = Data(1:1:T,14);
eShoulderLeftZ = Data(1:1:T,15);
eElbowLeftX = Data(1:1:T,16);
eElbowLeftY = Data(1:1:T,17);
eElbowLeftZ = Data(1:1:T,18);
eWristLeftX = Data(1:1:T,19);
eWristLeftY = Data(1:1:T,20);
eWristLeftZ = Data(1:1:T,21);
eHandLeftX = Data(1:1:T,22);
eHandLeftY = Data(1:1:T,23);
eHandLeftZ = Data(1:1:T,24);
eShoulderRightX = Data(1:1:T,25);
eShoulderRightY = Data(1:1:T,26);
eShoulderRightZ = Data(1:1:T,27);
eElbowRightX = Data(1:1:T,28);
eElbowRightY = Data(1:1:T,29);
eElbowRightZ = Data(1:1:T,30);
eWristRightX = Data(1:1:T,31);
eWristRightY = Data(1:1:T,32);
eWristRightZ = Data(1:1:T,33);
eHandRightX = Data(1:1:T,34);
eHandRightY = Data(1:1:T,35);
eHandRightZ = Data(1:1:T,36);
eHipLeftX = Data(1:1:T,37);
eHipLeftY = Data(1:1:T,38);
eHipLeftZ = Data(1:1:T,39);
eKneeLeftX = Data(1:1:T,40);
eKneeLeftY = Data(1:1:T,41);
eKneeLeftZ = Data(1:1:T,42);
eAnkleLeftX = Data(1:1:T,43);
eAnkleLeftY = Data(1:1:T,44);
eAnkleLeftZ = Data(1:1:T,45);
eFootLeftX = Data(1:1:T,46);
eFootLeftY = Data(1:1:T,47);
eFootLeftZ = Data(1:1:T,48);
eHipRightX = Data(1:1:T,49);
eHipRightY = Data(1:1:T,50);
eHipRightZ = Data(1:1:T,51);
eKneeRightX = Data(1:1:T,52);
eKneeRightY = Data(1:1:T,53);
eKneeRightZ = Data(1:1:T,54);
eAnkleRightX = Data(1:1:T,55);
eAnkleRightY = Data(1:1:T,56);
eAnkleRightZ = Data(1:1:T,57);
eFootRightX = Data(1:1:T,58);
eFootRightY = Data(1:1:T,59);
eFootRightZ = Data(1:1:T,60);
eSpineShoulderX = Data(1:1:T,61);
eSpineShoulderY = Data(1:1:T,62);
eSpineShoulderZ = Data(1:1:T,63);
eHandTipLeftX = Data(1:1:T,64);
eHandTipLeftY = Data(1:1:T,65);
eHandTipLeftZ = Data(1:1:T,66);
eThumbLeftX = Data(1:1:T,67);
eThumbLeftY = Data(1:1:T,68);
eThumbLeftZ = Data(1:1:T,69);
eHandTipRightX = Data(1:1:T,70);
eHandTipRightY = Data(1:1:T,71);
eHandTipRightZ = Data(1:1:T,72);
eThumbRightX = Data(1:1:T,73);
eThumbRightY = Data(1:1:T,74);
eThumbRightZ = Data(1:1:T,75);

%% Reading Text File Connor
cfilename = 'Connor.csv';
Data = dlmread(cfilename);
T = 402; % 451
cSpineBaseX = Data(1:1:T,1);
cSpineBaseY = Data(1:1:T,2);
cSpineBaseZ = Data(1:1:T,3);
cSpineMidX = Data(1:1:T,4);
cSpineMidY = Data(1:1:T,5);
cSpineMidZ = Data(1:1:T,6);
cNeckX = Data(1:1:T,7);
cNeckY = Data(1:1:T,8);
cNeckZ = Data(1:1:T,9);
cHeadX = Data(1:1:T,10);
cHeadY = Data(1:1:T,11);
cHeadZ = Data(1:1:T,12);
cShoulderLeftX = Data(1:1:T,13);
cShoulderLeftY = Data(1:1:T,14);
cShoulderLeftZ = Data(1:1:T,15);
cElbowLeftX = Data(1:1:T,16);
cElbowLeftY = Data(1:1:T,17);
cElbowLeftZ = Data(1:1:T,18);
cWristLeftX = Data(1:1:T,19);
cWristLeftY = Data(1:1:T,20);
cWristLeftZ = Data(1:1:T,21);
cHandLeftX = Data(1:1:T,22);
cHandLeftY = Data(1:1:T,23);
cHandLeftZ = Data(1:1:T,24);
cShoulderRightX = Data(1:1:T,25);
cShoulderRightY = Data(1:1:T,26);
cShoulderRightZ = Data(1:1:T,27);
cElbowRightX = Data(1:1:T,28);
cElbowRightY = Data(1:1:T,29);
cElbowRightZ = Data(1:1:T,30);
cWristRightX = Data(1:1:T,31);
cWristRightY = Data(1:1:T,32);
cWristRightZ = Data(1:1:T,33);
cHandRightX = Data(1:1:T,34);
cHandRightY = Data(1:1:T,35);
cHandRightZ = Data(1:1:T,36);
cHipLeftX = Data(1:1:T,37);
cHipLeftY = Data(1:1:T,38);
cHipLeftZ = Data(1:1:T,39);
cKneeLeftX = Data(1:1:T,40);
cKneeLeftY = Data(1:1:T,41);
cKneeLeftZ = Data(1:1:T,42);
cAnkleLeftX = Data(1:1:T,43);
cAnkleLeftY = Data(1:1:T,44);
cAnkleLeftZ = Data(1:1:T,45);
cFootLeftX = Data(1:1:T,46);
cFootLeftY = Data(1:1:T,47);
cFootLeftZ = Data(1:1:T,48);
cHipRightX = Data(1:1:T,49);
cHipRightY = Data(1:1:T,50);
cHipRightZ = Data(1:1:T,51);
cKneeRightX = Data(1:1:T,52);
cKneeRightY = Data(1:1:T,53);
cKneeRightZ = Data(1:1:T,54);
cAnkleRightX = Data(1:1:T,55);
cAnkleRightY = Data(1:1:T,56);
cAnkleRightZ = Data(1:1:T,57);
cFootRightX = Data(1:1:T,58);
cFootRightY = Data(1:1:T,59);
cFootRightZ = Data(1:1:T,60);
cSpineShoulderX = Data(1:1:T,61);
cSpineShoulderY = Data(1:1:T,62);
cSpineShoulderZ = Data(1:1:T,63);
cHandTipLeftX = Data(1:1:T,64);
cHandTipLeftY = Data(1:1:T,65);
cHandTipLeftZ = Data(1:1:T,66);
cThumbLeftX = Data(1:1:T,67);
cThumbLeftY = Data(1:1:T,68);
cThumbLeftZ = Data(1:1:T,69);
cHandTipRightX = Data(1:1:T,70);
cHandTipRightY = Data(1:1:T,71);
cHandTipRightZ = Data(1:1:T,72);
cThumbRightX = Data(1:1:T,73);
cThumbRightY = Data(1:1:T,74);
cThumbRightZ = Data(1:1:T,75);

%% Reading Text File Connor
ccfilename = 'Connor2.csv';
Data = dlmread(ccfilename);
T = 402; % 524
ccSpineBaseX = Data(1:1:T,1);
ccSpineBaseY = Data(1:1:T,2);
ccSpineBaseZ = Data(1:1:T,3);
ccSpineMidX = Data(1:1:T,4);
ccSpineMidY = Data(1:1:T,5);
ccSpineMidZ = Data(1:1:T,6);
ccNeckX = Data(1:1:T,7);
ccNeckY = Data(1:1:T,8);
ccNeckZ = Data(1:1:T,9);
ccHeadX = Data(1:1:T,10);
ccHeadY = Data(1:1:T,11);
ccHeadZ = Data(1:1:T,12);
ccShoulderLeftX = Data(1:1:T,13);
ccShoulderLeftY = Data(1:1:T,14);
ccShoulderLeftZ = Data(1:1:T,15);
ccElbowLeftX = Data(1:1:T,16);
ccElbowLeftY = Data(1:1:T,17);
ccElbowLeftZ = Data(1:1:T,18);
ccWristLeftX = Data(1:1:T,19);
ccWristLeftY = Data(1:1:T,20);
ccWristLeftZ = Data(1:1:T,21);
ccHandLeftX = Data(1:1:T,22);
ccHandLeftY = Data(1:1:T,23);
ccHandLeftZ = Data(1:1:T,24);
ccShoulderRightX = Data(1:1:T,25);
ccShoulderRightY = Data(1:1:T,26);
ccShoulderRightZ = Data(1:1:T,27);
ccElbowRightX = Data(1:1:T,28);
ccElbowRightY = Data(1:1:T,29);
ccElbowRightZ = Data(1:1:T,30);
ccWristRightX = Data(1:1:T,31);
ccWristRightY = Data(1:1:T,32);
ccWristRightZ = Data(1:1:T,33);
ccHandRightX = Data(1:1:T,34);
ccHandRightY = Data(1:1:T,35);
ccHandRightZ = Data(1:1:T,36);
ccHipLeftX = Data(1:1:T,37);
ccHipLeftY = Data(1:1:T,38);
ccHipLeftZ = Data(1:1:T,39);
ccKneeLeftX = Data(1:1:T,40);
ccKneeLeftY = Data(1:1:T,41);
ccKneeLeftZ = Data(1:1:T,42);
ccAnkleLeftX = Data(1:1:T,43);
ccAnkleLeftY = Data(1:1:T,44);
ccAnkleLeftZ = Data(1:1:T,45);
ccFootLeftX = Data(1:1:T,46);
ccFootLeftY = Data(1:1:T,47);
ccFootLeftZ = Data(1:1:T,48);
ccHipRightX = Data(1:1:T,49);
ccHipRightY = Data(1:1:T,50);
ccHipRightZ = Data(1:1:T,51);
ccKneeRightX = Data(1:1:T,52);
ccKneeRightY = Data(1:1:T,53);
ccKneeRightZ = Data(1:1:T,54);
ccAnkleRightX = Data(1:1:T,55);
ccAnkleRightY = Data(1:1:T,56);
ccAnkleRightZ = Data(1:1:T,57);
ccFootRightX = Data(1:1:T,58);
ccFootRightY = Data(1:1:T,59);
ccFootRightZ = Data(1:1:T,60);
ccSpineShoulderX = Data(1:1:T,61);
ccSpineShoulderY = Data(1:1:T,62);
ccSpineShoulderZ = Data(1:1:T,63);
ccHandTipLeftX = Data(1:1:T,64);
ccHandTipLeftY = Data(1:1:T,65);
ccHandTipLeftZ = Data(1:1:T,66);
ccThumbLeftX = Data(1:1:T,67);
ccThumbLeftY = Data(1:1:T,68);
ccThumbLeftZ = Data(1:1:T,69);
ccHandTipRightX = Data(1:1:T,70);
ccHandTipRightY = Data(1:1:T,71);
ccHandTipRightZ = Data(1:1:T,72);
ccThumbRightX = Data(1:1:T,73);
ccThumbRightY = Data(1:1:T,74);
ccThumbRightZ = Data(1:1:T,75);

%% Stride Aaron 
aStride = 12*3.28084*(aKneeRightZ - aKneeLeftZ);
aApproxStride = abs(aKneeRightZ - aKneeLeftZ);
aMaxApproxStride = max(aApproxStride);
display(['Aaron approximate stride is: ',(num2str(12*3.28084*aMaxApproxStride)),'inches'])

%% Stride Aaron 2
aaStride = 12*3.28084*(aaKneeRightZ - aaKneeLeftZ);
aaApproxStride = abs(aaKneeRightZ - aaKneeLeftZ);
aaMaxApproxStride = max(aaApproxStride);
display(['Aaron2 approximate stride is: ',(num2str(12*3.28084*aaMaxApproxStride)),'inches'])

%% Stride Julia
jStride = 12*3.28084*(jKneeRightZ - jKneeLeftZ);
jApproxStride = abs(jKneeRightZ - jKneeLeftZ);
jMaxApproxStride = max(jApproxStride);
display(['Julia approximate stride is: ',(num2str(12*3.28084*jMaxApproxStride)),'inches'])

%% Stride Julia 2
jjStride = 12*3.28084*(jjKneeRightZ - jjKneeLeftZ);
jjApproxStride = abs(jjKneeRightZ - jjKneeLeftZ);
jjMaxApproxStride = max(jjApproxStride);
display(['Julia2 approximate stride is: ',(num2str(12*3.28084*jjMaxApproxStride)),'inches'])

%% Stride Evan
eStride = 12*3.28084*(eKneeRightZ - eKneeLeftZ);
eApproxStride = abs(eKneeRightZ - eKneeLeftZ);
eMaxApproxStride = max(eApproxStride);
display(['Evan approximate stride is: ',(num2str(12*3.28084*eMaxApproxStride)),'inches'])

%% Connor Stride
cStride = 12*3.28084*(cKneeRightZ - cKneeLeftZ);
cApproxStride = abs(cKneeRightZ - cKneeLeftZ);
cMaxApproxStride = max(cApproxStride);
display(['Connor approximate stride is: ',(num2str(12*3.28084*cMaxApproxStride)),'inches'])

%% Connor Stride 2
ccStride = 12*3.28084*(ccKneeRightZ - ccKneeLeftZ);
ccApproxStride = abs(ccKneeRightZ - ccKneeLeftZ);
ccMaxApproxStride = max(ccApproxStride);
display(['Connor2 approximate stride is: ',(num2str(12*3.28084*ccMaxApproxStride)),'inches'])

%% Graph Stride
X1 = 1:1:402;
figure(1);

subplot(2,1,1);
plot(X1,aStride,'k');
xlabel('Time in Frames');
ylabel('Distance Between knee joints in Inches');
title('Stride vs Time');
hold on

subplot(2,1,1);
plot(X1,jStride,'r');
xlabel('Time in Frames');
ylabel('Distance Between knee joints in Inches');
title('Stride vs Time');
hold on

%subplot(2,1,1);
%plot(X1,eStride,'g');
%xlabel('Time in Frames');
%ylabel('Distance Between knee joints in Inches');
%title('Stride vs Time');
%hold on

subplot(2,1,1);
plot(X1,cStride,'b');
xlabel('Time in Frames');
ylabel('Distance Between knee joints in Inches');
title('Stride vs Time');
hold on

%% Graph Stride 2
subplot(2,1,2);
plot(X1,aaStride,'k');
xlabel('Time in Frames');
ylabel('Distance Between knee joints in Inches');
title('Stride vs Time');
hold on

subplot(2,1,2);
plot(X1,jjStride,'r');
xlabel('Time in Frames');
ylabel('Distance Between knee joints in Inches');
title('Stride vs Time');
hold on

subplot(2,1,2);
plot(X1,ccStride,'b');
xlabel('Time in Frames');
ylabel('Distance Between knee joints in Inches');
title('Stride vs Time');
hold on

%% Test Julia Stride
%figure(2)
%subplot(2,1,1)
%X2 = 1:1:816;
%plot(X2,jStride,'r');
%xlabel('Time in Frames');
%ylabel('Distance Between knee joints in Inches');
%title('Stride vs Time');
%hold on