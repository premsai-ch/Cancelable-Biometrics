function []=Read_data()
filename='FVC_2002/FVC_2002/DB2_test/';
ukey=0.5000;
for i=1:100,
    for j=1:8,
    filename1=strcat(filename,int2str(i),'_',int2str(j),'.txt');
    if exist(filename1,'file')==2
    fid=fopen(filename1);
    %Reading number of minutae from first line
    nm=fscanf(fid,'%d',1);
    %Reading the X and Y coordinates of the minutiae
    M=fscanf(fid,'%d %d',[nm 2]);
    % Modified Part
    %{
    %Reading the number of Cores/Deltas
    c=fscanf(fid,'%d',1);
    if ~(c==0)
        C=fscanf(fid,'%d %d',[c 2]);
    end
    d=fscanf(fid,'%d',1);
    if ~(d==0)
        D=fscanf(fid,'%d %d',[d 2]);
    end
    %If the finger print does not contain any core or deltas write 0 in it
    if c+d==0
        T=[0;0];
        Create_Template(T,filename1);
        continue;
    end
    
    if ~(c==0)
    for k=1:c,
        dist=Dist_Vec(M,C(k,:));
        Finger_Shell(dist,ukey,filename1);
    end
    end
    %}
    %if ~(d==0)
    for k=1:nm,
        dist=Dist_Vec(M,M(k,:));
        Finger_Shell(dist,ukey,filename1);
    end
    %end
    fclose(fid);
    end
    end
end
end

        
    
    
    
    
    
    
    
    
    
    