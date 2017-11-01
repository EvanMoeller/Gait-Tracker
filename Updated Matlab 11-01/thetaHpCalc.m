function[Subject] = thetaHpCalc(Subject,T,name,num)
%% Definition of Axes for Graphing
X=1:T; % for basic graphing vs time
omega = (-512:511)*(pi/512); % for graphing fft transforms for design of filter, this will be the same for every filter

%% Calculation of theta for Shoulder
Subject.dxHp=Subject.HipLeftX-Subject.KneeLeftX; % calculate y and x leg of triangle then use arctan
Subject.dyHp=Subject.HipLeftY-Subject.KneeLeftY;
Subject.thetaHp=atan2(Subject.dxHp,Subject.dyHp);

%% Fast Fournier Transform
Subject.transHp = fftshift(fft(Subject.thetaHp,1024)); % this is a transform of the function used for visual analysis to determine a paramater for q = filter design
figure(num+1)
plot(omega/pi,abs(Subject.transHp),'b')
%% Filter Design
q = fir1(30,.2,rectwin(31));% filter design uses multiple paramaters please see me or Walter for more information of filter design (second paramater based on analysis of FFT graph

%% Filtering Data and Graphing
Subject.thetaHpflt  = filter(q,1,Subject.thetaHp); % applying filter designed
figure(num) % Graphing Filter Data, original data and RMS
plot(X,Subject.thetaHp,'r')
xlabel('Time in Frames');
ylabel('thetaHp (radians)');
title(['thetaHp vs Time ',name]);
hold on 
plot(X,Subject.thetaHpflt,'b');
end