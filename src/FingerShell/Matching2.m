function [score] = Matching2(filename_e,filename_q)
% Matching using the cenetered singular point
score=0;
if exist(filename_e,'file')==2 && exist(filename_q,'file')==2
    filename_temp=strcat(filename_q(1:end-8),'.txt');
    filename_temp1=strcat(filename_e(1:end-8),'.txt');
    
    % Finding the approximate center of the enrolled and query images
    % Getting the co-ordinates corresponding to the centered singular point
    % of both enrolled and query images
    
    n=Nearest_Center_Singularpoint(filename_temp);
    n1=Nearest_Center_Singularpoint(filename_temp1);
    if n==-1 || n1==-1
        % If either the enrolled or the query image does not have any cores
        % or deltas the score is given as -2.
        % After all the scores are generated these scores with -2 are
        % converted to zero.
        score=-2;
    else
     A=importdata(filename_e);
     B=importdata(filename_q);
     P=[A(2*n1-1,:); A(2*n1,:)];
     Q=[B(2*n-1,:);B(2*n,:)];    
     hd=Hausdorff_FS(P,Q);
    end
    if ~(score==-2)
        score=hd;
    end
else
    % For fingerprints that are failed to be enrolled are given score -1
    % After the generation those scores are deleted.
    score=-1;
end
end

