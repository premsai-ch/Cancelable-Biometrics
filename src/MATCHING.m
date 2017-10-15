
%% GENUINE SCORES
file='FVC\FVC 2002\DB 1\';
n=1;
for i=1:100
    for j=1:8
        file1=strcat(file,int2str(i),'_',int2str(j),'Temp1.txt');
        T1=importdata(file1);
        for k=j+1:8
            file2=strcat(file,int2str(i),'_',int2str(k),'Temp1.txt');
            T2=importdata(file2);
            FRR(n)=matchfun(T1,T2);
           fprintf('%d\n',n); 
          n=n+1;
           
        end
    end
end
n

%% imposter scores
m=1;
for i=1:100
        for ii=i+1:100
            for k=1:2
              FAR(m)=matchfun(OUT(i,1).f,OUT(ii,k).f);
              m=m+1;
                fprintf('%d\n',m);
            end
        end
end
