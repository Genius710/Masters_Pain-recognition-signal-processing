 clear all
close all
clc
n=2
% ppg
% blacklist = [ 3 6 8 9 11 15 18 21 29 31 33 34 35 39 40 42 44 46 47 49 ]
blacklist = [45 48 50 51]
% imped_
% blacklist = [ 1 2 4 5 6 7 8 10 11 12 13 14 18 21 23 26 27 28 29 30 32 35 36 39 40 43 46 50 51]


for iii = 1:n
     if ismember(iii,blacklist)
     else
        
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
A(iii)= load(strcat('C:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'PPG_Ear_IR_Final_Struct.mat'))
     end
end

% for iii = s:n
%     for yyy = 1:8
%         for xxx =1: length(BlockCNAP(iii,yyy).Signal(:,1))
%         if (BlockCNAP(iii,yyy).Signal(xxx,:) == zeros(1,104))
%             BlockCNAP(iii,yyy).Signal(xxx,:) = nan;
%         end
%         end
%     end
% end

% for iii = s:n
%     for yyy = 1:8
%     
%     if ismember(iii,IPDBlacklist)
%     else
%         if ~isempty(BlockIPD(iii,yyy).Signal)
%             F(iii).Block(yyy).Imp_magnitude(:)  = BlockIPD(iii,yyy).Signal(:,1)';
%             F(iii).Block(yyy).Imp_deflection    = max(BlockIPD(iii,yyy).Signal(:,1:100)')-BlockIPD(iii,yyy).Signal(:,1)';
%         end
%     end
%     if ismember(iii,PPGFIRBlacklist)
%     else
%     F(iii).Block(yyy).Ppg_deflection    = max(BlockPPG(iii,yyy).Signal(:,1:100)')-BlockPPG(iii,yyy).Signal(:,1)';
%     end
%     F(iii).Block(yyy).BP_sys            = max(BlockCNAP(iii,yyy).Signal(:,1:100)');
%     F(iii).Block(yyy).BP_dia            = BlockCNAP(iii,yyy).Signal(:,1)'
%     end
% end

for iii = s:n
    for yyy = 1:8
%         if ismember(iii,IPDBlacklist)
%         Data(iii,yyy).Imp_magnitude.Median = nan
%         Data(iii,yyy).Imp_magnitude.Quantile25 = nan
%         Data(iii,yyy).Imp_magnitude.Quantile75 = nan
%         
%         Data(iii,yyy).Imp_deflection.Median = nan
%         Data(iii,yyy).Imp_deflection.Quantile25 =nan
%         Data(iii,yyy).Imp_deflection.Quantile75 = nan
%         
%         else
%         Data(iii,yyy).Imp_magnitude.Median = median(F(iii).Block(yyy).Imp_magnitude,'omitnan')
%         Data(iii,yyy).Imp_magnitude.Quantile25 =quantile(F(iii).Block(yyy).Imp_magnitude,0.25)
%         Data(iii,yyy).Imp_magnitude.Quantile75 = quantile(F(iii).Block(yyy).Imp_magnitude,0.75)
%         
%         Data(iii,yyy).Imp_deflection.Median = median(F(iii).Block(yyy).Imp_deflection,'omitnan')
%         Data(iii,yyy).Imp_deflection.Quantile25 =quantile(F(iii).Block(yyy).Imp_deflection,0.25)
%         Data(iii,yyy).Imp_deflection.Quantile75 = quantile(F(iii).Block(yyy).Imp_deflection,0.75)
%         end
        if ismember(iii,PPGFIRBlacklist)
        Data(iii,yyy).Ppg_deflection.Median = nan
        Data(iii,yyy).Ppg_deflection.Quantile25 =nan
        Data(iii,yyy).Ppg_deflection.Quantile75 = nan
        else
        Data(iii,yyy).Ppg_deflection.Median = median(F(iii).Block(yyy).Ppg_deflection,'omitnan')
        Data(iii,yyy).Ppg_deflection.Quantile25 =quantile(F(iii).Block(yyy).Ppg_deflection,0.25)
        Data(iii,yyy).Ppg_deflection.Quantile75 = quantile(F(iii).Block(yyy).Ppg_deflection,0.75)
        end
        
%         Data(iii,yyy).BP_sys.Median = median(F(iii).Block(yyy).BP_sys,'omitnan')
%         Data(iii,yyy).BP_sys.Quantile25 =quantile(F(iii).Block(yyy).BP_sys,0.25)
%         Data(iii,yyy).BP_sys.Quantile75 = quantile(F(iii).Block(yyy).BP_sys,0.75)
%         
%         Data(iii,yyy).BP_dia.Median = median(F(iii).Block(yyy).BP_dia,'omitnan')
%         Data(iii,yyy).BP_dia.Quantile25 =quantile(F(iii).Block(yyy).BP_dia,0.25)
%         Data(iii,yyy).BP_dia.Quantile75 = quantile(F(iii).Block(yyy).BP_dia,0.75)
    end
end
