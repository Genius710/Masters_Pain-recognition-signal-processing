clear all
close all
clc
s =1
limn=51

%CNAP
blacklist = [36 27 45 33];

% ppg
% blacklist = [ 3 6 8 9 11 15 18 21 29 31 33 34 35 39 40 42 44 46 47 49 ]
% blacklist = [3 21] %% 22 has error with a single diff4 not having enough points
% blacklist = [46 40 35 34 33 31 29 15 11 9 8 3 21 49 ] %finger ir
% blacklist = [3 21] 
% imped_
% blacklist = [ 4 5 7 8 12 13 14 21 26 27 32 39 40 41 42 45 43 46 50 51]

for qqq =31:51
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
    load(strcat('C:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'CNAP_Final_Struct.mat'))
%     Blocks.Signal =Blocks.Signal-mean(Blocks.Signal)
     
     %% error correction for diff normalized
     count1 =1
%      lim = 103;
  lim = 0.2824;
%     triplet(iii).no = [];
     Blocks.QC = [];
     Blocks.Normalized.QC =[];
    for xxx=1:6
            Blocks.Diff(xxx).QC=[]
    end
     for yyy=1:length(Blocks.Blocks)
         
%          if Blocks.Blocks(yyy-2).RMSE < lim  && Blocks.Blocks(yyy-1).RMSE < lim Blocks.Blocks(yyy).RMSE < lim
%               triplet(iii).no = [triplet(iii).no count1];
%          end
          
        if Blocks.Blocks(yyy).RMSE < lim
            Blocks.QC.Blocks(count1) = Blocks.Blocks(yyy);
            Blocks.Normalized.QC.Blocks(count1) = Blocks.Normalized.Blocks(yyy);
            for xxx=1:6
%             Blocks.Diff(xxx).QC.Blocks(count1) = Blocks.Diff(xxx).Blocks(yyy);
%             Blocks.Normalized.QC.Diff(xxx).Blocks(count1) = Blocks.Normalized.Diff(xxx).Blocks(yyy);
            end
%             Blocks.QC.Blocks(count1).Sum_RMSE = Blocks.Blocks.Sum_RMSE; 
            count1 = count1+1;
        end
     end
     
   %% feature extraction
   for zzz =1: length(Blocks.QC.Blocks)
   Dataset(iii).Systolic(zzz) = Blocks.Signal(Blocks.QC.Blocks(zzz).Max);
   
   Dataset(iii).Diastolic(zzz) = Blocks.Signal(Blocks.QC.Blocks(zzz).Start);
   
   Dataset(iii).Mean(zzz) = (sum(Blocks.Signal(Blocks.QC.Blocks(zzz).Start:Blocks.QC.Blocks(zzz).End)))/(Blocks.QC.Blocks(zzz).End-Blocks.QC.Blocks(zzz).Start);
   
%    plot(Blocks.Raw_Signal(Blocks.QC.Blocks(zzz).Start:Blocks.QC.Blocks(zzz).End))
   Dataset(iii).Label(zzz) = Blocks.QC.Blocks(zzz).Pain;
   Dataset(iii).Time(zzz) = Blocks.QC.Blocks(zzz).PainTime;
   end
     
     
     %% normalizing features
     lim = find([Dataset(iii).Time] > 300)
     star = find([Dataset(iii).Time] > 180)
     
     normS = mean(Dataset(iii).Systolic(star(1):lim(1)));
     normD = mean(Dataset(iii).Diastolic(star(1):lim(1)));
     normM = mean(Dataset(iii).Mean(star(1):lim(1)));
%      plot(Dataset.Systolic)
     Dataset(iii).Systolic = Dataset(iii).Systolic/normS;
     Dataset(iii).Diastolic = Dataset(iii).Diastolic/normD;
     Dataset(iii).Mean = Dataset(iii).Mean/normM;
     
     
     
     
     
     
     end
end
%% 

   


end

  save(strcat('CNAP_Dataset.mat'),'Dataset');

