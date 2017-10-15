% This script generates the ROC curve taking IS as imposter score and GS as
% genuine score.

% By changing thres_n we can change the number of threshold levels

IS=ISf3;
GS=GSf3;
size_I=size(IS,2);
size_G=size(GS,2);
minval=min(IS);
maxval=max(GS);
thres_n=30;
x=(maxval-minval)/thres_n;
point = zeros(30,2);
i=0;
val=minval;
for i=1:30,
s=size(find(IS>=val));
vx=s(2)/size_I;
s1=size(find(GS<val));
vy=s1(2)/size_G;
point(i,1)=vx;
point(i,2)=vy;
val=val+x;
end
loglog(point(:,1),point(:,2));
% For EER Calculation 
% loglog(point(:,1),point(:,2));
% hold on
% Now plot the line 'Y=X', the point where this curve intersects the curve
% is the EER point(x 100)%


