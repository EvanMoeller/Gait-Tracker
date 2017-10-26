function[Subject] = thetaShCalc(Subject,T,name,num)
%% Definition of Axes for Graphing
X=1:T; % for basic graphing vs time
omega = (-512:511)*(pi/512); % for graphing fft transforms for design of filter, this will be the same for every filter

%% Calculation of theta for Shoulder
Subject.dxSh=Subject.ShoulderLeftX-Subject.ElbowLeftX; % calculate y and x leg of triangle then use arctan
Subject.dySh=Subject.ShoulderLeftY-Subject.ElbowLeftY;
Subject.thetaSh=atan2(Subject.dxSh,Subject.dySh);

%% Fast Fournier Transform
Subject.transSh = fftshift(fft(Subject.thetaSh,1024)); % this is a transform of the function used for visual analysis to determine a paramater for q = filter design
figure(num+1)
plot(omega/pi,abs(Subject.transSh),'b')
%% Filter Design
q = fir1(15,.2,hamming(16));% filter design uses multiple paramaters please see me or Walter for more information of filter design (second paramater based on analysis of FFT graph

%% Filtering Data and Graphing
Subject.thetaShflt  = filter(q,1,Subject.thetaSh); % applying filter designed
figure(num) % Graphing Filter Data, original data and RMS
plot(X,Subject.thetaSh,'r')
xlabel('Time in Frames');
ylabel('thetaSh');
title(['thetaSh vs Time ',name]);
hold on 
plot(X,Subject.thetaShflt,'b');
end