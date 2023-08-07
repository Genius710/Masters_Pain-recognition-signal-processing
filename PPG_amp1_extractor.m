clear all
close all
clc
s =1
limn=51

%CNAP
% blacklist = [36 27 45 33];

% ppg
% blacklist = [ 3 6 8 9 11 15 18 21 29 31 33 34 35 39 40 42 44 46 47 49 ]
% blacklist = [3 21] %% 22 has error with a single diff4 not having enough points
% blacklist = [46 40 35 34 33 31 29 15 11 9 8 3 21 49 ] %finger ir
blacklist = [3 21] 
% imped_
% blacklist = [ 4 5 7 8 12 13 14 21 26 27 32 39 40 41 42 45 43 46 50 51]
multi = 1
for qqq =1:51
    s = qqq;
    limn =s
for iii = s:limn
     if ismember(iii,blacklist)
     else
        
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
    load((strcat('Feature_DataBlock_',num,'_multi_',string(multi),'.mat')))
%     Blocks.Signal =Blocks.Signal-mean(Blocks.Signal)
     

   %% feature extraction
%    for zzz =1: length(DataBlock.Features)
   Dataset(iii).Deflection = DataBlock.Features(:,39)

%    plot(Blocks.Raw_Signal(Blocks.QC.Blocks(zzz).Start:Blocks.QC.Blocks(zzz).End))

%    end
   Dataset(iii).Label = DataBlock.Label
   Dataset(iii).Time = DataBlock.Time     
     
%      %% normalizing features
%      lim = find([Dataset(iii).Time] > 300)
%      star = find([Dataset(iii).Time] > 180)
%      
%      normS = mean(Dataset(iii).Systolic(star(1):lim(1)));
%      normD = mean(Dataset(iii).Diastolic(star(1):lim(1)));
%      normM = mean(Dataset(iii).Mean(star(1):lim(1)));
% %      plot(Dataset.Systolic)
%      Dataset(iii).Systolic = Dataset(iii).Systolic/normS;
%      Dataset(iii).Diastolic = Dataset(iii).Diastolic/normD;
%      Dataset(iii).Mean = Dataset(iii).Mean/normM;
     
     
     lim = find([Dataset(iii).Time] > 300)
     star = find([Dataset(iii).Time] > 180)
     
%      normB = mean(Dataset(iii).Baseline(star(1):lim(1)));
     normD = mean(Dataset(iii).Deflection(star(1):lim(1)));

%      plot(Dataset.Systolic)
%      Dataset(iii).Baseline = Dataset(iii).Baseline/normB;
     Dataset(iii).Deflection = Dataset(iii).Deflection/normD;
     
     
     
     end
end
%% 

   


end

  save(strcat('PPG_Dataset.mat'),'Dataset');

