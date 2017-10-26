function[Subject] = HipCalc(Subject,T,name,num)
%% Definition of Axes for Graphing
X = 1:1:T; % for basic graphing vs time
omega = (-512:511)*(pi/512); % for graphing fft transforms for design of filter, this will be the same for every filter

%% Calculation of HipDistance and Gamma angle
Subject.HipD = sqrt((Subject.HipLeftX - Subject.HipRightX).^2 + (Subject.HipLeftY - Subject.HipRightY).^2 + (Subject.HipLeftZ - Subject.HipRightZ).^2); % basic 3D distance formula
Subject.HipD2 = rms(Subject.HipD) * ones(size(Subject.HipD)); % RMS calculation of distance formula as expected constant function is time varying signal

Subject.deltaX = sqrt((Subject.HipLeftX - Subject.SpineBaseX).^2 + (Subject.HipLeftY - Subject.SpineBaseY).^2 + (Subject.HipLeftZ - Subject.SpineBaseZ).^2); % x leg of triangle
Subject.deltaY = sqrt((Subject.HipLeftX - Subject.KneeLeftX).^2 + (Subject.HipLeftY - Subject.KneeLeftY).^2 + (Subject.HipLeftZ - Subject.KneeLeftZ).^2); % y leg of triangle
Subject.Gamma = atan2(Subject.deltaY,Subject.deltaX); % arctangent calculation
Subject.Gamma2 = rms(Subject.Gamma) * ones(size(Subject.Gamma)); % RMS calculation for same reason as for Hip distance

%% Fast Forunier Transform
Subject.transHip = fftshift(fft(Subject.HipD,1024)); % this is a transform of the function used for visual analysis to determine a paramater for q = filter design
figure(num+2)
plot(omega/pi,abs(Subject.transHip),'m')

%% Filter Design
q = fir1(60,0.01,hamming(61)); % filter design uses multiple paramaters please see me or Walter for more information of filter design (second paramater based on analysis of FFT graph


%% Filtering and Graphing Data
figure(num)

Subject.HipDflt = filter(q,1,Subject.HipD); % applying filter designed
plot(X,Subject.HipD,'m'); % plotting deals with original data, filtered data and RMS
xlabel('Time in Frames');
ylabel('3D distance from Left-Right Hip');
title(['HipD 3D vs Time ',name]);
hold on
plot(X,Subject.HipD2,'b');
plot(X,Subject.HipDflt,'r');


figure(num+1)

Subject.Gammaflt = filter(q,1,Subject.Gamma);% IBID but for gamma as opposed to Hip Distance
Subject.Gammaflt2 = rms(Subject.Gammaflt(80:T)) * ones(size(Subject.Gammaflt));

plot(X,Subject.Gamma,'m');
xlabel('Time in Frames');
ylabel('Gamma Angle Hips');
title(['Gamma vs Time ',name]);
hold on
plot(X,Subject.Gamma2,'b');
plot(X,Subject.Gammaflt,'r');
end