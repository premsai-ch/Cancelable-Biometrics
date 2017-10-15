function [ IS ] = Imposter_scores()
% This fucntion calculates the imposter scores for the modified part 2

% If there is a problem with enrollment, the matching score is assigned as
% -2.

% The first impression of each finger print is compared with two
% impressions of all other fingerprints. So the total number of imposter scores is 9900 

file='FVC\FVC 2002\DB 1\';
IS=zeros(1,19800);
n=1;
for i=1:100,
    %for m=1:2,
    file1=strcat(file,int2str(i),'_',int2str(1),'Tempfina3.txt');
    for k=i+1:100,
        for j=1:2,
        file2=strcat(file,int2str(k),'_',int2str(j),'Tempfina3.txt');
            if exist(file1,'file')==2 && exist(file2,'file')==2
            T2=importdata(file2);
            T1=importdata(file1);
            IS(1,n)=matchfun(T1,T2);
            n=n+1;
            else
                IS(1,n)=-2;
                n=n+1;
            end
        %end
        end
    end
end

end

