clear all
close all
clc
% load('CNAP_Hist_blocksORG2.mat')
load('CNAP_Hist_blocks_REST1_CPT1.mat')
% load('PPG_Hist_blocks_FIR_ORG_Lim1.mat')
SysData = []
DiaData = []
MeanData = []
RiseData =[]
FallData =[]


for iii =1:11
SysData = [SysData;Block(iii).SysB(:)];

DiaData = [DiaData;Block(iii).DiaB(:)];
MeanData = [MeanData;Block(iii).MeanB(:)];
RiseData =[RiseData;Block(iii).RiseB(:)];
FallData =[FallData;Block(iii).FallB(:)];
end
RiseData = RiseData*10; %to ms
FallData = FallData*10; %to ms
Group = [zeros(1,length(Block(1).SysB))];
for iii =2:11
Group =[Group ones(1,length(Block(iii).SysB))*(iii-1)];
end
DataVec = [SysData';DiaData';MeanData';RiseData';FallData'];
% DataVec = [SysData';DiaData';RiseData';FallData'];
Titles = {'Systolic BP', 'Diastolic BP', 'MeanBP','Systole Time','Diastole Time'}
ylabels ={'mmHg','mmHg','mmHg','ms','ms'}


clear Block
load('CNAP_Hist_blocksM1.mat')
% load('PPG_Hist_blocks_FIR_Lim1.mat')
NormSysData = []
NormDiaData = []
NormMeanData = []
NormRiseData =[]
NormFallData =[]

for iii =1:11
NormSysData = [NormSysData;Block(iii).SysB(:)];
NormDiaData = [NormDiaData;Block(iii).DiaB(:)];
NormMeanData = [NormMeanData;Block(iii).MeanB(:)];
NormRiseData =[NormRiseData;Block(iii).RiseB(:)];
NormFallData =[NormFallData;Block(iii).FallB(:)];
end
% MeanData = [MeanData;Block(iii).MeanB(:)./(max(];%% reikia sutvarkytu
% clear Group
Group2 = [zeros(1,length(Block(1).SysB))];
for iii =2:11
Group2 =[Group2 ones(1,length(Block(iii).SysB))*(iii-1)];
end
% clear DataVec
DataVec2 = [NormSysData';NormDiaData';NormMeanData';NormRiseData';NormFallData'];
% DataVec2 = [NormSysData';NormDiaData';NormRiseData';NormFallData'];
% clear Med
% DataVec = [];
% DataVec3 = [SysData';NormSysData';DiaData';NormDiaData';MeanData';NormMeanData';RiseData';NormRiseData';FallData';NormFallData'];



figure
for yyy =1:5
subplot(6,1,yyy)
yyaxis left
boxplot(DataVec(yyy,:),Group-0.5)
hold on
h = findobj(gca,'Tag','Median');
clear Med
for iii =0:10
    Med(iii+1,:) = h(11-iii).YData;
end
Med(:,2) =[]
plot(1:11,Med)

[countsy,binsy] = hist(rmoutliers(DataVec(yyy,:),'quartiles'),11);
barhMy(countsy/max(countsy),binsy,-0.5,1,'blue',max(binsy)/30)

title(Titles(yyy))
% xlabel('NPRS')
ylabel(ylabels(yyy))
clear Med
if yyy ==4
    ylim([0 250])
end
if yyy == 5
    ylim([0 2000])
end

yyaxis right
boxplot(DataVec2(yyy,:),Group2+0.5,'positions', 1.5:11.5)
hold on

a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
box1 = a(23:33);   % The 7th object is the first box
set(box1, 'Color', [0.1 0.1 0.1]);   % Set the color of the first box to green

h = findobj(gca,'Tag','Median');
clear Med
for iii =0:10
    Med(iii+1,:) = h(11-iii).YData;
end
Med(:,2) =[]
plot([1:11]+0.5,Med,'Color',[0.1 0.1 0.1])
[countsy,binsy] = hist(rmoutliers(DataVec2(yyy,:),'quartiles'),11);
barhMy(countsy/max(countsy),binsy,13,0,'black',max(binsy)/30)
xlim([-0.5 13])
% yticks('black')
set(gca,'YColor',[0.1 0.1 0.1]);
% countsx,binsx] = hist(NPRS);


end

[countsx,binsx] = hist(NPRS,11);
 countsx(1) = countsx(1) ;
 binsx = 0:10;
 
subplot(6,1,6)
b = bar(binsx,countsx)
title('Pain levels')
ylim([0 countsx(2)*2])
xlabel('NPRS')
ylabel('Count')
xlim([-0.5 13]-1)

xtips2 = b(1).XEndPoints;
ytips2 = b(1).YEndPoints;
labels2 = string(b(1).YData);
% labels2(1) = ' ';
ytips2(1) = ytips2(2);
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')

