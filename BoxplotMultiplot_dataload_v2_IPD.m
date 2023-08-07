% clear all

% blacklist = [3 21]
% blacklist = [36 27 45 33];
blacklist = [ 4 5 7 8 12 13 14 21 26 27 32 39 40 41 42 45 43 46 50 51]

old = [1 14 32 51 9 43 13 18 20 31 41 48 4 25 28 36 44 45]
men = [10 12 16 19 22 30 37 38 5 8 17 24 27 40 50 13 18 20 31 41 48 1 14 32 51] 

% load('IPD_Dataset.mat')
load('IPD_Dataset_lim0_2.mat')
Def = []
Bas =[]
Mea = []
Grp =[]
Def0 = []
Bas0 =[]
Mea0 = []
Grp0 = []
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
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
        Baseline(iii).pain = Dataset(iii).Baseline(painful)'
        Baseline(iii).nopain = Dataset(iii).Baseline(nopain)'
        
%         Mean(iii).pain = Dataset(iii).Mean(painful)'
%         Mean(iii).nopain = Dataset(iii).Mean(nopain)'
   
    if length(Deflection(iii).pain)
    Bas = [Bas median(Baseline(iii).pain)];
    Def = [Def median(Deflection(iii).pain)];
%     Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end

    Def0 = [Def0 median(Deflection(iii).nopain)];
    Bas0 = [Bas0 median(Baseline(iii).nopain)];
%     Mea0 = [Mea0 median(Mean(iii).nopain)];
    Grp0 = [Grp0 0];
    end
    end
    end
end

% [Bas0',Def0'];
% [Def0',Bas0'];
% [Bas',Def'];
% [Def',Bas'];

DataVecYM0 = [Def0',Bas0'];
GRPYM0 = Grp0;
DataVecYM1 = [Def',Bas'];
GRPYM1 = Grp;
Def = []
Bas =[]
Mea = []

Def0 = []
Bas0 =[]
Mea0 = []


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
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
        Baseline(iii).pain = Dataset(iii).Baseline(painful)'
        Baseline(iii).nopain = Dataset(iii).Baseline(nopain)'
%         
%         Mean(iii).pain = Dataset(iii).Mean(painful)'
%         Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Deflection(iii).pain)
    Bas = [Bas median(Baseline(iii).pain)];
    Def = [Def median(Deflection(iii).pain)];
%     Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    else
        iii
    end

    end
    end
    end
end
DataVecYM20 = [Def',Bas'];
GRPYM20 = Grp*2;
Def = []
Bas =[]
Mea = []
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
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
        Baseline(iii).pain = Dataset(iii).Baseline(painful)'
        Baseline(iii).nopain = Dataset(iii).Baseline(nopain)'
        
%         Mean(iii).pain = Dataset(iii).Mean(painful)'
%         Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Deflection(iii).pain)
    Bas = [Bas median(Baseline(iii).pain)];
    Def = [Def median(Deflection(iii).pain)];
%     Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
    end
end
DataVecYM50 = [Def',Bas'];
GRPYM50 = Grp*3;
Def = []
Bas =[]
Mea = []
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
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
        Baseline(iii).pain = Dataset(iii).Baseline(painful)'
        Baseline(iii).nopain = Dataset(iii).Baseline(nopain)'
        
%         Mean(iii).pain = Dataset(iii).Mean(painful)'
%         Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Deflection(iii).pain)
    Bas = [Bas median(Baseline(iii).pain)];
    Def = [Def median(Deflection(iii).pain)];
%     Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    else
        iii
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    
    Def0 = [Def0 median(Deflection(iii).nopain)];
    Bas0 = [Bas0 median(Baseline(iii).nopain)];
%     Mea0 = [Mea0 median(Mean(iii).nopain)];
    Grp0 = [Grp0 0];
    end
    end
    end
end
DataVecOM0 = [Def0',Bas0'];
GRPOM0 = Grp0;
DataVecOM1 = [Def',Bas'];
GRPOM1 = Grp;
Def = []
Bas =[]
Mea = []
Grp = []

Def0 = []
Bas0 =[]
Mea0 = []
Grp0 = []

%% Seni Vyrai >20
for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    
    if ismember(iii,men)
%     else
        painful = find(Dataset(iii).Label >=20);
        nopain = find(Dataset(iii).Label ==0);
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
        Baseline(iii).pain = Dataset(iii).Baseline(painful)'
        Baseline(iii).nopain = Dataset(iii).Baseline(nopain)'
        
%         Mean(iii).pain = Dataset(iii).Mean(painful)'
%         Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Deflection(iii).pain)
    Bas = [Bas median(Baseline(iii).pain)];
    Def = [Def median(Deflection(iii).pain)];
%     Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
    end
end
DataVecOM20 = [Def',Bas'];
GRPOM20 = Grp*2;
Def = []
Bas =[]
Mea = []
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
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
        Baseline(iii).pain = Dataset(iii).Baseline(painful)'
        Baseline(iii).nopain = Dataset(iii).Baseline(nopain)'
        
