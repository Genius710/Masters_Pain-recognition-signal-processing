 clear all
close all
clc
%  for sss = 1:51
s = 1
n = 51

% PPGFIRBlacklist = []
PPGFIRBlacklist = [ 3 6 8 9 11 15 18 21 29 31 33 34 35 39 40 42 44 46 47 49 ]
% blacklist = []
% imped_
% IPDBlacklist = []
IPDBlacklist = [ 1 2 4 5 6 7 8 10 11 12 13 14 18 21 23 26 27 28 29 30 32 35 36 39 40 43 46 50 51]
for iii = s:n
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
% A(iii) = load(strcat('Data/Aurimod',num,'BioImpedBlockECG1_v1.mat'));
% A(iii) = load(strcat('Data/Aurimod',num,'PPGBlockECGXC_Lim1.mat'));
%  A(iii) = load(strcat('Data/Aurimod',num,'CNAPBlockV2.mat'));
 A(iii) = load(strcat('Data/Aurimod',num,'CNAPBlock_y_org_v3.mat'));
% A(iii) = load(strcat('Data/Aurimod',num,'IPD_ECG_y_org_v3'));
 
B(iii) = load(strcat('D:\OneDrive - Kaunas University of Technology\Aurimod2019_BMI\05_Data\Final\Aurimod',num,'\Aurimod',num,'.mat'));
C(iii).PhaseTime = B(iii).PhaseTime;
clear B
end

for iii =1:8
BlockCNAP(iii).Signal = zeros(1,104)
BlockPPG(iii).Signal = zeros(1,104)
BlockIPD(iii).Signal = zeros(1,104)
end


for iii =s : n
    
%     if ismember(iii,PPGFIRBlacklist)
%     else
%  if ismember(iii,IPDBlacklist)
%     else
        count1 =1
count2 =1
count3 =1
count4 =1
count5 =1
count6 =1
count7 =1
count8 =1
    for yyy =1:length(A(iii).Input)
    
        
        if A(iii).NPRST(yyy) < C(iii).PhaseTime.WarmWater.Start % baseline
            BlockCNAP(iii,1).Signal(count1,:) = A(iii).Input(yyy,1:104); 
            count1 = count1+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.Start %warm water
            BlockCNAP(iii,2).Signal(count2,:) = A(iii).Input(yyy,1:104); 
            count2 = count2+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.End % cold water 7c
            BlockCNAP(iii,3).Signal(count3,:) = A(iii).Input(yyy,1:104);
            count3 = count3+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater10C.Start % recovery1
            BlockCNAP(iii,4).Signal(count4,:) = A(iii).Input(yyy,1:104);
            count4 = count4+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater10C.End % cold water 10c
            BlockCNAP(iii,5).Signal(count5,:) = A(iii).Input(yyy,1:104);
            count5 = count5+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.DeepBreathing.Start % recovery 2
            BlockCNAP(iii,6).Signal(count6,:) = A(iii).Input(yyy,1:104);
            count6 = count6+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.DeepBreathing.End % deep breathing
            BlockCNAP(iii,7).Signal(count7,:) = A(iii).Input(yyy,1:104);
            count7 = count7+1;
        else
            BlockCNAP(iii,8).Signal(count8,:) = A(iii).Input(yyy,1:104);
            count8 = count8+1;
%         end
    end
    end
    
end

% clear A;

for iii = s:n
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end

% A(iii) = load(strcat('Data/Aurimod',num,'PPGBlockECGXC_Lim1.mat'));
%  A(iii) = load(strcat('Data/Aurimod',num,'PPGBlockECG1.mat'));
 D(iii) = load(strcat('Data/Aurimod',num,'PPGBlockECG_y_org_v3.mat'));

clear B
end
% for iii =s:n
% D(iii).NPRST =A(iii).NPRST./10
% end
% for iii =1:10
% Block(iii).Signal = zeros(1,104)
% end

for iii =s : n
    
    if ismember(iii,PPGFIRBlacklist)
    else
        count1 =1
count2 =1
count3 = 1
count4 = 1
count5 = 1
count6 =1
count7 =1
count8 =1
    for yyy =1:min([length(D(iii).NPRST) length(D(iii).Input)])
    
        
