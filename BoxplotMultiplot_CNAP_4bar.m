clear all
close all
clc
% blacklist = [ 4 5 7 8 12 13 14 21 26 27 32 39 40 41 42 45 43 46 50 51]
old = [1 14 32 51 9 43 13 18 20 31 41 48 4 25 28 36 44 45]
blacklist = [36 27 45 33];

load('CNAP_Dataset.mat')
Sys = []
Dia =[]
Mea = []
Grp =[]
for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    else
        painful = find(Dataset(iii).Label >=1);
        nopain = find(Dataset(iii).Label ==0);
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)
        
        Mean(iii).pain = Dataset(iii).Mean(painful)
        Mean(iii).nopain = Dataset(iii).Mean(nopain)
    
    if length(Mean(iii).pain)
    Sys = [Sys Systolic(iii).pain];
    Dia = [Dia Diastolic(iii).pain];
    Mea = [Mea Mean(iii).pain];
    Grp = [Grp ones(1,length(Mean(iii).pain))];
    end
    Sys = [Sys Systolic(iii).nopain];
    Dia = [Dia Diastolic(iii).nopain];
    Mea = [Mea Mean(iii).nopain];
    Grp = [Grp zeros(1,length(Mean(iii).nopain))];
    end
    end
end

DataVec2 = [Sys;Dia;Mea];

ylim_org = [0 3;-2 2; -0.2 0.2; 0 300; 200 800]
ylim_norm = [0.4 0.6; 0.4 0.6; 0 0.2; 0 1; 0.4 0.9]
Titles = {'SystolicBP','DiastolicBP','MeanBP'}
ylabels = {'Normalized amplitude with',' respect to baseline'}
sz = [0.01, 0.01,0.01]
ylims = [0.5 1.5;0.6 1.6; 0.6 1.6]
figure
for yyy =1:3
subplot(2,3,yyy)

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

% ylabel(ylabels(yyy))
if yyy ==1
ylabel(ylabels)
end
if iii ==3
xlabel('NPRS')
end
box off
end


% xlabel('Pain presence')

% 
Sys = []
Dia =[]
Mea = []
Grp =[]
for iii =1:51
    if ismember(iii,blacklist)
    else
        
    if ismember(iii,old)
    
        painful = find(Dataset(iii).Label >=1);
        nopain = find(Dataset(iii).Label ==0);
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)
        
        Mean(iii).pain = Dataset(iii).Mean(painful)
        Mean(iii).nopain = Dataset(iii).Mean(nopain)
    
    if length(Mean(iii).pain)
    Sys = [Sys Systolic(iii).pain];
    Dia = [Dia Diastolic(iii).pain];
    Mea = [Mea Mean(iii).pain];
    Grp = [Grp ones(1,length(Mean(iii).pain))];
    end
    Sys = [Sys Systolic(iii).nopain];
    Dia = [Dia Diastolic(iii).nopain];
    Mea = [Mea Mean(iii).nopain];
    Grp = [Grp zeros(1,length(Mean(iii).nopain))];
    end
end
end

DataVec2 = [Sys;Dia;Mea];

ylim_org = [0 3;-2 2; -0.2 0.2; 0 300; 200 800]
ylim_norm = [0.4 0.6; 0.4 0.6; 0 0.2; 0 1; 0.4 0.9]
Titles = {'SystolicBP old','DiastolicBP old','MeanBP old'}
% ylabels = {'mmHg','mmHg','mmHg'}
sz = [0.01, 0.01,0.01]

% figure
for yyy =1:3
subplot(2,3,yyy+3)

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
if yyy ==1
ylabel(ylabels)
end
if iii ==3
xlabel('NPRS')
end
xlabel('Pain presence')
box off
end


set(gcf,'Position',[939   239   958   448])
exportgraphics(gcf,'CNAP 4bar demo.emf','ContentType','vector');
