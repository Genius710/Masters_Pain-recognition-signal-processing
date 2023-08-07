%  clear all
% close all
% clc
%  for sss = 1:51
s = 1
n = 51


blacklist = [45 48 50 51]

% for iii = s:n
%      if ismember(iii,blacklist)
%      else
%         
%     if iii< 10
%         num = strcat('0',string(iii));
%     else
%     num = string(iii);
%     end
% A(iii)= load(strcat('C:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'PPG_Ear_IR_Final_Struct.mat'))
%      A(iii).Blocks.Diff =[];
%      A(iii).Blocks.Normalized = [];
%      end
% end
% 
% % for iii =1:8
% % 
% % BlockPPG(iii).Signal = zeros(1,104)
% % 
% % end
% 
% for iii =s : n
%     
%     if ismember(iii,blacklist)
%     else
%         signal = A(iii).Blocks.Signal-mean(A(iii).Blocks.Signal);
%         count1 =1
% count2 =1
% count3 = 1
% count4 = 1
% count5 = 1
% count6 =1
% count7 =1
% count8 =1
%     for yyy =1:length(A(iii).Blocks.QC.Blocks)
%     
% 
%         if A(iii).Blocks.QC.Blocks(yyy).PainTime < A(iii).Blocks.PhaseTime.WarmWater.Start % baseline
% 
%             Container(iii,1,count1).Ppg_deflection = -signal(round(A(iii).Blocks.QC.Blocks(yyy).Start)) + signal(round(A(iii).Blocks.QC.Blocks(yyy).Max)); 
%             count1 = count1+1;
%         elseif A(iii).Blocks.QC.Blocks(yyy).PainTime < A(iii).Blocks.PhaseTime.ColdWater7C.Start %warm water
%             Container(iii,2,count2).Ppg_deflection = -signal(round(A(iii).Blocks.QC.Blocks(yyy).Start)) + signal(round(A(iii).Blocks.QC.Blocks(yyy).Max));
%             count2 = count2+1;
%         elseif A(iii).Blocks.QC.Blocks(yyy).PainTime < A(iii).Blocks.PhaseTime.ColdWater7C.End % cold water 7c
%             Container(iii,3,count3).Ppg_deflection = -signal(round(A(iii).Blocks.QC.Blocks(yyy).Start)) + signal(round(A(iii).Blocks.QC.Blocks(yyy).Max));
%             count3 = count3+1;
%         elseif A(iii).Blocks.QC.Blocks(yyy).PainTime < A(iii).Blocks.PhaseTime.ColdWater10C.Start % recovery1
%             Container(iii,4,count4).Ppg_deflection = -signal(round(A(iii).Blocks.QC.Blocks(yyy).Start)) + signal(round(A(iii).Blocks.QC.Blocks(yyy).Max));
%             count4 = count4+1;
%         elseif A(iii).Blocks.QC.Blocks(yyy).PainTime < A(iii).Blocks.PhaseTime.ColdWater10C.End % cold water 10c
%             Container(iii,5,count5).Ppg_deflection = -signal(round(A(iii).Blocks.QC.Blocks(yyy).Start)) + signal(round(A(iii).Blocks.QC.Blocks(yyy).Max));
%             count5 = count5+1;
%         elseif A(iii).Blocks.QC.Blocks(yyy).PainTime < A(iii).Blocks.PhaseTime.DeepBreathing.Start % recovery 2
%             Container(iii,6,count6).Ppg_deflection = -signal(round(A(iii).Blocks.QC.Blocks(yyy).Start)) + signal(round(A(iii).Blocks.QC.Blocks(yyy).Max));
%             count6 = count6+1;
%         elseif A(iii).Blocks.QC.Blocks(yyy).PainTime < A(iii).Blocks.PhaseTime.DeepBreathing.End % deep breathing
%             Container(iii,7,count7).Ppg_deflection = -signal(round(A(iii).Blocks.QC.Blocks(yyy).Start)) + signal(round(A(iii).Blocks.QC.Blocks(yyy).Max));
%             count7 = count7+1;
%         else
%             Container(iii,8,count8).Ppg_deflection = -signal(round(A(iii).Blocks.QC.Blocks(yyy).Start)) + signal(round(A(iii).Blocks.QC.Blocks(yyy).Max));
%             count8 = count8+1;
%         end
%     end
%     
%     end
% end

load('AndriusDataNan2.mat')

for iii=s:n
for yyy =1:8
%     Data(iii,yyy).Ppg_deflection = []
%     Data(iii,yyy).Ppg_deflection.Median = quantile([Container(iii,yyy,:).Ppg_deflection],0.5)
%     Data(iii,yyy).Ppg_deflection.Quantile25 = quantile([Container(iii,yyy,:).Ppg_deflection],0.25)
%     Data(iii,yyy).Ppg_deflection.quantile75 = quantile([Container(iii,yyy,:).Ppg_deflection],0.75)
     if ismember(iii,blacklist)
        Data(iii,yyy).Ppg_deflection.Median = nan
        Data(iii,yyy).Ppg_deflection.Quantile25 =nan
        Data(iii,yyy).Ppg_deflection.Quantile75 = nan
        else
        Data(iii,yyy).Ppg_deflection.Median = median([Container(iii,yyy,:).Ppg_deflection],'omitnan')
        Data(iii,yyy).Ppg_deflection.Quantile25 =quantile([Container(iii,yyy,:).Ppg_deflection],0.25)
        Data(iii,yyy).Ppg_deflection.Quantile75 = quantile([Container(iii,yyy,:).Ppg_deflection],0.75)
        end
end
end
