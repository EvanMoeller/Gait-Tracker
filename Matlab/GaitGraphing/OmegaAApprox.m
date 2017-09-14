function[Subject] = OmegaAApprox(Subject,T,x)
Subject.dyL = abs(Subject.ShoulderLeftY-Subject.HandTipLeftY);
Subject.dyR = abs(Subject.ShoulderRightY-Subject.HandTipRightY);
Subject.dy = (1/2)*(Subject.dyL + Subject.dyR);
Subject.dzL = abs(Subject.ShoulderLeftZ-Subject.HandTipLeftZ);
Subject.dzR = abs(Subject.ShoulderRightZ-Subject.HandTipRightZ);
Subject.dz = (1/2)*(Subject.dzL + Subject.dzR);
Subject.dl = sqrt((Subject.dy.^2)+(Subject.dz.^2));
Psum(x) = Subject.dl(x);
for n = x:1:T-1
    Psum(n+1) = abs(Subject.dl(n+1) + Subject.dl(n)) + Psum(n);
end
Subject.AVGl = Psum(T-1)/(T-x);
Subject.OmegaA = Subject.Vb/Subject.AVGl;
display(Subject.OmegaA);
end