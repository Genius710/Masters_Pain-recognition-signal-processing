clear all
close all
clc
blacklist = [ 4 5 7 8 12 13 14 21 26 27 32 39 40 41 42 45 43 46 50 51]

load('IPD_Dataset_lim0_2.mat')
Def = []
Bas =[]
Grp =[]
for iii =1:51
    if ismember(iii,blacklist)
    else
        painful = find(Dataset(iii).Label >=1);
        nopain = find(Dataset(iii).Label ==0);
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)
        
        Baseline(iii).pain = Dataset(iii).Baseline(painful)
        Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(Deflection(iii).pain)
    Def = [Def Deflection(iii).pain];
    Bas = [Bas Baseline(iii).pain];
    Grp = [Grp ones(1,length(Deflection(iii).pain))];
    end
    Def = [Def Deflection(iii).nopain];
    Bas = [Bas Baseline(iii).nopain];
    Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
end

DataVec2 = [Def;Bas];

ylim_org = [0 3;-2 2; -0.2 0.2; 0 300; 200 800]
ylim_norm = [0.4 0.6; 0.4 0.6; 0 0.2; 0 1; 0.4 0.9]
Titles = {'Deflection','Baseline'}
ylabels = {'Normalized amplitude with',' respect to baseline'}
sz = [0.05, 0.0025]
ylims = [0 2;0.9 1.1]

figure
for yyy =1:2
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
box off
title(Titles(yyy))
if yyy ==1
ylabel(ylabels)
end
ylim(ylims(yyy,:))
if iii ==3
xlabel('NPRS')
end
xlabel('Pain presence')
end



% 
% 
% Def = []
% Bas =[]
% Grp =[]
% for iii =1:51
%     if ismember(iii,blacklist)
%     else
%         painful = find(Dataset(iii).Label >=20);
%         nopain = find(Dataset(iii).Label ==0);
%         
%         Deflection(iii).pain = Dataset(iii).Deflection(painful)
%         Deflection(iii).nopain = Dataset(iii).Deflection(nopain)
%         
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
%     
%     if length(Deflection(iii).pain)
%     Def = [Def Deflection(iii).pain];
%     Bas = [Bas Baseline(iii).pain];
%     Grp = [Grp ones(1,length(Deflection(iii).pain))];
%     end
%     Def = [Def Deflection(iii).nopain];
%     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
%     end
% end
% 
% DataVec2 = [Def;Bas];
% 
% ylim_org = [0 3;-2 2; -0.2 0.2; 0 300; 200 800]
% ylim_norm = [0.4 0.6; 0.4 0.6; 0 0.2; 0 1; 0.4 0.9]
% Titles = {'Deflection_lim20','Baseline_lim20'}
% ylabels = {'Ohm','Ohm'}
% sz = [0.005, 0.001]

% figure
% for yyy =1:2
% subplot(2,2,yyy+2)
% 
% boxplot(DataVec2(yyy,:),Grp,'positions', 1:2)
% hold on
% 
% a = get(get(gca,'children'),'children');   % Get the handles of all the objects
% t = get(a,'tag');   % List the names of all the objects 
% box1 = a(6);   % The 7th object is the first box
% box2 = a(5);   % The 7th object is the first box
% set(box1, 'Color', 'black');   % Set the color of the first box to green
% set(box2, 'Color', 'red');   % Set the color of the first box to green
% % for zzz =1:14
% % set(a(zzz), 'Color', 'red');
% % end
% h = findobj(gca,'Tag','Median');
% clear Med
% for iii =0:1
%     Med(iii+1,:) = h(2-iii).YData;
% end
% Med(:,2) =[]
% plot([1:2],Med,'black')
% lim1 = find(Grp == 1);
% lim0 = find(Grp == 0);
% [countsy,binsy] = hist(rmoutliers(DataVec2(yyy,lim0),'quartiles'),11);
% barhMy(countsy/max(countsy),binsy,-0.25,1,'black',sz(yyy))
% 
% [countsy2,binsy2] = hist(rmoutliers(DataVec2(yyy,lim1),'quartiles'),11);
% barhMy(countsy2/max(countsy),binsy2,-0.25,1,'red',sz(yyy))
% 
% xlim([-0.25 2.5])
% % yticks('black')
% set(gca,'YColor','black');
% % countsx,binsx] = hist(NPRS);
% % ylim(ylim_norm(yyy,:))
% 
% title(Titles(yyy))
% 
% ylabel(ylabels(yyy))
% ylim(ylims(yyy,:))
% if iii ==3
% xlabel('NPRS')
% end
% end
% set(gcf,'Position',[962    42   958   954])
set(gcf,'Position',[939   239   958   184])
exportgraphics(gcf,'IPD 2bar demo.emf','ContentType','vector');