
function [bit_str] = proj_trans(Dim,diag)

% Dim - (ditance,theta) vector
%Diag - maximum size of all the disttances of all fingerprints in the
%database
L=Dim;
% Defining the matrix size
Wx =diag;
Wy =360;

% using the constants used for FVC2002DB2
Cx =7;
Cy =10;

%finding the number of cells in the final matrix
    M1 = floor(Wx/Cx);
    N1 = floor(Wy/Cy);
   
% defining the final bitstring
      template = zeros(M1,N1);
      bit_str = zeros(M1*N1,1); 
      
% finding the transformed L,theta 
          for i=1:length(L(:,1))
             tL(i)   =  floor(L(i,1)/Cx);
             ttht(i)=  floor(L(i,2)/Cy);
             
            
              if(ttht(i) <= 0)
                ttht(i) = 1;
             end
             if(tL(i) <= 0)
                tL(i) = 1;
             end
             
             if(tL(i) > M1)
                 tL(i) = M1;
             end
             if(ttht(i) > N1)
                 ttht(i) = N1;
             end
             tL(i)
             ttht(i)
             template(tL(i),ttht(i))=1;              
          end
         

          j=1;
     for m = 1:M1
            for n = 1:N1 
                   bit_str(j,1)= template(m,n);
                   j=j+1;                  
            end
     end
     
end

