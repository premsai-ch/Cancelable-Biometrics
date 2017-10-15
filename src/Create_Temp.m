function [ ] = Create_Temp(T,file)
% Creates the template with distances and orientations in two seperate rows
file=strcat(file(1:end-4),'Tempfina','.txt');
fid=fopen(file,'at+');
s=size(T);
rows=s(1);
cols=s(2);
for i=1:rows,
    for j=2:cols,
        fprintf(fid,'%d\t',T(i,j));
    end
    fprintf(fid,'\n')
end
%disp(str1);
%fprintf(fid,'%f %f',T);
fclose(fid);

end

