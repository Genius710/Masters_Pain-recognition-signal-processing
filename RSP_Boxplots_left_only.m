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

Titles = {'AC','Normalized AC', 'Volume', ' Normalized Volume'}
ylabels = {'V',' ','Vs',' '}


% DataVec = [ACData';VolumeData'];
% DataVec2 = [NormACData';NormVolumeData'];

DataVec = [ACData';NormACData';VolumeData';NormVolumeData'];

figure
for yyy =1:4
subplot(5,1,yyy)
% yyaxis left
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
    [countsy,binsy] = hist(rmoutliers(ACData,'quartiles'));
    barh(binsy,countsy/max(countsy))
    
%     [countsy,binsy] = hist(rmoutliers(NormACData,'quartiles'));
%     barh(binsy,countsy/max(countsy))
%     ax = gcf
%     ty =  ax.Children(1).Children(1).YData *-1
%     ax.Children(1).Children(1).YData = 12+ty;
%     ax.Children(1).Children(1).BaseValue= 12
    
end
if yyy == 2
    ylim([0 6])
    [countsy,binsy] = hist(rmoutliers(NormACData,'quartiles'));
    barh(binsy,countsy/max(countsy))
end
if yyy == 3
    ylim([0 600])
    [countsy,binsy] = hist(rmoutliers(VolumeData,'quartiles'));
    barh(binsy,countsy/max(countsy))
end
if yyy == 4
    ylim([0 10])
    [countsy,binsy] = hist(rmoutliers(NormVolumeData,'quartiles'));
    barh(binsy,countsy/max(countsy))
end

% yyaxis right
% boxplot(DataVec2(yyy,:),Group,'positions', 1.5:11.5)
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
 xlim([0.5 12])

% set(gca,'YColor','black');


% if yyy ==1
%     ylim([0 6])
%     [countsy,binsy] = hist(rmoutliers(NormACData,'quartiles'));
%     barh(binsy,countsy/max(countsy))
%     ax = gcf
%     ty =  ax.Children(1).Children(2).YData *-1
%     ax.Children(1).Children(2).YData = 12+ty;
%     ax.Children(1).Children(2).BaseValue= 12
% end
% if yyy == 2
%     ylim([0 8])
%     [countsy,binsy] = hist(rmoutliers(NormVolumeData,'quartiles'));
%     barh(binsy,countsy/max(countsy))
%     ax = gcf
%     ty =  ax.Children(1).Children(1).YData *-1
%     ax.Children(1).Children(1).YData = 12+ty;
%     ax.Children(1).Children(1).BaseValue= 12
% end

end

[countsx,binsx] = hist(NPRSData,11);
 countsx(1) = countsx(1) ;
 binsx = 0:10;
 
subplot(5,1,5)
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

set(gcf,'Units','centimeters','Position',[1 1 12 25])
set(gca,'FontSize',8)
savename = strcat('RSP_Boxplot_Final');
exportgraphics(gcf,strcat(savename,'.png'),'Resolution',600);

crop(strcat(savename,'.png'),0)

