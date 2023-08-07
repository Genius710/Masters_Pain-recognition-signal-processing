 clear all
close all
clc
%  for sss = 1:51
s = 1
n = 51

PPGFIRBlacklist = [3 21]
% PPGFIRBlacklist = [ 3 6 8 9 11 15 18 21 29 31 33 34 35 39 40 42 44 46 47 49 ]
% blacklist = []
% imped_
IPDBlacklist = []
% IPDBlacklist = [ 1 2 4 5 6 7 8 10 11 12 13 14 18 21 23 26 27 28 29 30 32 35 36 39 40 43 46 50 51]
for iii = s:n
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
% A(iii) = load(strcat('Data/Aurimod',num,'BioImpedBlockECG1_v1.mat'));
% A(iii) = load(strcat('Data/Aurimod',num,'PPGBlockECGXC_Lim1.mat'));
%  A(iii) = load(strcat('Data/Aurimod',num,'CNAPBlockV2.mat'));
B(iii) = load(strcat('C:\OneDrive - Kaunas University of Technology\Aurimod2019_BMI\05_Data\Final\Aurimod',num,'\Aurimod',num,'.mat'));
C(iii).PhaseTime = B(iii).PhaseTime;
clear B
end

for iii =1:8
% BlockCNAP(iii).Signal = zeros(1,100)
BlockPPG(iii).Signal = zeros(1,500)
% BlockIPD(iii).Signal = zeros(1,100)
end

count1 =1
count2 =1
count3 = 1
count4 = 1
count5 = 1
count6 =1
count7 =1
count8 =1
% for iii =s : n
%     count1 =1
% %     if ismember(iii,PPGFIRBlacklist)
% %     else
%         
%     for yyy =1:length(A(iii).NPRST)
%     
%         
%         if A(iii).NPRST(yyy) < C(iii).PhaseTime.WarmWater.Start % baseline
%             BlockCNAP(1).Signal(count1,:) = A(iii).Input(yyy,1:100); 
%             count1 = count1+1;
%         elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.Start %warm water
%             BlockCNAP(2).Signal(count2,:) = A(iii).Input(yyy,1:100); 
%             count2 = count2+1;
%         elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.End % cold water 7c
%             BlockCNAP(3).Signal(count3,:) = A(iii).Input(yyy,1:100);
%             count3 = count3+1;
%         elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater10C.Start % recovery1
%             BlockCNAP(4).Signal(count4,:) = A(iii).Input(yyy,1:100);
%             count4 = count4+1;
%         elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater10C.End % cold water 10c
%             BlockCNAP(5).Signal(count5,:) = A(iii).Input(yyy,1:100);
%             count5 = count5+1;
%         elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.DeepBreathing.Start % recovery 2
%             BlockCNAP(6).Signal(count6,:) = A(iii).Input(yyy,1:100);
%             count6 = count6+1;
%         elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.DeepBreathing.End % deep breathing
%             BlockCNAP(7).Signal(count7,:) = A(iii).Input(yyy,1:100);
%             count7 = count7+1;
%         else
%             BlockCNAP(8).Signal(count8,:) = A(iii).Input(yyy,1:100);
%             count8 = count8+1;
%         end
%     
%     end
%     
% end

for iii = s:n
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
if ismember(iii,PPGFIRBlacklist)
    else
% A(iii) = load(strcat('Data/Aurimod',num,'PPGBlockECGXC_Lim1.mat'));
%  A(iii) = load(strcat('Data/Aurimod',num,'PPGBlockECG1.mat'));
 load(strcat('Feature_DataBlock_',num,'_multi_1.mat'));
A(iii).Signal = DataBlock.CombinedSignal(:,1001:1500);
A(iii).NPRST = DataBlock.Time;
 clear B
end
end
% for iii =s:n
% A(iii).NPRST =A(iii).NPRST./10
% end
% for iii =1:10
% Block(iii).Signal = zeros(1,100)
% end
count1 =1
count2 =1
count3 = 1
count4 = 1
count5 = 1
count6 =1
count7 =1
count8 =1
for iii =s : n
    count1 =1
    if ismember(iii,PPGFIRBlacklist)
    else
        
    for yyy =1:length(A(iii).NPRST)
    
        
%     Block(iii).Signal(count1,:) = A(iii).Input(yyy,1:100); 
%             count1 = count1+1;
        if A(iii).NPRST(yyy) < C(iii).PhaseTime.WarmWater.Start % baseline
            BlockPPG(1).Signal(count1,:) = A(iii).Signal(yyy,:); 
            count1 = count1+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.Start %warm water
            BlockPPG(2).Signal(count2,:) = A(iii).Signal(yyy,:); 
            count2 = count2+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.End % cold water 7c
            BlockPPG(3).Signal(count3,:) = A(iii).Signal(yyy,:);
            count3 = count3+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater10C.Start % recovery1
            BlockPPG(4).Signal(count4,:) = A(iii).Signal(yyy,:);
            count4 = count4+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater10C.End % cold water 10c
            BlockPPG(5).Signal(count5,:) = A(iii).Signal(yyy,:);
            count5 = count5+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.DeepBreathing.Start % recovery 2
            BlockPPG(6).Signal(count6,:) = A(iii).Signal(yyy,:);
            count6 = count6+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.DeepBreathing.End % deep breathing
            BlockPPG(7).Signal(count7,:) = A(iii).Signal(yyy,:);
            count7 = count7+1;
        else
            BlockPPG(8).Signal(count8,:) = A(iii).Signal(yyy,:);
            count8 = count8+1;
        end
    end
    
    end
