function [] = Read_files()
%   Reading the files containing the coordinates and orientation of
%   minutiae and create the distance vectors

filename='FVC\FVC 2002\DB 1\';
ukey=0.5000;
for i=1:100,
    for j=1:2,
    filename1=strcat(filename,int2str(i),'_',int2str(j),'.txt');
    if(exist(filename1,'file')==2)
    fid=fopen(filename1);
    %Reading number of minutae from first line
    nm=fscanf(fid,'%d',1);
    M=zeros(nm,3);
    %Reading the X and Y coordinates of the minutiae
    for l=1:nm,
        M(l,1:3)=fscanf(fid,'%d',3);
        temp=fscanf(fid,'%s',1);
    end
    % 'dist' contains the distances from the refernce minutiae to all
    % other minutiae
    
    % 'L' contains the leg distances of all the right angle triangles and the orientations of the respective minutaie
    
    for k=1:nm,
        dist=Create_dist_vect(M,M(k,:));
        L=Finger_shell_dist(dist,filename1);
        
    end
    end
    fclose(fid);
    end
    %end
end
end


