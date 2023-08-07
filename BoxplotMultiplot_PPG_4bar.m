clear all
close all
clc
blacklist = [3 21]
old = [1 14 32 51 9 43 13 18 20 31 41 48 4 25 28 36 44 45]
load('PPG_Dataset.mat')
Def = []
Bas =[]
Grp =[]
for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    else
        painful = find(Dataset(iii).Label >=1);
        nopain = find(Dataset(iii).Label ==0);
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(Deflection(iii).pain)
    Def = [Def Deflection(iii).pain];
%     Bas = [Bas Baseline(iii).pain];
    Grp = [Grp ones(1,length(Deflection(iii).pain))];
    end
    Def = [Def Deflection(iii).nopain];
%     Bas = [Bas Baseline(iii).nopain];
    Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
end
 
DataVec2 = [Def;Bas];

ylim_org = [0 3;-2 2; -0.2 0.2; 0 300; 200 800]
ylim_norm = [0.4 0.6; 0.4 0.6; 0 0.2; 0 1; 0.4 0.9]
Titles = {'Deflection','Baseline'}
ylabels = {'Normalized amplitude with',' respect to baseline'}
sz = [0.005, 0.01]
ylims = [0.6 1.3]

figure
for yyy =1:1
subplot(1,2,yyy)

boxplot(DataVec2(yyy,:),Grp,'positions', 1:2)
hold on

a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
box1 = a(6);   % The 7th object is the first box
box2 = a(5);   % The 7th object is the first box
set(box1, 'Color', 'black');   % Set the color of the first box to green
set(box2, 'Color', 'red');   % Set the color of the first box to green
% for zzz =1:14
% set(a(zzz), 'Color', 'red');
% end
h = findobj(gca,'Tag','Median');
clear Med
for iii =0:1
    Med(iii+1,:) = h(2-iii).YData;
end
Med(:,2) =[]
plot([1:2],Med,'black')
lim1 = find(Grp == 1);
lim0 = find(Grp == 0);
[countsy,binsy] = hist(rmoutliers(DataVec2(yyy,lim0),'quartiles'),11);
barhMy(countsy/max(countsy),binsy,-0.25,1,'black',sz(yyy))

[countsy2,binsy2] = hist(rmoutliers(DataVec2(yyy,lim1),'quartiles'),11);
barhMy(countsy2/max(countsy),binsy2,-0.25,1,'red',sz(yyy))

xlim([-0.25 2.5])
% yticks('black')
set(gca,'YColor','black');
% countsx,binsx] = hist(NPRS);
% ylim(ylim_norm(yyy,:))

title(Titles(yyy))
ylim(ylims(yyy,:))
ylabel(ylabels)
if iii ==3
xlabel('NPRS')
end
end
xlabel('Pain presence')

box off
Def = []
Bas =[]
Grp =[]
for iii =1:51
    if ismember(iii,blacklist)
    else
        if ismember(iii,old)
    
        painful = find(Dataset(iii).Label >=1);
        nopain = find(Dataset(iii).Label ==0);
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(Deflection(iii).pain)
    Def = [Def Deflection(iii).pain];
%     Bas = [Bas Baseline(iii).pain];
    Grp = [Grp ones(1,length(Deflection(iii).pain))];
    end
    Def = [Def Deflection(iii).nopain];
%     Bas = [Bas Baseline(iii).nopain];
    Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
end

DataVec2 = [Def;Bas];

ylim_org = [0 3;-2 2; -0.2 0.2; 0 300; 200 800]
ylim_norm = [0.4 0.6; 0.4 0.6; 0 0.2; 0 1; 0.4 0.9]
Titles = {'Deflection old','Baseline'}
% ylabels = {'Normalized amplitude','Ohm'}
sz = [0.005, 0.01]

% figure
for yyy =1:1
subplot(1,2,yyy+1)

boxplot(DataVec2(yyy,:),Grp,'positions', 1:2)
hold on

a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
box1 = a(6);   % The 7th object is the first box
box2 = a(5);   % The 7th object is the first box
set(box1, 'Color', 'black');   % Set the color of the first box to green
set(box2, 'Color', 'red');   % Set the color of the first box to green
% for zzz =1:14
% set(a(zzz), 'Color', 'red');
% end
h = findobj(gca,'Tag','Median');
clear Med
for iii =0:1
    Med(iii+1,:) = h(2-iii).YData;
end
Med(:,2) =[]
plot([1:2],Med,'black')
lim1 = find(Grp == 1);
lim0 = find(Grp == 0);
[countsy,binsy] = hist(rmoutliers(DataVec2(yyy,lim0),'quartiles'),11);
barhMy(countsy/max(countsy),binsy,-0.25,1,'black',sz(yyy))

[countsy2,binsy2] = hist(rmoutliers(DataVec2(yyy,lim1),'quartiles'),11);
barhMy(countsy2/max(countsy),binsy2,-0.25,1,'red',sz(yyy))

xlim([-0.25 2.5])
% yticks('black')
set(gca,'YColor','black');
% countsx,binsx] = hist(NPRS);
% ylim(ylim_norm(yyy,:))

title(Titles(yyy))
ylim(ylims(yyy,:))
% ylabel(ylabels)
if iii ==3
xlabel('NPRS')
end
end
box off
xlabel('Pain presence')
% set(gcf,'Position',[962    42   958   954])
set(gcf,'Position',[939   239   958   184])
exportgraphics(gcf,'PPG 4bar demo.emf','ContentType','vector');
