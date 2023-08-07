function [Accuracy,TPR ,Precision,Recall,F1] = CM_Sen_Spec_trinary_calc(real,predicted,class)


c= confusionmat(real,predicted);

% TPR =c(class,class)/sum(c(class,:)) 

% Sensitivity = c(1,class)/(sum(c(1,:)));

% Specificity = c(2,2)/(sum(c(2,:));

Accuracy = (c(1,1)+c(2,2)+c(3,3)) / sum(sum(c));
% BA = (Sensitivity+Specificity)/2
Precision = c(class,class)/sum(c(class,:));
Recall = c(class,class)/sum(c(:,class));
TPR = Recall
F1 = 2 * (Precision*TPR)/((Precision+TPR))


end

