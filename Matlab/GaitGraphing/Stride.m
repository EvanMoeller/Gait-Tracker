function[Subject] = Stride(Subject,Name)
Subject.Stridecm = 100*(Subject.KneeRightZ - Subject.KneeLeftZ);
Subject.ApproxStride = abs(Subject.KneeRightZ - Subject.KneeLeftZ);
Subject.MaxApproxStride = max(Subject.ApproxStride);
Subject.MaxApproxStridecm = 100*Subject.MaxApproxStride;
display([Name,' approximate stride is: ',(num2str(Subject.MaxApproxStridecm)),' cm'])
end