end

% for iii = s:n
%     if iii< 10
%         num = strcat('0',string(iii));
%     else
%     num = string(iii);
%     end
% % A(iii) = load(strcat('Data/Aurimod',num,'BioImpedBlockECG1_v1.mat'));
% % A(iii) = load(strcat('Data/Aurimod',num,'IPD_normalized_xc_1,5_v1.mat'));
% A(iii) = load(strcat('Data/Aurimod',num,'IPD_ECG_normalized_v1'));
% 
% clear B
% end
% for iii =s:n
% A(iii).NPRST =A(iii).NPRST./10
% end
% % for iii =1:10
% % Block(iii).Signal = zeros(1,100)
% % end
% count1 =1
% count2 =1
% count3 = 1
% count4 = 1
% count5 = 1
% count6 =1
% count7 =1
% count8 =1
% for iii =s : n
%     count1 =1
%     if ismember(iii,IPDBlacklist)
%     else
%         
%     for yyy =1:length(A(iii).NPRST)
%     
%         
% %     Block(iii).Signal(count1,:) = A(iii).Input(yyy,1:100); 
% %             count1 = count1+1;
%         if A(iii).NPRST(yyy) < C(iii).PhaseTime.WarmWater.Start % baseline
%             BlockIPD(1).Signal(count1,:) = A(iii).Input(yyy,1:100); 
%             count1 = count1+1;
%         elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.Start %warm water
%             BlockIPD(2).Signal(count2,:) = A(iii).Input(yyy,1:100); 
%             count2 = count2+1;
%         elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.End % cold water 7c
%             BlockIPD(3).Signal(count3,:) = A(iii).Input(yyy,1:100);
%             count3 = count3+1;
%         elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater10C.Start % recovery1
%             BlockIPD(4).Signal(count4,:) = A(iii).Input(yyy,1:100);
%             count4 = count4+1;
%         elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater10C.End % cold water 10c
%             BlockIPD(5).Signal(count5,:) = A(iii).Input(yyy,1:100);
%             count5 = count5+1;
%         elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.DeepBreathing.Start % recovery 2
%             BlockIPD(6).Signal(count6,:) = A(iii).Input(yyy,1:100);
%             count6 = count6+1;
%         elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.DeepBreathing.End % deep breathing
%             BlockIPD(7).Signal(count7,:) = A(iii).Input(yyy,1:100);
%             count7 = count7+1;
%         else
%             BlockIPD(8).Signal(count8,:) = A(iii).Input(yyy,1:100);
%             count8 = count8+1;
%         end
%     
%     end
%     end
%     
% end

% end

ylabels = {'Rest1','WarmWater','ColdWater7C','Rest2','ColdWater10C','Rest3','DeepBreathing','Rest4'}
% figure
% for iii =0:7
% % subplot(8,3,iii*3+1)
% subplot(8,1,iii+1)
% 
% plot(median(BlockCNAP(iii+1).Signal))
% hold on
% plot(quantile(BlockCNAP(iii+1).Signal,0.25))
% plot(quantile(BlockCNAP(iii+1).Signal,0.75))
% if iii == 4
%     ylabel('Normalized amplitude')
% end
% yyaxis right
% ylabel(ylabels(iii+1))
% yticks([])
% % if iii == 4
% %     ylabel('Normalized amplitude')
% % end
% if iii == 0
%     title('Blood pressure')
% end
% if iii == 7
%     xlabel('Normalized signal datapoints')
% end
% 
% % subplot(8,3,iii*3+2)
% % plot(median(BlockPPG(iii+1).Signal))
% % hold on
% % plot(quantile(BlockPPG(iii+1).Signal,0.25))
% % plot(quantile(BlockPPG(iii+1).Signal,0.75))
% % 
% % if iii == 4
% %     ylabel('Normalized amplitude')
% % end
% % if iii == 0
% %     title('Finger PPG')
% % end
% % if iii == 7
% %     xlabel('Normalized signal datapoints')
% % end
% % 
% % subplot(8,3,iii*3+3)
% % plot(median(BlockIPD(iii+1).Signal))
% % hold on
% % plot(quantile(BlockIPD(iii+1).Signal,0.25))
% % plot(quantile(BlockIPD(iii+1).Signal,0.75))
% % if iii == 4
% %     ylabel('Normalized amplitude')
% % end
% % 
% % if iii == 0
% %     title('Ear impedance magnitude')
% % end
% % if iii == 7
% %     xlabel('Normalized signal datapoints')
% % end
% 
% end
% legend({'Median','25% quantile','75% quantile'})

