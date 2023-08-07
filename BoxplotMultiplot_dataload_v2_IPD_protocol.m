clear all
clc
close all

blacklist = [ 4 5 7 8 12 13 14 21 26 27 32 39 40 41 42 45 43 46 50 51]
old = [1 14 32 51 9 43 13 18 20 31 41 48 4 25 28 36 44 45]
men = [10 12 16 19 22 30 37 38 5 8 17 24 27 40 50 13 18 20 31 41 48 1 14 32 51] 

load('IPD_Dataset_lim0_2.mat')
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
for iii =1:49
    
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
            Block(1).IPD.Baseline(count1) = Dataset(iii).Baseline(yyy); 
            count1 = count1+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater7C.Start %warm water
            Block(2).IPD.Baseline(count2) = Dataset(iii).Baseline(yyy); 
            count2 = count2+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater7C.End % cold water 7c
            Block(3).IPD.Baseline(count3) = Dataset(iii).Baseline(yyy);
            count3 = count3+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater10C.Start % recovery1
            Block(4).IPD.Baseline(count4) = Dataset(iii).Baseline(yyy);
            count4 = count4+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater10C.End % cold water 10c
            Block(5).IPD.Baseline(count5) = Dataset(iii).Baseline(yyy);
            count5 = count5+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.DeepBreathing.Start % recovery 2
            Block(6).IPD.Baseline(count6) = Dataset(iii).Baseline(yyy);
            count6 = count6+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.DeepBreathing.End % deep breathing
            Block(7).IPD.Baseline(count7) = Dataset(iii).Baseline(yyy);
            count7 = count7+1;
        else
            Block(8).IPD.Baseline(count8) = Dataset(iii).Baseline(yyy);
            count8 = count8+1;
        end
    
    end
    
    if ismember(iii,blacklist)
    else
        
     NormalizedBlock = Block;
    NormalizedBlock(1).IPD.Baseline = NormalizedBlock(1).IPD.Baseline / median( Block(1).IPD.Baseline); 
    NormalizedBlock(2).IPD.Baseline = NormalizedBlock(2).IPD.Baseline / median( Block(1).IPD.Baseline); 
    NormalizedBlock(3).IPD.Baseline = NormalizedBlock(3).IPD.Baseline / median( Block(1).IPD.Baseline);
    NormalizedBlock(4).IPD.Baseline = NormalizedBlock(4).IPD.Baseline / median( Block(4).IPD.Baseline);
    NormalizedBlock(5).IPD.Baseline = NormalizedBlock(5).IPD.Baseline / median( Block(4).IPD.Baseline);
    NormalizedBlock(6).IPD.Baseline = NormalizedBlock(6).IPD.Baseline / median( Block(6).IPD.Baseline);
    NormalizedBlock(7).IPD.Baseline = NormalizedBlock(7).IPD.Baseline / median( Block(6).IPD.Baseline);
    Block = NormalizedBlock;
    
    
    
        for zzz =1:8
        DataVec = [DataVec; Block(zzz).IPD.Baseline'];
        GRP = [GRP; ones(length(Block(zzz).IPD.Baseline),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedian = [DataVecMedian; median(Block(zzz).IPD.Baseline)];
        GRPMedian = [GRPMedian; zzz];
        end
        
    if ismember(iii,old)
        for zzz =1:8
        DataVecOld = [DataVecOld; Block(zzz).IPD.Baseline'];
        GRPOld = [GRPOld; ones(length(Block(zzz).IPD.Baseline),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedianOld = [DataVecMedianOld; median(Block(zzz).IPD.Baseline)];
        GRPMedianOld = [GRPMedianOld; zzz];
        end
    else
        for zzz =1:8
        DataVecYoung = [DataVecYoung; Block(zzz).IPD.Baseline'];
        GRPYoung = [GRPYoung; ones(length(Block(zzz).IPD.Baseline),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedianYoung = [DataVecMedianYoung; median(Block(zzz).IPD.Baseline)];
        GRPMedianYoung = [GRPMedianYoung; zzz];
        end
        
    end
    if ismember(iii,men)
        for zzz =1:8
        DataVecMen = [DataVecMen; Block(zzz).IPD.Baseline'];
        GRPMen = [GRPMen; ones(length(Block(zzz).IPD.Baseline),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedianMen = [DataVecMedianMen; median(Block(zzz).IPD.Baseline)];
        GRPMedianMen = [GRPMedianMen; zzz];
        end
        
        
    else
        for zzz =1:8
        DataVecWomen = [DataVecWomen; Block(zzz).IPD.Baseline'];
        GRPWomen = [GRPWomen; ones(length(Block(zzz).IPD.Baseline),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedianWomen = [DataVecMedianWomen; median(Block(zzz).IPD.Baseline)];
        GRPMedianWomen = [GRPMedianWomen; zzz];
        end
        
    end

    end
    
    
end




save('IPD_Protocol_Dataset_Baseline_normalized.mat','DataVec','DataVecOld','DataVecYoung','DataVecWomen','DataVecMen','DataVecMedian','DataVecMedianOld','DataVecMedianYoung','DataVecMedianMen','DataVecMedianWomen','GRP','GRPOld','GRPYoung','GRPMen','GRPWomen','GRPMedian','GRPMedianOld','GRPMedianYoung','GRPMedianMen','GRPMedianWomen')




