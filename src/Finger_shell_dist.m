function [L] = Finger_shell_dist(dis,filename)
%   This function calculates the length of the distances of the spirals.

% The commented out code is used to generate fingerprint shells as in
% "Fingerprint shell: Secure Representation of fingerprint template" paper.

temp=dis;
[S I]=sort(temp(1,:));
temp2=temp(:,I);
D=temp2(1,:);
T=temp2(2,:);
D=D(2:end);
T=T(2:end);
dis=[D;T];

%dis=[dis];
s=size(dis);
leg=zeros(1,s(2)-2);
t=zeros(1,s(2)-2);
%curve_x=zeros(1,s(2)+1);
%curve_y=zeros(1,s(2)+1);

%change made here
%{
if(s(2)>=16)
  k=16;
  if(k>s(2)-1)
      k=s(2)-1;
  end
%}
for j=1:s(2)-1,%k
    %if (j==1)
        leg(j)=sqrt(dis(1,j+1)^2-dis(1,j)^2);
        t(j)=dis(2,j);
       %{ 
        if(dis(2,j)>ref_t)
            t(j)=dis(2,j)-ref_t;
        else
            t(j)=dis(2,j)-ref_t+360;
        end
        %}
        %x=[0,dis(j),dis(j),0];
        %y=[0,0,leg(j),0];
    %else
     %   leg(j)=sqrt(dis(j+1)^2-dis(j)^2);
        %{
        t(j)=-atan(leg(j-1)/dis(j-1));
        t(j)=t(j)+t(j-1);
        x=[0,dis(j),dis(j),0];
        y=[0,0,leg(j),0];
        for k=1:4,
            delta=[x(k) y(k)]*[cos(t(j)) -sin(t(j));sin(t(j)) cos(t(j))];
            x(k)=delta(1);
            y(k)=delta(2);
        end
        %}
    %end
    %curve_x(j)=x(3);
    %curve_y(j)=y(3);
end
    L=[leg;t];
    Create_Temp(L,filename);
%{
else
    L=[0;0];
    Create_Temp(L,filename);
end
    %}
end

