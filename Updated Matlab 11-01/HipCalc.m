function[Subject] = HipCalc(Subject,T,name,num)

% Note that any Filtering has been commented out as filtering is not as useful for static data 

%% Definition of Axes for Graphing
X = 1:T; % for basic graphing vs time

%% Normal Features
Subject.ScaleFactor = (((Subject.KneeLeftX - Subject.FootLeftX).^2) + ((Subject.KneeLeftY - Subject.FootLeftY).^2) + ((Subject.KneeLeftZ - Subject.FootLeftZ).^2)).^0.5;
Subject.ScaleFactor2 = rms(Subject.ScaleFactor) * ones(size(Subject.ScaleFactor));
%% Calculation of HipDistance and Gamma angle
Subject.HipD = (((Subject.HipLeftX - Subject.HipRightX).^2) + ((Subject.HipLeftY - Subject.HipRightY).^2) + ((Subject.HipLeftZ - Subject.HipRightZ).^2)).^0.5; % basic 3D distance formula
Subject.HipD2 = rms(Subject.HipD) * ones(size(Subject.HipD)); % RMS calculation of distance formula as expected constant function is time varying signal

Subject.deltaX = ((Subject.HipLeftX - Subject.SpineBaseX).^2 + (Subject.HipLeftY - Subject.SpineBaseY).^2 + (Subject.HipLeftZ - Subject.SpineBaseZ).^2).^0.5; % x leg of triangle
Subject.deltaY = ((Subject.HipLeftX - Subject.KneeLeftX).^2 + (Subject.HipLeftY - Subject.KneeLeftY).^2 + (Subject.HipLeftZ - Subject.KneeLeftZ).^2).^0.5; % y leg of triangle
Subject.Gamma = atan2(Subject.deltaY,Subject.deltaX); % arctangent calculation
Subject.Gamma2 = rms(Subject.Gamma) * ones(size(Subject.Gamma)); % RMS calculation for same reason as for Hip distance

Subject.NormH = (Subject.HipD2(1))/(Subject.ScaleFactor2(1));
Subject.NormG = (Subject.Gamma2(1))/(Subject.ScaleFactor2(1));
%% Graphing Data
figure(num)


plot(X,Subject.HipD,'m'); % plotting deals with original data, filtered data and RMS
xlabel('Time in Frames');
ylabel('3D distance from Left-Right Hip (meters)');
title(['HipD 3D vs Time ',name]);
axis([0 T .1 .3]);
hold on
plot(X,Subject.HipD2,'b');
%plot(X,Subject.HipDflt,'r');



figure(num+1)


plot(X,Subject.Gamma,'m');
xlabel('Time in Frames');
ylabel('Gamma Angle Hips (radians)');
title(['Gamma vs Time ',name]);
axis([0 T 1 1.5]);
hold on
plot(X,Subject.Gamma2,'b');
%plot(X,Subject.Gammaflt,'r');

end