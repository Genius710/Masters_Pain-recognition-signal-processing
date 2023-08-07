function [DataMatrix] = PainReasignment(DataMatrix)


for iii =1: length(DataMatrix(:,1))

    
    if DataMatrix(iii,1) >=10 && DataMatrix(iii,1) <=49
        DataMatrix(iii,1) = 0;
    elseif DataMatrix(iii,1) >=50 && DataMatrix(iii,1) <=69
        DataMatrix(iii,1) = 1;
    
    elseif DataMatrix(iii,1) >=70
        DataMatrix(iii,1) = 2;
    end

end






end

