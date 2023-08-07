clear all
close all
clc

%% HR
% load('HR_Protocol_Dataset.mat')
load('HR_Protocol_Dataset_normalized.mat')

DMMen = [DataVecMedianMen, GRPMedianMen];
DMWomen = [DataVecMedianWomen, GRPMedianWomen];
DMOld = [DataVecMedianOld, GRPMedianOld];
DMYoung = [DataVecMedianYoung, GRPMedianYoung];
DMAll = [DataVecMedian GRPMedian];


DMAll=sortrows(DMAll,2);
DMOld=sortrows(DMOld,2);
DMYoung=sortrows(DMYoung,2);
DMMen=sortrows(DMMen,2);
DMWomen=sortrows(DMWomen,2);
meds = zeros(8,5);
q25 = zeros(8,5);
q75 = zeros(8,5);
num = zeros(8,5);
for iii =1:8
counts = find(DMOld(:,2)== iii);
meds(iii,1) = round(median(DMOld(counts,1)),2)
q25(iii,1) = round(quantile(DMOld(counts,1),0.25),2)
q75(iii,1) = round(quantile(DMOld(counts,1),0.75),2)
num(iii,1) = length(counts)


counts = find(DMYoung(:,2)== iii);
meds(iii,2) = round(median(DMYoung(counts,1)),2)
q25(iii,2) = round(quantile(DMYoung(counts,1),0.25),2)
q75(iii,2) = round(quantile(DMYoung(counts,1),0.75),2)
num(iii,2) = length(counts)

counts = find(DMMen(:,2)== iii);
meds(iii,3) = round(median(DMMen(counts,1)),2)
q25(iii,3) = round(quantile(DMMen(counts,1),0.25),2)
q75(iii,3) = round(quantile(DMMen(counts,1),0.75),2)
num(iii,3) = length(counts)

counts = find(DMWomen(:,2)== iii);
meds(iii,4) = round(median(DMWomen(counts,1)),2)
q25(iii,4) = round(quantile(DMWomen(counts,1),0.25),2)
q75(iii,4) = round(quantile(DMWomen(counts,1),0.75),2)
num(iii,4) = length(counts)

counts = find(DMAll(:,2)== iii);
meds(iii,5) = round(median(DMAll(counts,1)),2)
q25(iii,5) = round(quantile(DMAll(counts,1),0.25),2)
q75(iii,5) = round(quantile(DMAll(counts,1),0.75),2)
num(iii,5) = length(counts)

end

for iii =1:8
    for yyy =1:5
        
       maxs(iii,yyy) =max(num(:,yyy))
        
    end
end


