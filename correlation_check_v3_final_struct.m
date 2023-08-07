 clear all
close all
clc
n=51
% ppg
% blacklist = [ 3 6 8 9 11 15 18 21 29 31 33 34 35 39 40 42 44 46 47 49 ]
% blacklist = [45 48 50 51] ear ir
% blacklist = [3 21] % finger red
blacklist = [46 40 35 34 33 31 29 15 11 9 8 3 21 49 ] %finger ir
% imped_
% blacklist = [ 1 2 4 5 6 7 8 10 11 12 13 14 18 21 23 26 27 28 29 30 32 35 36 39 40 43 46 50 51]
grp= []
Sum_RMSE = []
Dgrp= []
DSum_RMSE = []
for iii = 16:51
     if ismember(iii,blacklist)
     else
        
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
load(strcat('C:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'PPG_Finger_IR_Final_Struct.mat'))
%      end
     
     for yyy=1: length(Blocks.Blocks)
         DSample_matrix(yyy,:) = Blocks.Normalized.Diff(1).Blocks(yyy).Signal(:)/max(Blocks.Normalized.Diff(1).Blocks(yyy).Signal(:));
         Sample_matrix(yyy,:) = Blocks.Normalized.Blocks(yyy).Signal(:)/max(Blocks.Normalized.Blocks(yyy).Signal(:));
%          PainTime_vector(yyy) = 
     end
%      Blocks.PhaseTime.WarmWater.Start = 600;
     
     lim = find([Blocks.Blocks(:).PainTime] > Blocks.PhaseTime.WarmWater.Start)
     Standard_shape = quantile(Sample_matrix(1:lim(1)-1,:),0.5);
     DStandard_shape = quantile(DSample_matrix(1:lim(1)-1,:),0.5);
     figure(iii)
     plot(Standard_shape)
%      
     for yyy=1: length(Blocks.Blocks)
     Blocks.Blocks(yyy).Error_vector(1:500) = Standard_shape-(Blocks.Normalized.Blocks(yyy).Signal(:)/max(Blocks.Normalized.Blocks(yyy).Signal(:)))';
     Blocks.Blocks(yyy).SE =Blocks.Blocks(yyy).Error_vector.*Blocks.Blocks(yyy).Error_vector;
     
     SE =Blocks.Blocks(yyy).Error_vector.*Blocks.Blocks(yyy).Error_vector;
     Blocks.Blocks(yyy).RMSE = sqrt(sum(SE)/500); 
%      clear Blocks.Blocks(yyy).SE
%      rmfield(Blocks.Blocks,'SE');
%      Blocks.Blocks(yyy).Sum_RMSE = sum(Blocks.Blocks(yyy).RMSE);
%      Sum_RMSE = [Sum_RMSE Blocks.Blocks(yyy).Sum_RMSE];
%      grp = [ grp iii];
     end
     
     for yyy=1: length(Blocks.Blocks)
     Blocks.Blocks(yyy).Diff(1).Error_vector(1:500) = DStandard_shape-(Blocks.Normalized.Diff(1).Blocks(yyy).Signal(:)/max(Blocks.Normalized.Diff(1).Blocks(yyy).Signal(:)))';
     SE =Blocks.Blocks(yyy).Diff(1).Error_vector.*Blocks.Blocks(yyy).Diff(1).Error_vector;
     Blocks.Blocks(yyy).Diff(1).RMSE = sqrt(sum(SE)/500); 
%      clear Blocks.Blocks(yyy).Diff(1).SE 
%      rmfield(Blocks,'Blocks(yyy).Diff(1).SE');
%      Blocks.Blocks(yyy).Diff(1).Sum_RMSE = sum(Blocks.Blocks(yyy).Diff(1).RMSE);
    
     end
     
     %% removal of nan and inf containing blocks
     nan_check =[]
     inf_check = []
     remove = []
     for yyy=1: length(Blocks.Blocks)
     nan_check(yyy) = isnan(sum([Blocks.Blocks(yyy).RMSE]));
     inf_check(yyy) = isinf(sum([Blocks.Blocks(yyy).RMSE]));
     remove(yyy) = nan_check(yyy)+inf_check(yyy);
%      rem = find(remove == 1)

     end
     rem =[]
     rem = find(remove == 1)
     Blocks.Blocks(rem) = [];
     Blocks.Normalized.Blocks(rem) = [];
     for yyy=1:6
     Blocks.Normalized.Diff(yyy).Blocks(rem) = []
     Blocks.Diff(yyy).Blocks(rem) = []
     end
     %% a 
     for yyy=1: length(Blocks.Blocks)
     Sum_RMSE = [Sum_RMSE Blocks.Blocks(yyy).RMSE];
     grp = [grp iii];
     DSum_RMSE = [DSum_RMSE Blocks.Blocks(yyy).Diff(1).RMSE];
     Dgrp = [ Dgrp iii];
     end
     %% creation of filtered branch
     count1 =1
%      lim = 103;
lim =0.1327;
     Blocks.QC = [];
     Blocks.Normalized.QC =[];
    for xxx=1:6
            Blocks.Diff(xxx).QC=[]
    end
     for yyy=1:length(Blocks.Blocks)
        if Blocks.Blocks(yyy).RMSE < lim
            Blocks.QC.Blocks(count1) = Blocks.Blocks(yyy);
            Blocks.Normalized.QC.Blocks(count1) = Blocks.Normalized.Blocks(yyy);
            for xxx=1:6
            Blocks.Diff(xxx).QC.Blocks(count1) = Blocks.Diff(xxx).Blocks(yyy);
            Blocks.Normalized.QC.Diff(xxx).Blocks(count1) = Blocks.Normalized.Diff(xxx).Blocks(yyy);
            end
%             Blocks.QC.Blocks(count1).Sum_RMSE = Blocks.Blocks.Sum_RMSE; 
            count1 = count1+1;
        end
     end
     
     
%      for yyy=1: length(Blocks.QC.Blocks)
% %      Blocks.Blocks(yyy).Error_vector(1:500) = Standard_shape-Blocks.Normalized.QC.Blocks(yyy).Signal(:)';
% %      Blocks.Blocks(yyy).RMSE =sqrt(Blocks.Blocks(yyy).Error_vector.*Blocks.Blocks(yyy).Error_vector);
% %      Blocks.Blocks(yyy).Sum_RMSE = sum(Blocks.Blocks(yyy).RMSE);
%      Sum_RMSE = [Sum_RMSE Blocks.QC.Blocks(yyy).Sum_RMSE];
%      grp = [grp iii];
%      end
     
%      for yyy=1: length(Blocks.Blocks)
%      Blocks.Blocks(yyy).Diff(1).Error_vector(1:500) = DStandard_shape-Blocks.Normalized.Diff(1).Blocks(yyy).Signal(:)';
%      Blocks.Blocks(yyy).Diff(1).RMSE =sqrt(Blocks.Blocks(yyy).Diff(1).Error_vector.*Blocks.Blocks(yyy).Diff(1).Error_vector);
%      Blocks.Blocks(yyy).Diff(1).Sum_RMSE = sum(Blocks.Blocks(yyy).Diff(1).RMSE);
%      DSum_RMSE = [DSum_RMSE Blocks.Blocks(yyy).Diff(1).Sum_RMSE];
%      Dgrp = [ Dgrp iii];
%      end

save(strcat('C:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'PPG_Finger_IR_Final_Struct.mat'), 'Blocks')
     
     end

end
figure
boxplot(Sum_RMSE,grp)

figure
boxplot(DSum_RMSE,Dgrp)

