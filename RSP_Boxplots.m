clear all
close all
clc
load('RSP_Hist_blocksV2.mat')
load('RSP_Blocks_Ev1.mat')
NPRSData = []
MaxData = []
MinData = []
VolumeData = []

NormMaxData = []
NormMinData = []
NormVolumeData = []
ACData =[]
NormACData= []
for iii =1:51
    NPRSData = [NPRSData;E(iii).RSP.NPRS']; 
end

for iii =1:11
%     NPRSData = [NPRS;Block(iii).NPRS(:)]; 
ACData = [ACData;Block(iii).ACB(:)];
VolumeData =[VolumeData;Block(iii).VolumeB(:)];

NormACData = [NormACData;Block(iii).NormACB(:)];
NormVolumeData =[NormVolumeData;Block(iii).NormVolumeB(:)];
end

Group = [zeros(1,length(Block(1).ACB))];
for iii =2:11
Group =[Group ones(1,length(Block(iii).ACB))*(iii-1)];
end
DataVec = [ACData';VolumeData'];
Titles = {'AC', 'Volume'}
ylabels = {'V','Vs'}



DataVec2 = [NormACData';NormVolumeData'];



figure
for yyy =1:2
subplot(3,1,yyy)
yyaxis left
boxplot(DataVec(yyy,:),Group)
hold on
h = findobj(gca,'Tag','Median');
clear Med
for iii =0:10
    Med(iii+1,:) = h(11-iii).YData;
end
Med(:,2) =[]
plot(1:11,Med)



title(Titles(yyy))
xlabel('NPRS')
ylabel(ylabels(yyy))
clear Med
if yyy ==1
    ylim([0 2])
    [countsy,binsy] = hist(rmoutliers(ACData,'quartiles'),11);
%     barh(binsy,countsy/max(countsy))
    barhMy(countsy/max(countsy),binsy,-0.5,1,'blue',max(binsy)/30)
    
end
if yyy == 2
    ylim([0 600])
    [countsy,binsy] = hist(rmoutliers(VolumeData,'quartiles'),11);
%     barh(binsy,countsy/max(countsy))
    barhMy(countsy/max(countsy),binsy,-0.5,1,'blue',max(binsy)/30)
end

yyaxis right
boxplot(DataVec2(yyy,:),Group,'positions', 1.5:11.5)
hold on

a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
box1 = a(23:33);   % The 7th object is the first box
set(box1, 'Color', 'black');   % Set the color of the first box to green

h = findobj(gca,'Tag','Median');
clear Med
for iii =0:10
    Med(iii+1,:) = h(11-iii).YData;
end
Med(:,2) =[]
plot([1:11]+0.5,Med,'black')
% [countsy,binsy] = hist(DataVec2(yyy,:));
% barh(binsy,countsy/max(countsy))
 xlim([0.5 12])
% yticks('black')
set(gca,'YColor','black');
% countsx,binsx] = hist(NPRS);
if yyy ==1
    ylim([0 6])
    [countsy,binsy] = hist(rmoutliers(NormACData,'quartiles'));
    barhMy(countsy/max(countsy),binsy,13,0,'red',0.1)

end
if yyy == 2
    ylim([0 8])
    [countsy,binsy] = hist(rmoutliers(NormVolumeData,'quartiles'));
     barhMy(countsy/max(countsy),binsy,13,0,'red',0.1)

end
xlim([-0.5 13])
end

[countsx,binsx] = hist(NPRSData,11);
 countsx(1) = countsx(1) ;
 binsx = 0:10;
 
subplot(3,1,3)
b = bar(binsx,countsx)
title('Pain levels')
ylim([0 countsx(2)*2])
xlabel('NPRS')
ylabel('Count')

xtips2 = b(1).XEndPoints;
ytips2 = b(1).YEndPoints;
labels2 = string(b(1).YData);
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')

