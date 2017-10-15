function [hd]= Hausdorff_FS(P,Q)
%This function calculates the hausdorff distance for the two sets of features P and Q 
%P contains two rows one row of X and another row of Y coordinates
%Q contains two rows just like P
%hd=max(Haudorff_FS(P,Q),Haudorff_FS(Q,P))
%
P_x=P(1,:);
P_y=P(2,:);
Q_x=Q(1,:);
Q_y=Q(2,:);
temp1=[P_x;P_y];
temp2=[Q_x;Q_y];

%temp3=temp1';
%temp4=temp2';
%hd=ModHausdorffDist(temp3,temp4);

spx=size(P_x);
sqx=size(Q_x);
h1=0;
h2=0;

% h(A,B)
% We are calculating the minimum distance from each point on one spiral to
% all points on another spiral and taking minimum of all those distances.

% Among all the minimum distances the maximum distance is taken as the
% hausdroff distance


for i=1:spx,
    min_dist1=1000000;
    for j=1:sqx,
        dist1=sqrt((P_x(i)-Q_x(j))^2+(P_y(i)-Q_y(j))^2);
        if (dist1<min_dist1)
            min_dist1=dist1;
        end
    end
    if min_dist1>h1
        h1=min_dist1;
    end
end

% In  the previous part we are calculating h(A,B).
% Here we are calculating h(B,A)


for i=1:sqx,
    min_dist2=1000000;
    for j=1:spx,
        dist2=sqrt((Q_x(i)-P_x(j))^2+(Q_y(i)-P_y(j))^2);
        if (dist2<min_dist2)
            min_dist2=dist2;
        end
    end
    if min_dist2>h2
        h2=min_dist2;
    end
end

% Taking maximum of h(A,B) and h(B,A)
% That is the required Hausdroff distance

hd=max(h1,h2);

end

