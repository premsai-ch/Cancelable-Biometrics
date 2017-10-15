function [vec] = Create_dist_vect(M,S)
% This fuction is used to create distance and orientation vector

size_M=size(M);
rows_M=size_M(1);
vec=zeros(2,rows_M);
for i=1:rows_M,
    dif=M(i,:)-S;
    vec(1,i)=sqrt(dif(1)^2+dif(2)^2);
    vec(2,i)=M(i,3);
end

end

