function[Subject] = OmegaBApprox(Subject,T,x)
Subject.dyL = abs(Subject.ShoulderLeftY-Subject.HandTipLeftY);
Subject.dyR = abs(Subject.ShoulderRightY-Subject.HandTipRightY);
Subject.dy = (1/2)*(Subject.dyL + Subject.dyR);
Subject.dzL = abs(Subject.ShoulderLeftZ-Subject.HandTipLeftZ);
Subject.dzR = abs(Subject.ShoulderRightZ-Subject.HandTipRightZ);
Subject.dz = (1/2)*(Subject.dzL + Subject.dzR);
Subject.dtheta = atan2(Subject.dy,Subject.dz);% atan(Subject.dy/Subject.dz);
Subject.deltatheta(x) = 0;
for n = x:1:T-1
    Subject.deltatheta(n+1) = abs(Subject.dtheta(n+1) - Subject.dtheta(n)) + Subject.deltatheta(n);
end
Omega = Subject.deltatheta(T-1)/(T-x);
Subject.OmegaB = 30 * Omega;
display(Subject.OmegaB);
end