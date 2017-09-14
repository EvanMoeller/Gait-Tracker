function[Subject] = VelApprox(Subject,T,x)
Psum(x) = 0;
for n = x:1:T-1
    Psum(n+1) = abs(Subject.SpineBaseAVGcm(n+1) - Subject.SpineBaseAVGcm(n)) + Psum(n);
end
Subject.V = Psum(T-1)/(T-x);
Subject.Vb = .3 * Subject.V;
display(Subject.Vb);
end
