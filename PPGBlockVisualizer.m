 clear all
close all
clc
%  for sss = 1:51
s = 10
n = s
% PPGFIRBlacklist = [ 3 8 9 11 15 21 29 31 33 34 35 39 40 42 46 49 ]
for iii = s:n
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
% A(iii) = load(strcat('Data/Aurimod',num,'BioImpedBlockECG1_v1.mat'));
% A(iii) = load(strcat('Data/Aurimod',num,'PPGBlockECGXC_Lim1.mat'));
 A(iii) = load(strcat('Data/Aurimod',num,'CNAPBlockV2.mat'));
B(iii) = load(strcat('C:\OneDrive - Kaunas University of Technology\Aurimod2019_BMI\05_Data\Final\Aurimod',num,'\Aurimod',num,'.mat'));
C(iii).PhaseTime = B(iii).PhaseTime;
clear B
end

for iii =1:4
Block(iii).Signal = zeros(1,100)
end
count1 =1

count2 =1
for iii =s : n
    count1 =1
%     if ismember(iii,PPGFIRBlacklist)
%     else
        
    for yyy =1:length(A(iii).NPRST)
    
        
%     Block(iii).Signal(count1,:) = A(iii).Input(yyy,1:100); 
%             count1 = count1+1;
        if A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.Start
            Block(1).Signal(count1,:) = A(iii).Input(yyy,1:100); 
            count1 = count1+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.End
            Block(2).Signal(count2,:) = A(iii).Input(yyy,1:100);
            count2 = count2+1;
        end
    
    end
    
end

for iii = s:n
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
% A(iii) = load(strcat('Data/Aurimod',num,'BioImpedBlockECG1_v1.mat'));
A(iii) = load(strcat('Data/Aurimod',num,'PPGBlockECGXC_Lim1.mat'));
%  A(iii) = load(strcat('Data/Aurimod',num,'CNAPBlockV2.mat'));
B(iii) = load(strcat('C:\OneDrive - Kaunas University of Technology\Aurimod2019_BMI\05_Data\Final\Aurimod',num,'\Aurimod',num,'.mat'));
C(iii).PhaseTime = B(iii).PhaseTime;
clear B
end

% for iii =1:10
% Block(iii).Signal = zeros(1,100)
% end
count1 =1

count2 =1
for iii =s : n
    count1 =1
%     if ismember(iii,PPGFIRBlacklist)
%     else
        
    for yyy =1:length(A(iii).NPRST)
    
        
%     Block(iii).Signal(count1,:) = A(iii).Input(yyy,1:100); 
%             count1 = count1+1;
        if A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.Start
            Block(3).Signal(count1,:) = A(iii).Input(yyy,1:100); 
            count1 = count1+1;
        elseif A(iii).NPRST(yyy) < C(iii).PhaseTime.ColdWater7C.End
            Block(4).Signal(count2,:) = A(iii).Input(yyy,1:100);
            count2 = count2+1;
        end
    
    end
    
end
% for yyy=s:n
% for iii =0:9
%     quan(yyy,iii+1,:) = quantile(Block(yyy).Signal,0.1*iii)
% end
% end
% 
% % figure(1)
% for iii =s:n
%     figure(iii)
% %     subplot(2,1,iii)
%     for yyy =1:10
%         var =quan(iii,yyy,:)
%         plot(squeeze(var))
%         hold on
%     end
% end

% end
figure
subplot(1,2,1)

plot(median(Block(1).Signal))
title('CNAP')
% title('Rest1')
hold on
plot(median(Block(2).Signal))
% title('ColdWater7C')
ylabel('Amplitude')
xlabel('Normalized signal datapoints')
subplot(1,2,2)

plot(median(Block(3).Signal))
title('PPG')
% title('Rest1')
hold on
plot(median(Block(4).Signal))
% ylabel('Amplitude')
xlabel('Normalized signal datapoints')
% title('ColdWater7C')
set(gcf,'Units','centimeters','Position',[1 1 14 4])
exportgraphics(gcf,'Standard signals.emf','ContentType','vector')
