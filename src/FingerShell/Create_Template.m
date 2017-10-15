function [ ] = Create_Template(T,file)
%This function creates templates for the generated finger shell
%disp(T);
file=strcat(file(1:end-4),'Temp','.txt');
fid=fopen(file,'at+');
fprintf('%d',fid);
s=size(T);
rows=s(1);
cols=s(2);
for i=1:rows,
    for j=2:cols-1,
        fprintf(fid,'%d\t',T(i,j));
    end
    fprintf(fid,'\n')
end
%disp(str1);
%fprintf(fid,'%f %f',T);
fclose(fid);
end

