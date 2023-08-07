function [Sensitivity,Specificity,Accuracy,BA, Precision,F1] = CM_Sen_Spec_binary_calc(real,predicted)


c= confusionmat(real,predicted)


TP = c(1,1)
FP = c(1,2)
FN = c(2,1)
TN = c(2,2)

Sensitivity = c(1,1)/(c(1,1)+c(2,1))
Specificity = c(2,2)/(c(1,2)+c(2,2))

Accuracy = (c(1,1)+c(2,2)) / (sum(sum(c)))
BA = (Sensitivity+Specificity)/2
Precision = c(1,1)/(c(1,1)+c(1,2))

F1 = 2 * (Precision*Sensitivity)/((Precision+Sensitivity))


end

