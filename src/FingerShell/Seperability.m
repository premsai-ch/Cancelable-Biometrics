function [val ] = Seperability(GS,IS)
%This function calculates the seperability of the genuine and inposter
%scores
m1=mean(GS);
m2=mean(IS);
v1=var(GS);
v2=var(IS);
val=abs(m1-m2)/sqrt((v1+v2)/2);
end

