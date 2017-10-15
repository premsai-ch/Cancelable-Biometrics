%The first three statements are used to generate random matrix R

% This script Generates the bit string for the minutiae and Randomizes it
% to obtain the final fingerprint tenplate
seed=0;
seed=seed+1024;          %stmt 1
rng(seed);               %stmt 2
Mat= randn(2000,2052);   %stmt 3
     
     str='FVC\FVC 2002\DB 1\';
     diag=400;
    for usr=1:100,
        % cut and paste here, stmt 1-3 for different key scenario
        
       for sam=1:2,
           filename=strcat(str,int2str(usr),'_',int2str(sam),'Tempfina.txt');
           if exist(filename,'file')==2,
               A=importdata(filename);
               r=size(A,1);
               Temp=[];
             for templ=1:2:r,
                lo=[A(templ,:);A(templ+1,:)];
                lo=lo';
                if(~isempty(lo))
                       bit_str=proj_trans(lo,diag);
                       Hie=fft(bit_str);
                       T=Mat*Hie;
                       Temp=[Temp;T'];
                end
             end
             
             % opening an empty file and writing the T vector generated in
             % the process for each fingerprint
             
               filename1=strcat(filename(1:end-4),int2str(3),'.txt');
               fid=fopen(filename1,'at+');
                s=size(Temp);
                rows=s(1);
                cols=s(2);
            for i=1:rows,
                for j=1:cols,
                    fprintf(fid,'%d\t',Temp(i,j));
                end
                    fprintf(fid,'\n')
             end
           
                fclose(fid);
           end
           
       end
    end
    
