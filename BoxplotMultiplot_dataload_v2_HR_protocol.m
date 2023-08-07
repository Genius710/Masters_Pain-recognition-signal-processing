clear all
clc
close all

blacklist = []
old = [1 14 32 51 9 43 13 18 20 31 41 48 4 25 28 36 44 45]
men = [10 12 16 19 22 30 37 38 5 8 17 24 27 40 50 13 18 20 31 41 48 1 14 32 51] 

load('HR_Dataset.mat')
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
            Block(1).ECG.HR(count1) = Dataset(iii).HR(yyy); 
            count1 = count1+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater7C.Start %warm water
            Block(2).ECG.HR(count2) = Dataset(iii).HR(yyy); 
            count2 = count2+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater7C.End % cold water 7c
            Block(3).ECG.HR(count3) = Dataset(iii).HR(yyy);
            count3 = count3+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater10C.Start % recovery1
            Block(4).ECG.HR(count4) = Dataset(iii).HR(yyy);
            count4 = count4+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater10C.End % cold water 10c
            Block(5).ECG.HR(count5) = Dataset(iii).HR(yyy);
            count5 = count5+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.DeepBreathing.Start % recovery 2
            Block(6).ECG.HR(count6) = Dataset(iii).HR(yyy);
            count6 = count6+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.DeepBreathing.End % deep breathing
            Block(7).ECG.HR(count7) = Dataset(iii).HR(yyy);
            count7 = count7+1;
        else
            Block(8).ECG.HR(count8) = Dataset(iii).HR(yyy);
            count8 = count8+1;
        end
    
    end
    
    if ismember(iii,blacklist)
    else
        
    NormalizedBlock = Block;
    NormalizedBlock(1).ECG.HR = NormalizedBlock(1).ECG.HR / median( Block(1).ECG.HR); 
    NormalizedBlock(2).ECG.HR = NormalizedBlock(2).ECG.HR / median( Block(1).ECG.HR); 
    NormalizedBlock(3).ECG.HR = NormalizedBlock(3).ECG.HR / median( Block(1).ECG.HR);
    NormalizedBlock(4).ECG.HR = NormalizedBlock(4).ECG.HR / median( Block(4).ECG.HR);
    NormalizedBlock(5).ECG.HR = NormalizedBlock(5).ECG.HR / median( Block(4).ECG.HR);
    NormalizedBlock(6).ECG.HR = NormalizedBlock(6).ECG.HR / median( Block(6).ECG.HR);
    NormalizedBlock(7).ECG.HR = NormalizedBlock(7).ECG.HR / median( Block(6).ECG.HR);
    Block = NormalizedBlock;
    
    
    
        for zzz =1:8
        DataVec = [DataVec; Block(zzz).ECG.HR'];
        GRP = [GRP; ones(length(Block(zzz).ECG.HR),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedian = [DataVecMedian; median(Block(zzz).ECG.HR)];
        GRPMedian = [GRPMedian; zzz];
        end
        
    if ismember(iii,old)
        for zzz =1:8
        DataVecOld = [DataVecOld; Block(zzz).ECG.HR'];
        GRPOld = [GRPOld; ones(length(Block(zzz).ECG.HR),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedianOld = [DataVecMedianOld; median(Block(zzz).ECG.HR)];
        GRPMedianOld = [GRPMedianOld; zzz];
        end
    else
        for zzz =1:8
        DataVecYoung = [DataVecYoung; Block(zzz).ECG.HR'];
        GRPYoung = [GRPYoung; ones(length(Block(zzz).ECG.HR),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedianYoung = [DataVecMedianYoung; median(Block(zzz).ECG.HR)];
        GRPMedianYoung = [GRPMedianYoung; zzz];
        end
        
    end
    if ismember(iii,men)
        for zzz =1:8
        DataVecMen = [DataVecMen; Block(zzz).ECG.HR'];
        GRPMen = [GRPMen; ones(length(Block(zzz).ECG.HR),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedianMen = [DataVecMedianMen; median(Block(zzz).ECG.HR)];
        GRPMedianMen = [GRPMedianMen; zzz];
        end
        
        
    else
        for zzz =1:8
        DataVecWomen = [DataVecWomen; Block(zzz).ECG.HR'];
        GRPWomen = [GRPWomen; ones(length(Block(zzz).ECG.HR),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedianWomen = [DataVecMedianWomen; median(Block(zzz).ECG.HR)];
        GRPMedianWomen = [GRPMedianWomen; zzz];
        end
        
    end

    end
    
    
end




save('HR_Protocol_Dataset_normalized.mat','DataVec','DataVecOld','DataVecYoung','DataVecWomen','DataVecMen','DataVecMedian','DataVecMedianOld','DataVecMedianYoung','DataVecMedianMen','DataVecMedianWomen','GRP','GRPOld','GRPYoung','GRPMen','GRPWomen','GRPMedian','GRPMedianOld','GRPMedianYoung','GRPMedianMen','GRPMedianWomen')




