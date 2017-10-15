function [score1] = Matching(filename_e,filename_q)
% Generating score for a query with the enrolled template
% Matching two templates using Hausdroff distance
score=[];
if exist(filename_e,'file')==2 && exist(filename_q,'file')==2
    filename_temp=strcat(filename_q(1:end-8),'.txt');
    filename_temp1=strcat(filename_e(1:end-8),'.txt');
    n=Nearest_Center_Singularpoint(filename_temp);
    n1=Nearest_Center_Singularpoint(filename_temp1);
    A=importdata(filename_e);
    B=importdata(filename_q);
    %disp(A);
    %disp(B);
    %disp(filename_temp(end-7:end-4));
    %disp(n);
    sa=size(A);
    sb=size(B);
    %disp(sa);
    %disp(sb);
    if sa(2)>=2 && sb(2)>=2
       for i=1:2:sa(1),
           for j=1:2:sb(1),
    P=[A(i,:); A(i+1,:)];
    Q=[B(j,:);B(j+1,:)];    
    hd=Hausdorff_FS(P,Q);
    score= [score hd];
           end
       end
    else
        score =[score -2];
    end
else
    score=[score -1];
end
score1=min(score);
end

