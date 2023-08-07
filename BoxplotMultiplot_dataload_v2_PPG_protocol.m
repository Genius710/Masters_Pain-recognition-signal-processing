clear all
clc
close all

blacklist = [3 21]
old = [1 14 32 51 9 43 13 18 20 31 41 48 4 25 28 36 44 45]
men = [10 12 16 19 22 30 37 38 5 8 17 24 27 40 50 13 18 20 31 41 48 1 14 32 51] 

load('PPG_Dataset.mat')
Def = []
Bas =[]
Grp =[]
Def0 = []
Grp0 =[]

DataVec = []
GRP = []

DataVecOld = []
GRPOld = []

DataVecYoung = []
GRPYoung = []

DataVecMen = []
GRPMen = []

DataVecWomen = []
GRPWomen = []



DataVecMedian = []
GRPMedian = []

DataVecMedianOld = []
GRPMedianOld = []

DataVecMedianYoung = []
GRPMedianYoung = []

DataVecMedianMen = []
GRPMedianMen = []

DataVecMedianWomen = []
GRPMedianWomen = []
%% Jauni Vyrai >1
for iii =1:51
    
    if iii< 10
        num = strcat('0',string(iii))
    else
    num = string(iii)
    end
    clear C
    C(iii) = load(strcat('C:\OneDrive - Kaunas University of Technology\Aurimod2019_BMI\05_Data\Final\Aurimod',num,'\Aurimod',num,'.mat'));

    
    

    
