blacklist = []
old = [1 14 32 51 9 43 13 18 20 31 41 48 4 25 28 36 44 45]
men = [10 12 16 19 22 30 37 38 5 8 17 24 27 40 50 13 18 20 31 41 48 1 14 32 51] 

load('HR_Dataset.mat')
Def = []
Bas =[]
Grp =[]
Def0 = []
Grp0 =[]
%% Jauni Vyrai >1
for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    else
    if ismember(iii,men)
%     else
        painful = find(Dataset(iii).Label >=1);
        nopain = find(Dataset(iii).Label ==0);
        
        HR(iii).pain = Dataset(iii).HR(painful)'
        HR(iii).nopain = Dataset(iii).HR(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(HR(iii).pain)
    Def = [Def median(HR(iii).pain)];
%     Def = [Def HR(iii).pain];
%     Bas = [Bas Baseline(iii).pain];
%     Grp = [Grp ones(1,length(HR(iii).pain))];
Grp = [Grp 1];
    end
%     Def = [Def HR(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(HR(iii).nopain))];
    
    Def0 = [Def0 median(HR(iii).nopain)];
    Grp0 = [Grp0 0];
    end
    end
    end
end
DataVecYM0 = Def0;
GRPYM0 = Grp0;
DataVecYM1 = [Def];
GRPYM1 = Grp;
Def =[]
Grp = []
%% Jauni Vyrai >20
for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    else
    if ismember(iii,men)
%     else
        painful = find(Dataset(iii).Label >=20);
        nopain = find(Dataset(iii).Label ==0);
        
        HR(iii).pain = Dataset(iii).HR(painful)'
        HR(iii).nopain = Dataset(iii).HR(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(HR(iii).pain)
%     Def = [Def HR(iii).pain];
Def = [Def median(HR(iii).pain)];
%     Bas = [Bas Baseline(iii).pain];
%     Grp = [Grp ones(1,length(HR(iii).pain))];
Grp = [Grp 1];
    end
%     Def = [Def HR(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(HR(iii).nopain))];
    end
    end
    end
end
DataVecYM20 = [Def];
GRPYM20 = Grp*2;
Def =[]
Grp = []
%% Jauni Vyrai >50
for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    else
    if ismember(iii,men)
%     else
        painful = find(Dataset(iii).Label >=50);
        nopain = find(Dataset(iii).Label ==0);
        
        HR(iii).pain = Dataset(iii).HR(painful)'
        HR(iii).nopain = Dataset(iii).HR(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(HR(iii).pain)
%     Def = [Def HR(iii).pain];
Def = [Def median(HR(iii).pain)];
%     Bas = [Bas Baseline(iii).pain];
%     Grp = [Grp ones(1,length(HR(iii).pain))];
Grp = [Grp 1];
    end
%     Def = [Def HR(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(HR(iii).nopain))];
    end
    end
    end
end
DataVecYM50 = [Def];
GRPYM50 = Grp*3;
Def =[]
Grp = []



%% Seni Vyrai >1
Def0 = []
Grp0 =[]

for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
%     else
    if ismember(iii,men)
%     else
        painful = find(Dataset(iii).Label >=1);
        nopain = find(Dataset(iii).Label ==0);
        
        HR(iii).pain = Dataset(iii).HR(painful)'
        HR(iii).nopain = Dataset(iii).HR(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(HR(iii).pain)
    Def = [Def median(HR(iii).pain)];
%     Def = [Def HR(iii).pain];
%     Bas = [Bas Baseline(iii).pain];
%     Grp = [Grp ones(1,length(HR(iii).pain))];
Grp = [Grp 1];
    end
%     Def = [Def HR(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(HR(iii).nopain))];
    
    Def0 = [Def0 median(HR(iii).nopain)];
    Grp0 = [Grp0 0];
    end
    end
    end
end
DataVecOM0 = Def0;
GRPOM0 = Grp0;
DataVecOM1 = [Def];
GRPOM1 = Grp;
Def =[]
Grp = []

%% Seni Vyrai >20
for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    
    if ismember(iii,men)
%     else
        painful = find(Dataset(iii).Label >=20);
        nopain = find(Dataset(iii).Label ==0);
        
        HR(iii).pain = Dataset(iii).HR(painful)'
        HR(iii).nopain = Dataset(iii).HR(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(HR(iii).pain)
%     Def = [Def HR(iii).pain];
Def = [Def median(HR(iii).pain)];
%     Bas = [Bas Baseline(iii).pain];
%     Grp = [Grp ones(1,length(HR(iii).pain))];
Grp = [Grp 1];
    end
%     Def = [Def HR(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(HR(iii).nopain))];
    end
    end
    end
end
DataVecOM20 = [Def];
GRPOM20 = Grp*2;
Def =[]
Grp = []


%% Seni Vyrai >50
for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    
    if ismember(iii,men)
%     else
        painful = find(Dataset(iii).Label >=50);
        nopain = find(Dataset(iii).Label ==0);
        
        HR(iii).pain = Dataset(iii).HR(painful)'
        HR(iii).nopain = Dataset(iii).HR(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(HR(iii).pain)
%     Def = [Def HR(iii).pain];
Def = [Def median(HR(iii).pain)];
%     Bas = [Bas Baseline(iii).pain];
%     Grp = [Grp ones(1,length(HR(iii).pain))];
Grp = [Grp 1];
    end
%     Def = [Def HR(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(HR(iii).nopain))];
    end
    end
    end
end
DataVecOM50 = [Def];
GRPOM50 = Grp*3;
Def =[]
Grp = []






%% Jauni Moterys >1
Def0 = []
Grp0 =[]

for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    else
    if ismember(iii,men)
    else
        painful = find(Dataset(iii).Label >=1);
        nopain = find(Dataset(iii).Label ==0);
        
        HR(iii).pain = Dataset(iii).HR(painful)'
        HR(iii).nopain = Dataset(iii).HR(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(HR(iii).pain)
    Def = [Def median(HR(iii).pain)];
%     Def = [Def HR(iii).pain];
%     Bas = [Bas Baseline(iii).pain];
%     Grp = [Grp ones(1,length(HR(iii).pain))];
Grp = [Grp 1];
    end
%     Def = [Def HR(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(HR(iii).nopain))];
    
    Def0 = [Def0 median(HR(iii).nopain)];
    Grp0 = [Grp0 0];
    end
    end
    end
end
DataVecYW0 = Def0;
GRPYW0 = Grp0;

DataVecYW1 = [Def];
GRPYW1 = Grp;
Def =[]
Grp = []
%% Jauni Moterys >20
for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    else
    if ismember(iii,men)
    else
%     else
        painful = find(Dataset(iii).Label >=20);
        nopain = find(Dataset(iii).Label ==0);
        
        HR(iii).pain = Dataset(iii).HR(painful)'
        HR(iii).nopain = Dataset(iii).HR(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(HR(iii).pain)
%     Def = [Def HR(iii).pain];
Def = [Def median(HR(iii).pain)];
%     Bas = [Bas Baseline(iii).pain];
%     Grp = [Grp ones(1,length(HR(iii).pain))];
Grp = [Grp 1];
    end
%     Def = [Def HR(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(HR(iii).nopain))];
    end
    end
    end
end
DataVecYW20 = [Def];
GRPYW20 = Grp*2;
Def =[]
Grp = []
%% Jauni Moterys >50
for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    else
    if ismember(iii,men)
    else
        painful = find(Dataset(iii).Label >=50);
        nopain = find(Dataset(iii).Label ==0);
        
        HR(iii).pain = Dataset(iii).HR(painful)'
        HR(iii).nopain = Dataset(iii).HR(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(HR(iii).pain)
%     Def = [Def HR(iii).pain];
Def = [Def median(HR(iii).pain)];
%     Bas = [Bas Baseline(iii).pain];
%     Grp = [Grp ones(1,length(HR(iii).pain))];
Grp = [Grp 1];
    end
%     Def = [Def HR(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(HR(iii).nopain))];
    end
    end
    end
end
DataVecYW50 = [Def];
GRPYW50 = Grp*3;
Def =[]
Grp = []



%% Seni Moterys >1
Def0 = []
Grp0 =[]

for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
%     else
    if ismember(iii,men)
    else
        painful = find(Dataset(iii).Label >=1);
        nopain = find(Dataset(iii).Label ==0);
        
        HR(iii).pain = Dataset(iii).HR(painful)'
        HR(iii).nopain = Dataset(iii).HR(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(HR(iii).pain)
    Def = [Def median(HR(iii).pain)];
%     Def = [Def HR(iii).pain];
%     Bas = [Bas Baseline(iii).pain];
%     Grp = [Grp ones(1,length(HR(iii).pain))];
Grp = [Grp 1];
    end
%     Def = [Def HR(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(HR(iii).nopain))];
    
    Def0 = [Def0 median(HR(iii).nopain)];
    Grp0 = [Grp0 0];
    end
    end
    end
end
DataVecOW0 = Def0;
GRPOW0 = Grp0;
DataVecOW1 = [Def];
GRPOW1 = Grp;
Def =[]
Grp = []

%% Seni Moterys >20
for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    
    if ismember(iii,men)
    else
        painful = find(Dataset(iii).Label >=20);
        nopain = find(Dataset(iii).Label ==0);
        
        HR(iii).pain = Dataset(iii).HR(painful)'
        HR(iii).nopain = Dataset(iii).HR(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(HR(iii).pain)
%     Def = [Def HR(iii).pain];
Def = [Def median(HR(iii).pain)];
%     Bas = [Bas Baseline(iii).pain];
%     Grp = [Grp ones(1,length(HR(iii).pain))];
Grp = [Grp 1];
    end
%     Def = [Def HR(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(HR(iii).nopain))];
    end
    end
    end
end
DataVecOW20 = [Def];
GRPOW20 = Grp*2;
Def =[]
Grp = []


%% Seni Moterys >50
for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    
    if ismember(iii,men)
    else
        painful = find(Dataset(iii).Label >=50);
        nopain = find(Dataset(iii).Label ==0);
        
        HR(iii).pain = Dataset(iii).HR(painful)'
        HR(iii).nopain = Dataset(iii).HR(nopain)'
        
%         Baseline(iii).pain = Dataset(iii).Baseline(painful)
%         Baseline(iii).nopain = Dataset(iii).Baseline(nopain)
    
    if length(HR(iii).pain)
%     Def = [Def HR(iii).pain];
Def = [Def median(HR(iii).pain)];
%     Bas = [Bas Baseline(iii).pain];
%     Grp = [Grp ones(1,length(HR(iii).pain))];
Grp = [Grp 1];
    end
%     Def = [Def HR(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(HR(iii).nopain))];
    end
    end
    end
end
DataVecOW50 = [Def];
GRPOW50 = Grp*3;
Def =[]
Grp = []

