clear all
clc
close all

blacklist = [36 27 45 33];
old = [1 14 32 51 9 43 13 18 20 31 41 48 4 25 28 36 44 45]
men = [10 12 16 19 22 30 37 38 5 8 17 24 27 40 50 13 18 20 31 41 48 1 14 32 51] 

load('CNAP_Dataset.mat')
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
            Block(1).CNAP.Systolic(count1) = Dataset(iii).Systolic(yyy); 
            count1 = count1+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater7C.Start %warm water
            Block(2).CNAP.Systolic(count2) = Dataset(iii).Systolic(yyy); 
            count2 = count2+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater7C.End % cold water 7c
            Block(3).CNAP.Systolic(count3) = Dataset(iii).Systolic(yyy);
            count3 = count3+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater10C.Start % recovery1
            Block(4).CNAP.Systolic(count4) = Dataset(iii).Systolic(yyy);
            count4 = count4+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.ColdWater10C.End % cold water 10c
            Block(5).CNAP.Systolic(count5) = Dataset(iii).Systolic(yyy);
            count5 = count5+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.DeepBreathing.Start % recovery 2
            Block(6).CNAP.Systolic(count6) = Dataset(iii).Systolic(yyy);
            count6 = count6+1;
        elseif Dataset(iii).Time(yyy) < C(iii).PhaseTime.DeepBreathing.End % deep breathing
            Block(7).CNAP.Systolic(count7) = Dataset(iii).Systolic(yyy);
            count7 = count7+1;
        else
            Block(8).CNAP.Systolic(count8) = Dataset(iii).Systolic(yyy);
            count8 = count8+1;
        end
    
    end
    
    if ismember(iii,blacklist)
    else
    
    NormalizedBlock = Block;
    NormalizedBlock(1).CNAP.Systolic = NormalizedBlock(1).CNAP.Systolic / median( Block(1).CNAP.Systolic); 
    NormalizedBlock(2).CNAP.Systolic = NormalizedBlock(2).CNAP.Systolic / median( Block(1).CNAP.Systolic); 
    NormalizedBlock(3).CNAP.Systolic = NormalizedBlock(3).CNAP.Systolic / median( Block(1).CNAP.Systolic);
    NormalizedBlock(4).CNAP.Systolic = NormalizedBlock(4).CNAP.Systolic / median( Block(4).CNAP.Systolic);
    NormalizedBlock(5).CNAP.Systolic = NormalizedBlock(5).CNAP.Systolic / median( Block(4).CNAP.Systolic);
    NormalizedBlock(6).CNAP.Systolic = NormalizedBlock(6).CNAP.Systolic / median( Block(6).CNAP.Systolic);
    NormalizedBlock(7).CNAP.Systolic = NormalizedBlock(7).CNAP.Systolic / median( Block(6).CNAP.Systolic);
    Block = NormalizedBlock;
    
    
        for zzz =1:8
        DataVec = [DataVec; Block(zzz).CNAP.Systolic'];
        GRP = [GRP; ones(length(Block(zzz).CNAP.Systolic),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedian = [DataVecMedian; median(Block(zzz).CNAP.Systolic)];
        GRPMedian = [GRPMedian; zzz];
        end
        
    if ismember(iii,old)
        for zzz =1:8
        DataVecOld = [DataVecOld; Block(zzz).CNAP.Systolic'];
        GRPOld = [GRPOld; ones(length(Block(zzz).CNAP.Systolic),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedianOld = [DataVecMedianOld; median(Block(zzz).CNAP.Systolic)];
        GRPMedianOld = [GRPMedianOld; zzz];
        end
    else
        for zzz =1:8
        DataVecYoung = [DataVecYoung; Block(zzz).CNAP.Systolic'];
        GRPYoung = [GRPYoung; ones(length(Block(zzz).CNAP.Systolic),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedianYoung = [DataVecMedianYoung; median(Block(zzz).CNAP.Systolic)];
        GRPMedianYoung = [GRPMedianYoung; zzz];
        end
        
    end
    if ismember(iii,men)
        for zzz =1:8
        DataVecMen = [DataVecMen; Block(zzz).CNAP.Systolic'];
        GRPMen = [GRPMen; ones(length(Block(zzz).CNAP.Systolic),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedianMen = [DataVecMedianMen; median(Block(zzz).CNAP.Systolic)];
        GRPMedianMen = [GRPMedianMen; zzz];
        end
        
        
    else
        for zzz =1:8
        DataVecWomen = [DataVecWomen; Block(zzz).CNAP.Systolic'];
        GRPWomen = [GRPWomen; ones(length(Block(zzz).CNAP.Systolic),1)*zzz];
        end
        
        for zzz =1:8
        DataVecMedianWomen = [DataVecMedianWomen; median(Block(zzz).CNAP.Systolic)];
        GRPMedianWomen = [GRPMedianWomen; zzz];
        end
        
    end

    end
    
    
end



save('CNAP_Protocol_Dataset_Systolic_normalized.mat','DataVec','DataVecOld','DataVecYoung','DataVecWomen','DataVecMen','DataVecMedian','DataVecMedianOld','DataVecMedianYoung','DataVecMedianMen','DataVecMedianWomen','GRP','GRPOld','GRPYoung','GRPMen','GRPWomen','GRPMedian','GRPMedianOld','GRPMedianYoung','GRPMedianMen','GRPMedianWomen')




