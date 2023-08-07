% function [] = BoxplotMultiplot_median_export_data_manipulation(First)


% DataVecYM = [DataVecYM0,DataVecYM1,DataVecYM20,DataVecYM50];
% GRPYM = [GRPYM0,GRPYM1,GRPYM20,GRPYM50];
% % figure
% % boxplot(DataVecYM,GRPYM)
% %jauni
% DataVecOM = [DataVecOM0,DataVecOM1,DataVecOM20,DataVecOM50];
% GRPOM = [GRPOM0,GRPOM1,GRPOM20,GRPOM50];
% % figure
% % boxplot(DataVecYM,GRPYM)
% 
% %vyrai
% DataVecYW = [DataVecYW0,DataVecYW1,DataVecYW20,DataVecYW50];
% GRPYW = [GRPYW0,GRPYW1,GRPYW20,GRPYW50];
% % figure
% % boxplot(DataVecYW,GRPYW)
% %moterys
% DataVecOW = [DataVecOW0,DataVecOW1,DataVecOW20,DataVecOW50];
% GRPOW = [GRPOW0,GRPOW1,GRPOW20,GRPOW50];
% % figure
% % boxplot(DataVecOW,GRPOW)
% 
% DataVecAll = [DataVecYM,DataVecOM,DataVecYW,DataVecOW]
% GRPAll = [GRPYM,GRPOM,GRPYW,GRPOW]



DMMen = [[DataVecYM,DataVecOM]', [GRPYM,GRPOM]'];
DMWomen = [[DataVecYW,DataVecOW]', [GRPYW,GRPOW]'];
DMOld = [[DataVecOM,DataVecOW]', [GRPOM,GRPOW]'];
DMYoung = [[DataVecYM,DataVecYW]', [GRPYM,GRPYW]'];
DMAll = [DataVecAll' GRPAll'];


DMAll=sortrows(DMAll,2);
DMOld=sortrows(DMOld,2);
DMYoung=sortrows(DMYoung,2);
DMMen=sortrows(DMMen,2);
DMWomen=sortrows(DMWomen,2);
meds = zeros(4,5);
q25 = zeros(4,5);
q75 = zeros(4,5);
num = zeros(4,5);
for iii =1:4
counts = find(DMOld(:,2)== iii-1);
meds(iii,1) = round(median(DMOld(counts,1)),2)
q25(iii,1) = round(quantile(DMOld(counts,1),0.25),2)
q75(iii,1) = round(quantile(DMOld(counts,1),0.75),2)
num(iii,1) = length(counts)


counts = find(DMYoung(:,2)== iii-1);
meds(iii,2) = round(median(DMYoung(counts,1)),2)
q25(iii,2) = round(quantile(DMYoung(counts,1),0.25),2)
q75(iii,2) = round(quantile(DMYoung(counts,1),0.75),2)
num(iii,2) = length(counts)

counts = find(DMMen(:,2)== iii-1);
meds(iii,3) = round(median(DMMen(counts,1)),2)
q25(iii,3) = round(quantile(DMMen(counts,1),0.25),2)
q75(iii,3) = round(quantile(DMMen(counts,1),0.75),2)
num(iii,3) = length(counts)

counts = find(DMWomen(:,2)== iii-1);
meds(iii,4) = round(median(DMWomen(counts,1)),2)
q25(iii,4) = round(quantile(DMWomen(counts,1),0.25),2)
q75(iii,4) = round(quantile(DMWomen(counts,1),0.75),2)
num(iii,4) = length(counts)

counts = find(DMAll(:,2)== iii-1);
meds(iii,5) = round(median(DMAll(counts,1)),2)
q25(iii,5) = round(quantile(DMAll(counts,1),0.25),2)
q75(iii,5) = round(quantile(DMAll(counts,1),0.75),2)
num(iii,5) = length(counts)

end

if First

for iii =1:4
    for yyy =1:5
        
       maxs(iii,yyy) =max(num(:,yyy))
        
    end
end

end

for iii =1:4
    for yyy =1:5
        
        names{iii,yyy} = strcat(string(meds(iii,yyy)),' (',string(q25(iii,yyy)),'-',string(q75(iii,yyy)),'); ',string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
        numx{iii,yyy} = strcat(string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
    end
end
% end

