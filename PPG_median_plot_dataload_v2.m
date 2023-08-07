close all
clear all

blacklist = [3 21]
old = [1 14 32 51 9 43 13 18 20 31 41 48 4 25 28 36 44 45]
men = [10 12 16 19 22 30 37 38 5 8 17 24 27 40 50 13 18 20 31 41 48 1 14 32 51] 

load('PPG_Dataset.mat')
Def = []
Bas =[]
Grp =[]
Def0 = []
Grp0 =[]
Deflection.value =[]
Deflection.label = []
%% boxplots all points
for yyy = 0:100
    
for iii =1:51
    if ismember(iii,blacklist)
    else
%     if ismember(iii,old)
%     else
%     if ismember(iii,men)
%     else
        
        indexes = find(Dataset(iii).Label ==yyy);
        
        Deflection.value = [Deflection.value   Dataset(iii).Deflection(indexes)'];
        Deflection.label = [Deflection.label   yyy* ones(1,length(indexes))];
        
        
%     Def = [Def median(Deflection(iii).pain)];
%     Grp = [Grp 1];

%     end
%     end
    end
end

end
figure
boxplot(Deflection.value,Deflection.label)


Deflection.value =[]
Deflection.label = []
%% boxplots medians
for yyy = 0:100
    
for iii =1:51
    if ismember(iii,blacklist)
    else
%     if ismember(iii,old)
%     else
%     if ismember(iii,men)
%     else
        
        indexes = find(Dataset(iii).Label ==yyy);
        
        Deflection.value = [Deflection.value   median(Dataset(iii).Deflection(indexes)')];
        Deflection.label = [Deflection.label   yyy];
        
        
%     Def = [Def median(Deflection(iii).pain)];
%     Grp = [Grp 1];

%     end
%     end
    end
end

end
figure
boxplot(Deflection.value,Deflection.label)



Def = []
Grp = []
Num = []
%% line medians old
for yyy = 0:100

Deflection.value =[]
Deflection.label = []
Deflection.number = []

for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
%     else
%     if ismember(iii,men)
%     else       
        indexes = find(Dataset(iii).Label ==yyy);  
        Deflection.number = [Deflection.number length(indexes)];
        Deflection.value = [Deflection.value   median(Dataset(iii).Deflection(indexes)')];
        Deflection.label = [Deflection.label   yyy];
    end
%     end
    end
end
Deflection.value(isnan(Deflection.value)) =[]
Deflection.label(isnan(Deflection.label)) =[]
Num = [Num sum(Deflection.number)]
Def = [Def median(Deflection.value)]
Grp = [Grp yyy]
end
NumYM = Num;
figure
plot(Grp,Def)
hold on

%% young
Grp = []
Def = []
Num = []
for yyy = 0:100

Deflection.value =[]
Deflection.label = []
Deflection.number = []

for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    else
%     if ismember(iii,men)
%     else       
        indexes = find(Dataset(iii).Label ==yyy);  
        Deflection.number = [Deflection.number length(indexes)];
        Deflection.value = [Deflection.value   median(Dataset(iii).Deflection(indexes)')];
        Deflection.label = [Deflection.label   yyy];
    end
    end
%     end
end
Deflection.value(isnan(Deflection.value)) =[]
Deflection.label(isnan(Deflection.label)) =[]
% Deflection.label(isnan(Deflection.label)) =[]
Num = [Num sum(Deflection.number)]
Def = [Def median(Deflection.value)]
Grp = [Grp yyy]
end
NumOM = Num;
plot(Grp,Def)


%% men
Grp = []
Def = []
Num = []
for yyy = 0:100

Deflection.value =[]
Deflection.label = []
Deflection.number = []

for iii =1:51
    if ismember(iii,blacklist)
    else
%     if ismember(iii,old)
%     else
    if ismember(iii,men)
    else       
        indexes = find(Dataset(iii).Label ==yyy); 
        Deflection.number = [Deflection.number length(indexes)];
        Deflection.value = [Deflection.value   median(Dataset(iii).Deflection(indexes)')];
        Deflection.label = [Deflection.label   yyy];
    end
%     end
    end
end
Deflection.value(isnan(Deflection.value)) =[]
Deflection.label(isnan(Deflection.label)) =[]
Num = [Num sum(Deflection.number)]
Def = [Def median(Deflection.value)]
Grp = [Grp yyy]
end
NumYW = Num;
plot(Grp,Def)



%% women
Grp = []
Def = []
Num = []
for yyy = 0:100

Deflection.value =[]
Deflection.label = []
Deflection.number = []

for iii =1:51
    if ismember(iii,blacklist)
    else
%     if ismember(iii,old)
%     else
    if ismember(iii,men)
    else       
        indexes = find(Dataset(iii).Label ==yyy);  
        Deflection.number = [Deflection.number length(indexes)];
        Deflection.value = [Deflection.value   median(Dataset(iii).Deflection(indexes)')];
        Deflection.label = [Deflection.label   yyy];
    end
    end
%     end
end
Deflection.value(isnan(Deflection.value)) =[]
Deflection.label(isnan(Deflection.label)) =[]
Num = [Num sum(Deflection.number)]
Def = [Def median(Deflection.value)]
Grp = [Grp yyy]
end
NumOW = Num;
plot(Grp,Def)

figure
hold on

plot(0:100,NumYM)
plot(0:100,NumOM)
plot(0:100,NumYW)
plot(0:100,NumOW)

plot(0:100,sum([NumYM;NumOM;NumYW;NumOW]),'--')

legend({'Young Men','Old Men','Young Women','Old Women','All'},'Location','eastoutside')

ylim([0 1000])
xlabel('NPRS')
ylabel('Count')