%         Mean(iii).pain = Dataset(iii).Mean(painful)'
%         Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Deflection(iii).pain)
    Bas = [Bas median(Baseline(iii).pain)];
    Def = [Def median(Deflection(iii).pain)];
%     Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    else
        iii
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
    end
end
DataVecOM50 = [Def',Bas'];
GRPOM50 = Grp*3;
Def = []
Bas =[]
Mea = []
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
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
        Baseline(iii).pain = Dataset(iii).Baseline(painful)'
        Baseline(iii).nopain = Dataset(iii).Baseline(nopain)'
        
%         Mean(iii).pain = Dataset(iii).Mean(painful)'
%         Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
   if length(Deflection(iii).pain)
    Bas = [Bas median(Baseline(iii).pain)];
    Def = [Def median(Deflection(iii).pain)];
%     Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    
    Def0 = [Def0 median(Deflection(iii).nopain)];
    Bas0 = [Bas0 median(Baseline(iii).nopain)];
%     Mea0 = [Mea0 median(Mean(iii).nopain)];
    Grp0 = [Grp0 0];
    end
    end
    end
end
DataVecYW0 = [Def0',Bas0'];
GRPYW0 = Grp0;

DataVecYW1 = [Def',Bas'];
GRPYW1 = Grp;
Def = []
Bas =[]
Mea = []
Grp = []

Def0 = []
Bas0 =[]
Mea0 = []
Grp0 = []
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
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
        Baseline(iii).pain = Dataset(iii).Baseline(painful)'
        Baseline(iii).nopain = Dataset(iii).Baseline(nopain)'
        
%         Mean(iii).pain = Dataset(iii).Mean(painful)'
%         Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Deflection(iii).pain)
    Bas = [Bas median(Baseline(iii).pain)];
    Def = [Def median(Deflection(iii).pain)];
%     Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
    end
end
DataVecYW20 = [Def',Bas'];
GRPYW20 = Grp*2;
Def = []
Bas =[]
Mea = []
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
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
        Baseline(iii).pain = Dataset(iii).Baseline(painful)'
        Baseline(iii).nopain = Dataset(iii).Baseline(nopain)'
        
%         Mean(iii).pain = Dataset(iii).Mean(painful)'
%         Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Deflection(iii).pain)
    Bas = [Bas median(Baseline(iii).pain)];
    Def = [Def median(Deflection(iii).pain)];
%     Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
    end
end
DataVecYW50 = [Def',Bas'];
GRPYW50 = Grp*3;
Def = []
Bas =[]
Mea = []
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
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
        Baseline(iii).pain = Dataset(iii).Baseline(painful)'
        Baseline(iii).nopain = Dataset(iii).Baseline(nopain)'
        
%         Mean(iii).pain = Dataset(iii).Mean(painful)'
%         Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Deflection(iii).pain)
    Bas = [Bas median(Baseline(iii).pain)];
    Def = [Def median(Deflection(iii).pain)];
%     Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    
    Def0 = [Def0 median(Deflection(iii).nopain)];
    Bas0 = [Bas0 median(Baseline(iii).nopain)];
%     Mea0 = [Mea0 median(Mean(iii).nopain)];
    Grp0 = [Grp0 0];
    end
    end
    end
end
DataVecOW0 = [Def0',Bas0'];
GRPOW0 = Grp0;
DataVecOW1 = [Def',Bas'];
GRPOW1 = Grp;
Def = []
Bas =[]
Mea = []
Grp = []

Def0 = []
Bas0 =[]
Mea0 = []
Grp0 = []

%% Seni Moterys >20
for iii =1:51
    if ismember(iii,blacklist)
    else
    if ismember(iii,old)
    
    if ismember(iii,men)
    else
        painful = find(Dataset(iii).Label >=20);
        nopain = find(Dataset(iii).Label ==0);
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
        Baseline(iii).pain = Dataset(iii).Baseline(painful)'
        Baseline(iii).nopain = Dataset(iii).Baseline(nopain)'
        
%         Mean(iii).pain = Dataset(iii).Mean(painful)'
%         Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Deflection(iii).pain)
    Bas = [Bas median(Baseline(iii).pain)];
    Def = [Def median(Deflection(iii).pain)];
%     Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
    end
end
DataVecOW20 = [Def',Bas'];
GRPOW20 = Grp*2;
Def = []
Bas =[]
Mea = []
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
        
        Deflection(iii).pain = Dataset(iii).Deflection(painful)'
        Deflection(iii).nopain = Dataset(iii).Deflection(nopain)'
        
        Baseline(iii).pain = Dataset(iii).Baseline(painful)'
        Baseline(iii).nopain = Dataset(iii).Baseline(nopain)'
        
%         Mean(iii).pain = Dataset(iii).Mean(painful)'
%         Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Deflection(iii).pain)
    Bas = [Bas median(Baseline(iii).pain)];
    Def = [Def median(Deflection(iii).pain)];
%     Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
    end
end
DataVecOW50 = [Def',Bas'];
GRPOW50 = Grp*3;
Def = []
Bas =[]
Mea = []
Grp = []