count1 =1
count2 =1
count3 =1
count4 =1
count5 =1
count6 =1
count7 =1
count8 =1
clear Block
clear NormalizedBlock

    for yyy =1:length(Dataset(iii).Time)
    
        
        if Dataset(iii).Time(yyy) < C(iii).PhaseTime.WarmWater.Start % baseline
            Block(1).PPG.Deflection(count1) = Dataset(iii).Deflection(yyy); 
            count1 = count1+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater7C.Start %warm water
            Block(2).PPG.Deflection(count2) = Dataset(iii).Deflection(yyy); 
            count2 = count2+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater7C.End % cold water 7c
            Block(3).PPG.Deflection(count3) = Dataset(iii).Deflection(yyy);
            count3 = count3+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater10C.Start % recovery1
            Block(4).PPG.Deflection(count4) = Dataset(iii).Deflection(yyy);
            count4 = count4+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater10C.End % cold water 10c
            Block(5).PPG.Deflection(count5) = Dataset(iii).Deflection(yyy);
            count5 = count5+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.DeepBreathing.Start % recovery 2
            Block(6).PPG.Deflection(count6) = Dataset(iii).Deflection(yyy);
            count6 = count6+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.DeepBreathing.End % deep breathing
            Block(7).PPG.Deflection(count7) = Dataset(iii).Deflection(yyy);
            count7 = count7+1;
        else
            Block(8).PPG.Deflection(count8) = Dataset(iii).Deflection(yyy);
            count8 = count8+1;
        end
    
    end
    if ismember(iii,blacklist)
    else
    
    NormalizedBlock = Block;
    if length(Block) >=1
        if ~isempty(NormalizedBlock(1).PPG)
    NormalizedBlock(1).PPG.Deflection = NormalizedBlock(1).PPG.Deflection / median( NormalizedBlock(1).PPG.Deflection); 
        end
    end
    if length(Block) >=2
        if ~isempty(NormalizedBlock(2).PPG)
    NormalizedBlock(2).PPG.Deflection = NormalizedBlock(2).PPG.Deflection / median( NormalizedBlock(1).PPG.Deflection); 
        end
    end
    if length(Block) >=3
        if ~isempty(NormalizedBlock(3).PPG)
    NormalizedBlock(3).PPG.Deflection = NormalizedBlock(3).PPG.Deflection / median( NormalizedBlock(1).PPG.Deflection);
        end
    end
    if length(Block) >=4
        if ~isempty(NormalizedBlock(4).PPG)
    NormalizedBlock(4).PPG.Deflection = NormalizedBlock(4).PPG.Deflection / median( NormalizedBlock(4).PPG.Deflection);
        end
    end
    if length(Block) >=5
        if ~isempty(NormalizedBlock(5).PPG)
    NormalizedBlock(5).PPG.Deflection = NormalizedBlock(5).PPG.Deflection / median( NormalizedBlock(4).PPG.Deflection);
        end
    end
    if length(Block) >=6
        if ~isempty(NormalizedBlock(6).PPG)
    NormalizedBlock(6).PPG.Deflection = NormalizedBlock(6).PPG.Deflection / median( NormalizedBlock(6).PPG.Deflection);
        end
    end
    if length(Block) >=7
    if ~isempty(NormalizedBlock(7).PPG)
    NormalizedBlock(7).PPG.Deflection = NormalizedBlock(7).PPG.Deflection / median( NormalizedBlock(6).PPG.Deflection);
    end
    end
    Block = NormalizedBlock;
    
    
    
    
    
        for zzz =1:8
            
    if length(Block) >=zzz
            if ~isempty(NormalizedBlock(zzz).PPG)
        DataVec = [DataVec; Block(zzz).PPG.Deflection'];
        GRP = [GRP; ones(length(Block(zzz).PPG.Deflection),1)*zzz];
            end
    end
        end
        
        for zzz =1:8
            if length(Block) >=zzz
            if ~isempty(NormalizedBlock(zzz).PPG)
        DataVecMedian = [DataVecMedian; median(Block(zzz).PPG.Deflection)];
        GRPMedian = [GRPMedian; zzz];
            end
        end
        end
    if ismember(iii,old)
        for zzz =1:8
            if length(Block) >=zzz
            if ~isempty(NormalizedBlock(zzz).PPG)
        DataVecOld = [DataVecOld; Block(zzz).PPG.Deflection'];
        GRPOld = [GRPOld; ones(length(Block(zzz).PPG.Deflection),1)*zzz];
            end
        end
        end
        for zzz =1:8
            if length(Block) >=zzz
            if ~isempty(NormalizedBlock(zzz).PPG)
        DataVecMedianOld = [DataVecMedianOld; median(Block(zzz).PPG.Deflection)];
        GRPMedianOld = [GRPMedianOld; zzz];
            end
            end
        end
    else
        for zzz =1:8
            if length(Block) >=zzz
            if ~isempty(NormalizedBlock(zzz).PPG)
        DataVecYoung = [DataVecYoung; Block(zzz).PPG.Deflection'];
        GRPYoung = [GRPYoung; ones(length(Block(zzz).PPG.Deflection),1)*zzz];
            end
            end
        end
        
        for zzz =1:8
           if length(Block) >=zzz
               if ~isempty(NormalizedBlock(zzz).PPG)
        DataVecMedianYoung = [DataVecMedianYoung; median(Block(zzz).PPG.Deflection)];
        GRPMedianYoung = [GRPMedianYoung; zzz];
            end
        end
        end
    end
    if ismember(iii,men)
        for zzz =1:8
            if length(Block) >=zzz
            if ~isempty(NormalizedBlock(zzz).PPG)
        DataVecMen = [DataVecMen; Block(zzz).PPG.Deflection'];
        GRPMen = [GRPMen; ones(length(Block(zzz).PPG.Deflection),1)*zzz];
            end
        end
        end
        for zzz =1:8
           if length(Block) >=zzz
            if ~isempty(NormalizedBlock(zzz).PPG)
        DataVecMedianMen = [DataVecMedianMen; median(Block(zzz).PPG.Deflection)];
        GRPMedianMen = [GRPMedianMen; zzz];
            end
        end
        end
        
    else
        for zzz =1:8
           if length(Block) >=zzz
            if ~isempty(NormalizedBlock(zzz).PPG)
        DataVecWomen = [DataVecWomen; Block(zzz).PPG.Deflection'];
        GRPWomen = [GRPWomen; ones(length(Block(zzz).PPG.Deflection),1)*zzz];
            end
           end
        end
        
        for zzz =1:8
           if length(Block) >=zzz
            if ~isempty(NormalizedBlock(zzz).PPG)
        DataVecMedianWomen = [DataVecMedianWomen; median(Block(zzz).PPG.Deflection)];
        GRPMedianWomen = [GRPMedianWomen; zzz];
            end
           end
        end
        
    end

    end
    
    
end


save('PPG_Protocol_Dataset_Deflection_normalized.mat','DataVec','DataVecOld','DataVecYoung','DataVecWomen','DataVecMen','DataVecMedian','DataVecMedianOld','DataVecMedianYoung','DataVecMedianMen','DataVecMedianWomen','GRP','GRPOld','GRPYoung','GRPMen','GRPWomen','GRPMedian','GRPMedianOld','GRPMedianYoung','GRPMedianMen','GRPMedianWomen')






