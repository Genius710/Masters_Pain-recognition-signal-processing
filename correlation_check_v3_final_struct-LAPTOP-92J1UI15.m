 clear all
close all
clc
n=51
% ppg
% blacklist = [ 3 6 8 9 11 15 18 21 29 31 33 34 35 39 40 42 44 46 47 49 ]
blacklist = [45 48 50 51]
% imped_
% blacklist = [ 1 2 4 5 6 7 8 10 11 12 13 14 18 21 23 26 27 28 29 30 32 35 36 39 40 43 46 50 51]
grp= []
Sum_RMSE = []
Dgrp= []
DSum_RMSE = []
for iii = 1:51
     if ismember(iii,blacklist)
     else
        
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
load(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'PPG_Ear_IR_Final_Struct.mat'))
%      end
     
     for yyy=1: length(Blocks.Blocks)
         DSample_matrix(yyy,:) = Blocks.Normalized.Diff(1).Blocks(yyy).Signal(:);
         Sample_matrix(yyy,:) = Blocks.Normalized.Blocks(yyy).Signal(:);
%          PainTime_vector(yyy) = 
     end
%      Blocks.PhaseTime.WarmWater.Start = 600;
     
     lim = find([Blocks.Blocks(:).PainTime] > Blocks.PhaseTime.WarmWater.Start)
     Standard_shape = quantile(Sample_matrix(1:lim(1)-1,:),0.5);
     DStandard_shape = quantile(DSample_matrix(1:lim(1)-1,:),0.5);
     figure(iii)
     plot(Standard_shape)
     
     for yyy=1: length(Blocks.Blocks)
     Blocks.Blocks(yyy).Error_vector(1:500) = Standard_shape-Blocks.Normalized.Blocks(yyy).Signal(:)';
     Blocks.Blocks(yyy).RMSE =sqrt(Blocks.Blocks(yyy).Error_vector.*Blocks.Blocks(yyy).Error_vector);
     Blocks.Blocks(yyy).Sum_RMSE = sum(Blocks.Blocks(yyy).RMSE);
     Sum_RMSE = [Sum_RMSE Blocks.Blocks(yyy).Sum_RMSE];
     grp = [ grp iii];
     end
     
     for yyy=1: length(Blocks.Blocks)
     Blocks.Blocks(yyy).Diff(1).Error_vector(1:500) = DStandard_shape-Blocks.Normalized.Diff(1).Blocks(yyy).Signal(:)';
     Blocks.Blocks(yyy).Diff(1).RMSE =sqrt(Blocks.Blocks(yyy).Diff(1).Error_vector.*Blocks.Blocks(yyy).Diff(1).Error_vector);
     Blocks.Blocks(yyy).Diff(1).Sum_RMSE = sum(Blocks.Blocks(yyy).Diff(1).RMSE);
     DSum_RMSE = [DSum_RMSE Blocks.Blocks(yyy).Diff(1).Sum_RMSE];
     Dgrp = [ grp iii];
     end
     
end
end
figure
boxplot(Sum_RMSE,grp)
figure
boxplot(DSum_RMSE,Dgrp)

