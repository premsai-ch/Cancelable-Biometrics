function [ GS] = Genuine_scores()
% This function calculates the genuine scores of the modified part of the
% project

file='\FVC\FVC 2002\DB 1\';
n=1;
GS=zeros(1,100);

%Each fingerprint impression is compared with only one impression of the
%same fingerprint. So total number of genuine scores are 100

%If the there is a problem with fingerprint enrollment,(file does not exist) the matching score
%is assigned as -1

for i=1:100
    for j=1:2
        file1=strcat(file,int2str(i),'_',int2str(j),'Tempfina3.txt');
        
        for k=j+1:2
            file2=strcat(file,int2str(i),'_',int2str(k),'Tempfina3.txt');
            if exist(file1,'file')==2 && exist(file2,'file')==2
            T2=importdata(file2);
            T1=importdata(file1);
            GS(n)=matchfun(T1,T2);
            n=n+1;
            else
                GS(n)=-1;
                n=n+1;
            end
        end
    end
end

end