figure
for iii =0:7

subplot(2,4,iii+1)
plot(median(BlockPPG(iii+1).Signal))
hold on
plot(quantile(BlockPPG(iii+1).Signal,0.25))
plot(quantile(BlockPPG(iii+1).Signal,0.75))
plot([0 500],[0 0],'Color','k','LineStyle','--')
if iii == 4 || iii == 0
    ylabel('Normalized amplitude')
end
% ylim([0 1.2])
% yyaxis right
% ylabel(ylabels(iii+1))
title(ylabels(iii+1))
% yticks([])
xlim([0 500])

if iii >=4
    xlabel('Normalized signal datapoints')
end

end
legend({'Median','25% quantile','75% quantile'})

% figure
% for iii =0:7
% % subplot(8,3,iii*3+1)
% % 
% % plot(median(BlockCNAP(iii+1).Signal))
% % hold on
% % plot(quantile(BlockCNAP(iii+1).Signal,0.25))
% % plot(quantile(BlockCNAP(iii+1).Signal,0.75))
% % if iii == 4
% %     ylabel('Normalized amplitude')
% % end
% % if iii == 0
% %     title('Blood pressure')
% % end
% % if iii == 7
% %     xlabel('Normalized signal datapoints')
% % end
% % 
% % subplot(8,3,iii*3+2)
% % plot(median(BlockPPG(iii+1).Signal))
% % hold on
% % plot(quantile(BlockPPG(iii+1).Signal,0.25))
% % plot(quantile(BlockPPG(iii+1).Signal,0.75))
% % 
% % if iii == 4
% %     ylabel('Normalized amplitude')
% % end
% % if iii == 0
% %     title('Finger PPG')
% % end
% % if iii == 7
% %     xlabel('Normalized signal datapoints')
% % end
% 
% % subplot(8,3,iii*3+3)
% subplot(8,1,iii+1)
% plot(median(BlockIPD(iii+1).Signal))
% hold on
% plot(quantile(BlockIPD(iii+1).Signal,0.25))
% plot(quantile(BlockIPD(iii+1).Signal,0.75))
% if iii == 4
%     ylabel('Normalized amplitude')
% end
% yyaxis right
% ylabel(ylabels(iii+1))
% yticks([])
% % if iii == 4
% %     ylabel('Normalized amplitude')
% % end
% 
% if iii == 0
%     title('Ear impedance magnitude')
% end
% if iii == 7
%     xlabel('Normalized signal datapoints')
% end
% 
% end
% legend({'Median','25% quantile','75% quantile'})

% figure
% for iii =0:7
% subplot(8,3,iii*3+1)
% 
% plot(median(BlockCNAP(iii+1).Signal))
% hold on
% plot(quantile(BlockCNAP(iii+1).Signal,0.25))
% plot(quantile(BlockCNAP(iii+1).Signal,0.75))
% if iii == 4
%     ylabel('Normalized amplitude')
% end
% if iii == 0
%     title('Blood pressure')
% end
% if iii == 7
%     xlabel('Normalized signal datapoints')
% end
% 
% subplot(8,3,iii*3+2)
% plot(median(BlockPPG(iii+1).Signal))
% hold on
% plot(quantile(BlockPPG(iii+1).Signal,0.25))
% plot(quantile(BlockPPG(iii+1).Signal,0.75))
% 
% if iii == 4
%     ylabel('Normalized amplitude')
% end
% if iii == 0
%     title('Finger IR PPG')
% end
% if iii == 7
%     xlabel('Normalized signal datapoints')
% end
% 
% subplot(8,3,iii*3+3)
% % subplot(8,1,iii+1)
% plot(median(BlockIPD(iii+1).Signal))
% hold on
% plot(quantile(BlockIPD(iii+1).Signal,0.25))
% plot(quantile(BlockIPD(iii+1).Signal,0.75))
% if iii == 4
%     ylabel('Normalized amplitude')
% end
% yyaxis right
% ylabel(ylabels(iii+1))
% yticks([])
% % if iii == 4
% %     ylabel('Normalized amplitude')
% % end
% 
% if iii == 0
%     title('Ear impedance magnitude')
% end
% if iii == 7
%     xlabel('Normalized signal datapoints')
% end
% 
% end
% legend({'Median','25% quantile','75% quantile'})

% exportgraphics(figure(1),'CNAP v21 signal shapes.emf','ContentType','vector')
% exportgraphics(figure(2),'PPG v21 signal shapes.emf','ContentType','vector')
% exportgraphics(figure(3),'IPD v21 signal shapes.emf','ContentType','vector')

% set(gcf,'Units','centimeters','Position',[1 1 14 4])
% exportgraphics(gcf,'Standard signals.emf','ContentType','vector')
