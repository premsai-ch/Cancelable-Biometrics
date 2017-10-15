function [] = Finger_Shell(dis,ukey,filename)
% This Function creates finger shell representation of a given finger
dis=sort(dis);
dis=dis(2:end);

s=size(dis);
if nargin<3
    ukey=rand(10000,1);
end
dis=[0,dis];
leg=zeros(1,s(2)+1);
t=zeros(1,s(2)+1);
curve_x=zeros(1,s(2)+1);
curve_y=zeros(1,s(2)+1);
for i=1:s(2)+1,
    dis(i)=dis(i)+ukey;
end
for j=1:s(2),
    if (j==1)
        leg(j)=sqrt(dis(j+1)^2-ukey^2);
        x=[0,dis(j),dis(j),0];
        y=[0,0,leg(j),0];
    else
        leg(j)=sqrt(dis(j+1)^2-dis(j)^2);
        t(j)=-atan(leg(j-1)/dis(j-1));
        t(j)=t(j)+t(j-1);
        x=[0,dis(j),dis(j),0];
        y=[0,0,leg(j),0];
        for k=1:4,
            delta=[x(k) y(k)]*[cos(t(j)) -sin(t(j));sin(t(j)) cos(t(j))];
            x(k)=delta(1);
            y(k)=delta(2);
        end
    end
    curve_x(j)=x(3);
    curve_y(j)=y(3);
end
%fprintf('%d %d',curve_x);
FC=[curve_x;curve_y];
%disp(FC);
Create_Template(FC,filename);
end

