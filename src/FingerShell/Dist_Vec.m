function [vec] = Dist_Vec(M,S)
%This function creates dist vector for the minutiae from the cores/deltas
size_M=size(M);
rows_M=size_M(1);
vec=zeros(1,rows_M);
for i=1:rows_M,
    dif=M(i,:)-S;
    vec(i)=sqrt(dif(1)^2+dif(2)^2);
end
end