for iii =1:8
    for yyy =1:5
        
        names{iii,yyy} = strcat(string(meds(iii,yyy)),' (',string(q25(iii,yyy)),'-',string(q75(iii,yyy)),')')%; ',string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
        numx{iii,yyy} = strcat(string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
    end
end

for iii =1:8
    for yyy =1:5
Table{iii,yyy} = names{iii,yyy};
    end
end

% numx = num/.maxs
% load('PPG_Protocol_Dataset.mat')
load('PPG_Protocol_Dataset_Deflection_Normalized.mat')


DMMen = [DataVecMedianMen, GRPMedianMen];
DMWomen = [DataVecMedianWomen, GRPMedianWomen];
DMOld = [DataVecMedianOld, GRPMedianOld];
DMYoung = [DataVecMedianYoung, GRPMedianYoung];
DMAll = [DataVecMedian GRPMedian];


DMAll=sortrows(DMAll,2);
DMOld=sortrows(DMOld,2);
DMYoung=sortrows(DMYoung,2);
DMMen=sortrows(DMMen,2);
DMWomen=sortrows(DMWomen,2);
meds = zeros(8,5);
q25 = zeros(8,5);
q75 = zeros(8,5);
num = zeros(8,5);
for iii =1:8
counts = find(DMOld(:,2)== iii);
meds(iii,1) = round(median(DMOld(counts,1)),2)
q25(iii,1) = round(quantile(DMOld(counts,1),0.25),2)
q75(iii,1) = round(quantile(DMOld(counts,1),0.75),2)
num(iii,1) = length(counts)


counts = find(DMYoung(:,2)== iii);
meds(iii,2) = round(median(DMYoung(counts,1)),2)
q25(iii,2) = round(quantile(DMYoung(counts,1),0.25),2)
q75(iii,2) = round(quantile(DMYoung(counts,1),0.75),2)
num(iii,2) = length(counts)

counts = find(DMMen(:,2)== iii);
meds(iii,3) = round(median(DMMen(counts,1)),2)
q25(iii,3) = round(quantile(DMMen(counts,1),0.25),2)
q75(iii,3) = round(quantile(DMMen(counts,1),0.75),2)
num(iii,3) = length(counts)

counts = find(DMWomen(:,2)== iii);
meds(iii,4) = round(median(DMWomen(counts,1)),2)
q25(iii,4) = round(quantile(DMWomen(counts,1),0.25),2)
q75(iii,4) = round(quantile(DMWomen(counts,1),0.75),2)
num(iii,4) = length(counts)

counts = find(DMAll(:,2)== iii);
meds(iii,5) = round(median(DMAll(counts,1)),2)
q25(iii,5) = round(quantile(DMAll(counts,1),0.25),2)
q75(iii,5) = round(quantile(DMAll(counts,1),0.75),2)
num(iii,5) = length(counts)

end

for iii =1:8
    for yyy =1:5
        
        names{iii,yyy} = strcat(string(meds(iii,yyy)),' (',string(q25(iii,yyy)),'-',string(q75(iii,yyy)),')')%; ',string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
        numx{iii,yyy} = strcat(string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
    end
end

for iii =1:8
    for yyy =1:5
Table{iii+8,yyy} = names{iii,yyy};
    end
end

% load('IPD_Protocol_Dataset_Deflection.mat')
load('IPD_Protocol_Dataset_Deflection_normalized.mat')

DMMen = [DataVecMedianMen, GRPMedianMen];
DMWomen = [DataVecMedianWomen, GRPMedianWomen];
DMOld = [DataVecMedianOld, GRPMedianOld];
DMYoung = [DataVecMedianYoung, GRPMedianYoung];
DMAll = [DataVecMedian GRPMedian];


DMAll=sortrows(DMAll,2);
DMOld=sortrows(DMOld,2);
DMYoung=sortrows(DMYoung,2);
DMMen=sortrows(DMMen,2);
DMWomen=sortrows(DMWomen,2);
meds = zeros(8,5);
q25 = zeros(8,5);
q75 = zeros(8,5);
num = zeros(8,5);
for iii =1:8
counts = find(DMOld(:,2)== iii);
meds(iii,1) = round(median(DMOld(counts,1)),2)
q25(iii,1) = round(quantile(DMOld(counts,1),0.25),2)
q75(iii,1) = round(quantile(DMOld(counts,1),0.75),2)
num(iii,1) = length(counts)


counts = find(DMYoung(:,2)== iii);
meds(iii,2) = round(median(DMYoung(counts,1)),2)
q25(iii,2) = round(quantile(DMYoung(counts,1),0.25),2)
q75(iii,2) = round(quantile(DMYoung(counts,1),0.75),2)
num(iii,2) = length(counts)

counts = find(DMMen(:,2)== iii);
meds(iii,3) = round(median(DMMen(counts,1)),2)
q25(iii,3) = round(quantile(DMMen(counts,1),0.25),2)
q75(iii,3) = round(quantile(DMMen(counts,1),0.75),2)
num(iii,3) = length(counts)

counts = find(DMWomen(:,2)== iii);
meds(iii,4) = round(median(DMWomen(counts,1)),2)
q25(iii,4) = round(quantile(DMWomen(counts,1),0.25),2)
q75(iii,4) = round(quantile(DMWomen(counts,1),0.75),2)
num(iii,4) = length(counts)

counts = find(DMAll(:,2)== iii);
meds(iii,5) = round(median(DMAll(counts,1)),2)
q25(iii,5) = round(quantile(DMAll(counts,1),0.25),2)
q75(iii,5) = round(quantile(DMAll(counts,1),0.75),2)
num(iii,5) = length(counts)

end

for iii =1:8
    for yyy =1:5
        
        names{iii,yyy} = strcat(string(meds(iii,yyy)),' (',string(q25(iii,yyy)),'-',string(q75(iii,yyy)),')')%; ',string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
        numx{iii,yyy} = strcat(string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
    end
end
for iii =1:8
    for yyy =1:5
Table{iii+16,yyy} = names{iii,yyy};
    end
end
% load('IPD_Protocol_Dataset_Baseline.mat')
load('IPD_Protocol_Dataset_Baseline_normalized.mat')

DMMen = [DataVecMedianMen, GRPMedianMen];
DMWomen = [DataVecMedianWomen, GRPMedianWomen];
DMOld = [DataVecMedianOld, GRPMedianOld];
DMYoung = [DataVecMedianYoung, GRPMedianYoung];
DMAll = [DataVecMedian GRPMedian];


DMAll=sortrows(DMAll,2);
DMOld=sortrows(DMOld,2);
DMYoung=sortrows(DMYoung,2);
DMMen=sortrows(DMMen,2);
DMWomen=sortrows(DMWomen,2);
meds = zeros(8,5);
q25 = zeros(8,5);
q75 = zeros(8,5);
num = zeros(8,5);
for iii =1:8
counts = find(DMOld(:,2)== iii);
meds(iii,1) = round(median(DMOld(counts,1)),2)
q25(iii,1) = round(quantile(DMOld(counts,1),0.25),2)
q75(iii,1) = round(quantile(DMOld(counts,1),0.75),2)
num(iii,1) = length(counts)


counts = find(DMYoung(:,2)== iii);
meds(iii,2) = round(median(DMYoung(counts,1)),2)
q25(iii,2) = round(quantile(DMYoung(counts,1),0.25),2)
q75(iii,2) = round(quantile(DMYoung(counts,1),0.75),2)
num(iii,2) = length(counts)

counts = find(DMMen(:,2)== iii);
meds(iii,3) = round(median(DMMen(counts,1)),2)
q25(iii,3) = round(quantile(DMMen(counts,1),0.25),2)
q75(iii,3) = round(quantile(DMMen(counts,1),0.75),2)
num(iii,3) = length(counts)

counts = find(DMWomen(:,2)== iii);
meds(iii,4) = round(median(DMWomen(counts,1)),2)
q25(iii,4) = round(quantile(DMWomen(counts,1),0.25),2)
q75(iii,4) = round(quantile(DMWomen(counts,1),0.75),2)
num(iii,4) = length(counts)

counts = find(DMAll(:,2)== iii);
meds(iii,5) = round(median(DMAll(counts,1)),2)
q25(iii,5) = round(quantile(DMAll(counts,1),0.25),2)
q75(iii,5) = round(quantile(DMAll(counts,1),0.75),2)
num(iii,5) = length(counts)

end

for iii =1:8
    for yyy =1:5
        
        names{iii,yyy} = strcat(string(meds(iii,yyy)),' (',string(q25(iii,yyy)),'-',string(q75(iii,yyy)),')')%; ',string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
        numx{iii,yyy} = strcat(string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
    end
end
for iii =1:8
    for yyy =1:5
Table{iii+8+16,yyy} = names{iii,yyy};
    end
end
% load('CNAP_Protocol_Dataset_Systolic.mat')
load('CNAP_Protocol_Dataset_Systolic_normalized.mat')


DMMen = [DataVecMedianMen, GRPMedianMen];
DMWomen = [DataVecMedianWomen, GRPMedianWomen];
DMOld = [DataVecMedianOld, GRPMedianOld];
DMYoung = [DataVecMedianYoung, GRPMedianYoung];
DMAll = [DataVecMedian GRPMedian];


DMAll=sortrows(DMAll,2);
DMOld=sortrows(DMOld,2);
DMYoung=sortrows(DMYoung,2);
DMMen=sortrows(DMMen,2);
DMWomen=sortrows(DMWomen,2);
meds = zeros(8,5);
q25 = zeros(8,5);
q75 = zeros(8,5);
num = zeros(8,5);
for iii =1:8
counts = find(DMOld(:,2)== iii);
meds(iii,1) = round(median(DMOld(counts,1)),2)
q25(iii,1) = round(quantile(DMOld(counts,1),0.25),2)
q75(iii,1) = round(quantile(DMOld(counts,1),0.75),2)
num(iii,1) = length(counts)


counts = find(DMYoung(:,2)== iii);
meds(iii,2) = round(median(DMYoung(counts,1)),2)
q25(iii,2) = round(quantile(DMYoung(counts,1),0.25),2)
q75(iii,2) = round(quantile(DMYoung(counts,1),0.75),2)
num(iii,2) = length(counts)

counts = find(DMMen(:,2)== iii);
meds(iii,3) = round(median(DMMen(counts,1)),2)
q25(iii,3) = round(quantile(DMMen(counts,1),0.25),2)
q75(iii,3) = round(quantile(DMMen(counts,1),0.75),2)
num(iii,3) = length(counts)

counts = find(DMWomen(:,2)== iii);
meds(iii,4) = round(median(DMWomen(counts,1)),2)
q25(iii,4) = round(quantile(DMWomen(counts,1),0.25),2)
q75(iii,4) = round(quantile(DMWomen(counts,1),0.75),2)
num(iii,4) = length(counts)

counts = find(DMAll(:,2)== iii);
meds(iii,5) = round(median(DMAll(counts,1)),2)
q25(iii,5) = round(quantile(DMAll(counts,1),0.25),2)
q75(iii,5) = round(quantile(DMAll(counts,1),0.75),2)
num(iii,5) = length(counts)

end



for iii =1:8
    for yyy =1:5
        
        names{iii,yyy} = strcat(string(meds(iii,yyy)),' (',string(q25(iii,yyy)),'-',string(q75(iii,yyy)),')')%; ',string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
        numx{iii,yyy} = strcat(string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
    end
end
for iii =1:8
    for yyy =1:5
Table{iii+32,yyy} = names{iii,yyy};
    end
end
% load('CNAP_Protocol_Dataset_Diastolic.mat')
load('CNAP_Protocol_Dataset_Diastolic_normalized.mat')

DMMen = [DataVecMedianMen, GRPMedianMen];
DMWomen = [DataVecMedianWomen, GRPMedianWomen];
DMOld = [DataVecMedianOld, GRPMedianOld];
DMYoung = [DataVecMedianYoung, GRPMedianYoung];
DMAll = [DataVecMedian GRPMedian];


DMAll=sortrows(DMAll,2);
DMOld=sortrows(DMOld,2);
DMYoung=sortrows(DMYoung,2);
DMMen=sortrows(DMMen,2);
DMWomen=sortrows(DMWomen,2);
meds = zeros(8,5);
q25 = zeros(8,5);
q75 = zeros(8,5);
num = zeros(8,5);
for iii =1:8
counts = find(DMOld(:,2)== iii);
meds(iii,1) = round(median(DMOld(counts,1)),2)
q25(iii,1) = round(quantile(DMOld(counts,1),0.25),2)
q75(iii,1) = round(quantile(DMOld(counts,1),0.75),2)
num(iii,1) = length(counts)


counts = find(DMYoung(:,2)== iii);
meds(iii,2) = round(median(DMYoung(counts,1)),2)
q25(iii,2) = round(quantile(DMYoung(counts,1),0.25),2)
q75(iii,2) = round(quantile(DMYoung(counts,1),0.75),2)
num(iii,2) = length(counts)

counts = find(DMMen(:,2)== iii);
meds(iii,3) = round(median(DMMen(counts,1)),2)
q25(iii,3) = round(quantile(DMMen(counts,1),0.25),2)
q75(iii,3) = round(quantile(DMMen(counts,1),0.75),2)
num(iii,3) = length(counts)

counts = find(DMWomen(:,2)== iii);
meds(iii,4) = round(median(DMWomen(counts,1)),2)
q25(iii,4) = round(quantile(DMWomen(counts,1),0.25),2)
q75(iii,4) = round(quantile(DMWomen(counts,1),0.75),2)
num(iii,4) = length(counts)

counts = find(DMAll(:,2)== iii);
meds(iii,5) = round(median(DMAll(counts,1)),2)
q25(iii,5) = round(quantile(DMAll(counts,1),0.25),2)
q75(iii,5) = round(quantile(DMAll(counts,1),0.75),2)
num(iii,5) = length(counts)

end

for iii =1:8
    for yyy =1:5
        
        names{iii,yyy} = strcat(string(meds(iii,yyy)),' (',string(q25(iii,yyy)),'-',string(q75(iii,yyy)),')')%; ',string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
        numx{iii,yyy} = strcat(string(num(iii,yyy)),'/',string(maxs(iii,yyy)))
    end
end
for iii =1:8
    for yyy =1:5
Table{iii+40,yyy} = names{iii,yyy};
    end
end

