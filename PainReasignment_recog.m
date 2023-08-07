function [DataMatrix] = PainReasignment_recog(DataMatrix)


for iii =1: length(DataMatrix(:,1))

    
    if  DataMatrix(iii,1) <=9
        DataMatrix(iii,1) = 0;
    elseif DataMatrix(iii,1) >=10 
        DataMatrix(iii,1) = 1;

end






end

