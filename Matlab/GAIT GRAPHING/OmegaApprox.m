function[Subject] = OmegaApprox(Subject,T,x)
Subject.dyL = abs(Subject.ShoulderLeftY-Subject.HandTipLeftY);
Subject.dyR = abs(Subject.ShoulderRightY-Subject.HandTipRightY);
Subject.dy = (1/2)*(Subject.dyL + Subject.dyR);
Subject.dzL = abs(Subject.ShoulderLeftZ-Subject.HandTipLeftZ);
Subject.dzR = abs(Subject.ShoulderRightZ-Subject.HandTipRightZ);
Subject.dz = (1/2)*(Subject.dzL + Subject.dzR);
Subject.

