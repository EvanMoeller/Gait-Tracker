function[Subject] = thetaElCalc(Subject,T,name,num)
%% Definition of Axes for Graphing
X=1:T; % for basic graphing vs time
omega = (-512:511)*(pi/512); % for graphing fft transforms for design of filter, this will be the same for every filter

%% Calculation of theta for Shoulder
Subject.dxEl=Subject.ElbowLeftX - Subject.WristLeftX; % calculate y and x leg of triangle then use arctan
Subject.dyEl=Subject.ElbowLeftY-Subject.WristLeftY;
Subject.thetaEl=atan2(Subject.dxEl,Subject.dyEl);

%% Fast Fournier Transform
Subject.transEl = fftshift(fft(Subject.thetaEl,1024)); % this is a transform of the function used for visual analysis to determine a paramater for q = filter design
figure(num+1)
plot(omega/pi,abs(Subject.transEl),'b')
%% Filter Design LowPass
q = fir1(15,.15,hamming(16));% filter design uses multiple paramaters please see me or Walter for more information of filter design (second paramater based on analysis of FFT graph)

%% Filter Design LowPass 2 Alternate Method of Low Pass Filter Design fir1 appears to better 
rp = 1;
rs = 60;
f_spec = [4.5 7];
dev = [(10^(rp/20)-1) / (10^(rp/20)+1) 10^(-rs/20)];
[N,fo,ao,w] = firpmord(f_spec,[1 0],dev,30);
b = firpm(N,fo,ao,w);
[H,ff] = freqz(b,1,1024,30);
% figure;
% stem(0:N,b);
% figure;
% subplot(2,1,1)
% plot(ff,20*log10(abs(H)))
% subplot(2,1,2)
% plot(ff,unwrap(angle(H)))

%% Filtering Data and Graphing
Subject.thetaElflt  = filter(q,1,Subject.thetaEl); % applying filter designed
figure(num) % Graphing Filter Data, original data and RMS
plot(X,Subject.thetaEl,'r')
xlabel('Time in Frames');
ylabel('thetaEl (radians)');
title(['thetaEl vs Time ',name]);
hold on 
plot(X,Subject.thetaElflt,'b');
end