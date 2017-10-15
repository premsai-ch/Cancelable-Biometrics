function [point_no] = Nearest_Center_Singularpoint(filename)
%This function outputs the singular point that is closest to the center of
%the image
fid=fopen(filename,'r+');
%Reading number of minutae from first line
nm=fscanf(fid,'%d',1);
%Reading the X and Y coordinates of the minutiae
M=fscanf(fid,'%d %d',[nm 2]);
%Reading the number of Cores/Deltas
%approx_center=[(max(M(:,1))-min(M(:,1)))/2 (max(M(:,2))-min(M(:,2)))/2];

%Taking centre of image
approx_center=[388/2,374/2];
c=fscanf(fid,'%d',1);
point_no=0;
cnt=0;
DC=[];
if ~(c==0)
   C=fscanf(fid,'%d %d',[c 2]);
   for i=1:c,
       %C(i,1)=C(i,1)-min(M(:,1));
       %C(i,2)=C(i,2)-min(M(:,2));
       dist=sqrt(sum(bsxfun(@minus,C(i,:),approx_center).^2,2));
       DC=[DC dist];
   end
else
    cnt=-1;
 end
d=fscanf(fid,'%d',1);
if ~(d==0)
   D=fscanf(fid,'%d %d',[d 2]);
   for j=1:d,
       % D(j,1)=D(j,1)-min(M(:,1));
       % D(j,2)=D(j,2)-min(M(:,2));
       dist1=sqrt(sum(bsxfun(@minus,D(j,:),approx_center).^2,2));
       DC=[DC dist1];
   end
else
    if cnt==-1
        point_no=-1;
    end
end
min_d=min(DC);
ind=find(DC==min_d);
if ~(point_no==-1)
point_no=ind;
end
fclose(fid);
end

