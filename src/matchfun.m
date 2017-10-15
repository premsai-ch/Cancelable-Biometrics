function score=matchfun(T,t)
% This function generates the similarity score by comparing one fingerprint
% template with another fingerprint template.

% If the template of a given fingerprint is empty( enrollment rejection),
% the matching score is aasigned as -1

if(size(T,1)>0&& size(t,1)>0 && size(T,2)>0 && size(t,2)>0),
    
l1=length(T(:,1));
l2=length(t(:,1));

res=zeros(l1,l2);
for i=1:l1
    n1(i)=norm(T(i,:));
end
for j=1:l2
    n2(j)=norm(t(j,:));
end
for i=1:l1
    for j=1:l2
        num=norm(T(i,:)-t(j,:));
        qsum(i,j)=1-(num/(n1(i)+n2(j)));
    end
end

for i=1:l1
    for j=1:l2
        if(qsum(i,j)==max(qsum(:,j))) && (qsum(i,j)==max(qsum(i,:)))
            res(i,j)=qsum(i,j);
        else
            res(i,j)=0;
        end
    end
end
score=sum(sum(res))/nnz(res);
else
    score=-1;
end
end