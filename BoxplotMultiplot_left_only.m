clear all
close all
clc
load('CNAP_Hist_blocksORG2.mat')
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


clear Block
load('CNAP_Hist_blocksM1.mat')
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
% clear Med
DataVec = [];
DataVec3 = [SysData';NormSysData';DiaData';NormDiaData';MeanData';NormMeanData';RiseData';NormRiseData';FallData';NormFallData'];

lims = [0 300; 0.4 1.2; 0 200; 0 0.8; 0 200; 0.4 1.2; 0 200; 0 0.2;0 1500; 0 1.2]
Titles = {'Systolic BP', 'Diastolic BP', 'MeanBP','Systole Time','Diastole Time'}

ylabels(1,:) ={'Sys BP,';' mmHg'}
ylabels(2,:) ={ 'Norm';' Systolic BP'}
ylabels(3,:) ={ 'Dia BP,';' mmHg'}
ylabels(4,:) ={ 'Norm';' Dia BP'}
ylabels(5,:) ={ 'Mean BP,';' mmHg'}
ylabels(6,:) ={ 'Norm';' Mean BP'}
ylabels(7,:) ={ 'Sys Time,';' ms'}
ylabels(8,:) ={ 'Norm Sys';' Time'}
ylabels(9,:) ={ 'Dia Time,';' ms'}
ylabels(10,:) ={ 'Norm Dia';' Time'}


figure
set(gcf,'Units','centimeters','Position',[1 1 12 25])
for yyy =1:10
subplot(11,1,yyy)
% yyaxis left
if rem(yyy,2) == 1
boxplot(DataVec3(yyy,:),Group)
else
boxplot(DataVec3(yyy,:),Group2)
end
hold on

switch yyy
    case 1
        [countsy,binsy] = hist(rmoutliers(SysData,'quartiles'));
         barh(binsy,countsy/max(countsy))
    case 2
        [countsy,binsy] = hist(rmoutliers(NormSysData,'quartiles'));
         barh(binsy,countsy/max(countsy))
    case 3
        [countsy,binsy] = hist(rmoutliers(DiaData,'quartiles'));
         barh(binsy,countsy/max(countsy))
    case 4
        [countsy,binsy] = hist(rmoutliers(NormDiaData,'quartiles'));
         barh(binsy,countsy/max(countsy))
    case 5
        [countsy,binsy] = hist(rmoutliers(MeanData,'quartiles'));
         barh(binsy,countsy/max(countsy))
    case 6
        [countsy,binsy] = hist(rmoutliers(NormMeanData,'quartiles'));
         barh(binsy,countsy/max(countsy))
    case 7
        [countsy,binsy] = hist(rmoutliers(RiseData,'quartiles'));
         barh(binsy,countsy/max(countsy))
    case 8
        [countsy,binsy] = hist(rmoutliers(NormRiseData,'quartiles'));
         barh(binsy,countsy/max(countsy))
    case 9
        [countsy,binsy] = hist(rmoutliers(FallData,'quartiles'));
         barh(binsy,countsy/max(countsy))
    case 10
        [countsy,binsy] = hist(rmoutliers(NormFallData,'quartiles'));
         barh(binsy,countsy/max(countsy))
end
        

h = findobj(gca,'Tag','Median');
clear Med
for iii =0:10
    Med(iii+1,:) = h(11-iii).YData;
end
Med(:,2) =[]
plot(1:11,Med)

% [countsy,binsy] = hist(DataVec(yyy,:));
% barh(binsy,countsy/max(countsy))

%  title(Titles(yyy))
%  xlabel('NPRS')
  ylabel(ylabels(yyy,:))
clear Med
ylim(lims(yyy,:))
set(gca,'FontSize',8)
% xlim([-0.5 10.5])
% yyaxis right
% boxplot(DataVec2(yyy,:),Group2+0.5,'positions', 1.5:11.5)
% hold on
% 
% a = get(get(gca,'children'),'children');   % Get the handles of all the objects
% t = get(a,'tag');   % List the names of all the objects 
% box1 = a(23:33);   % The 7th object is the first box
% set(box1, 'Color', 'black');   % Set the color of the first box to green
% 
% h = findobj(gca,'Tag','Median');
% clear Med
% for iii =0:10
%     Med(iii+1,:) = h(11-iii).YData;
% end
% Med(:,2) =[]
% plot([1:11]+0.5,Med,'black')
% % [countsy,binsy] = hist(DataVec2(yyy,:));
% % barh(binsy,countsy/max(countsy))
% xlim([0.5 12])
% % yticks('black')
% set(gca,'YColor','black');
% countsx,binsx] = hist(NPRS);


end

[countsx,binsx] = hist(NPRS,11);
 countsx(1) = countsx(1) ;
 binsx = 0:10;
 
subplot(11,1,11)
b = bar(binsx,countsx)
% title('Pain levels')
ylim([0 countsx(2)*2])
xlabel('NPRS')
ylabel({'Pain Levels,';' Count'})
xlim([-0.5 10.5])

xtips2 = b(1).XEndPoints;
ytips2 = b(1).YEndPoints;
labels2 = string(b(1).YData);
labels2(1) = ' ';
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')

set(gcf,'Units','centimeters','Position',[1 1 12 25])
set(gca,'FontSize',8)
savename = strcat('CNAP_Boxplot_Final');
exportgraphics(gcf,strcat(savename,'.png'),'Resolution',600);

crop(strcat(savename,'.png'),0)