%     Block(iii).Signal(count1,:) = D(iii).Input(yyy,1:104); 
%             count1 = count1+1;
        if D(iii).NPRST(yyy) < C(iii).PhaseTime.WarmWater.Start % baseline
            BlockPPG(iii,1).Signal(count1,:) = D(iii).Input(yyy,1:104); 
            count1 = count1+1;
        elseif D(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.Start %warm water
            BlockPPG(iii,2).Signal(count2,:) = D(iii).Input(yyy,1:104); 
            count2 = count2+1;
        elseif D(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.End % cold water 7c
            BlockPPG(iii,3).Signal(count3,:) = D(iii).Input(yyy,1:104);
            count3 = count3+1;
        elseif D(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater10C.Start % recovery1
            BlockPPG(iii,4).Signal(count4,:) = D(iii).Input(yyy,1:104);
            count4 = count4+1;
        elseif D(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater10C.End % cold water 10c
            BlockPPG(iii,5).Signal(count5,:) = D(iii).Input(yyy,1:104);
            count5 = count5+1;
        elseif D(iii).NPRST(yyy) < C(iii).PhaseTime.DeepBreathing.Start % recovery 2
            BlockPPG(iii,6).Signal(count6,:) = D(iii).Input(yyy,1:104);
            count6 = count6+1;
        elseif D(iii).NPRST(yyy) < C(iii).PhaseTime.DeepBreathing.End % deep breathing
            BlockPPG(iii,7).Signal(count7,:) = D(iii).Input(yyy,1:104);
            count7 = count7+1;
        else
            BlockPPG(iii,8).Signal(count8,:) = D(iii).Input(yyy,1:104);
            count8 = count8+1;
        end
    end
    
    end
end

% clear A

for iii = s:n
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
% A(iii) = load(strcat('Data/Aurimod',num,'BioImpedBlockECG1_v1.mat'));
% A(iii) = load(strcat('Data/Aurimod',num,'IPD_normalized_xc_1,5_v1.mat'));
% A(iii) = load(strcat('Data/Aurimod',num,'IPD_ECG_normalized_v1'));
E(iii) = load(strcat('Data/Aurimod',num,'IPD_ECG_y_org_base_incl_xc1,5_v5.mat'));

clear B
end
for iii =s:n
E(iii).NPRST =E(iii).NPRST./10
end
% for iii =1:10
% Block(iii).Signal = zeros(1,104)
% end

for iii =s : n
    
    if ismember(iii,IPDBlacklist)
    else
        count1 =1
count2 =1
count3 = 1
count4 = 1
count5 = 1
count6 =1
count7 =1
count8 =1
    for yyy =1:min([length(E(iii).NPRST) length(E(iii).Input)])
    
        
%     Block(iii).Signal(count1,:) = E(iii).Input(yyy,1:104); 
%             count1 = count1+1;
        if     E(iii).NPRST(yyy) < C(iii).PhaseTime.WarmWater.Start % baseline
            BlockIPD(iii,1).Signal(count1,:) = E(iii).Input(yyy,1:104); 
            count1 = count1+1;
        elseif E(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.Start %warm water
            BlockIPD(iii,2).Signal(count2,:) = E(iii).Input(yyy,1:104); 
            count2 = count2+1;
        elseif E(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.End % cold water 7c
            BlockIPD(iii,3).Signal(count3,:) = E(iii).Input(yyy,1:104);
            count3 = count3+1;
        elseif E(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater10C.Start % recovery1
            BlockIPD(iii,4).Signal(count4,:) = E(iii).Input(yyy,1:104);
            count4 = count4+1;
        elseif E(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater10C.End % cold water 10c
            BlockIPD(iii,5).Signal(count5,:) = E(iii).Input(yyy,1:104);
            count5 = count5+1;
        elseif E(iii).NPRST(yyy) < C(iii).PhaseTime.DeepBreathing.Start % recovery 2
            BlockIPD(iii,6).Signal(count6,:) = E(iii).Input(yyy,1:104);
            count6 = count6+1;
        elseif E(iii).NPRST(yyy) < C(iii).PhaseTime.DeepBreathing.End % deep breathing
            BlockIPD(iii,7).Signal(count7,:) = E(iii).Input(yyy,1:104);
            count7 = count7+1;
        else
            BlockIPD(iii,8).Signal(count8,:) = E(iii).Input(yyy,1:104);
            count8 = count8+1;
        end
    
    end
    end
    
end

