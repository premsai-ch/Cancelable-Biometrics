function [GS] = Genuine_Scores()
%This function generates the genuine scores of the finger prints
filename='FVC_2002/FVC_2002/DB1_test/';
D=[];
for i=1:100,
    for j=1:8,
        filename1=strcat(filename,int2str(i),'_',int2str(j),'Temp.txt');
        %disp(filename1);
        for k=j+1:8,
            filename2=strcat(filename,int2str(i),'_',int2str(k),'Temp.txt');
            %disp(filename2);
        score=Matching_new(filename1,filename2);
        D=[D score];
        end
    end
end
GS=D;
end

