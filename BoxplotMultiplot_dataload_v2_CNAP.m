% clear all

% blacklist = [3 21]
blacklist = [36 27 45 33];

old = [1 14 32 51 9 43 13 18 20 31 41 48 4 25 28 36 44 45]
men = [10 12 16 19 22 30 37 38 5 8 17 24 27 40 50 13 18 20 31 41 48 1 14 32 51] 

load('CNAP_Dataset.mat')
Dia = []
Sys =[]
Mea = []
Grp =[]
Dia0 = []
Sys0 =[]
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
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)'
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)'
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)'
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)'
        
        Mean(iii).pain = Dataset(iii).Mean(painful)'
        Mean(iii).nopain = Dataset(iii).Mean(nopain)'
   
    if length(Systolic(iii).pain)
    Sys = [Sys median(Systolic(iii).pain)];
    Dia = [Dia median(Diastolic(iii).pain)];
    Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end

    Sys0 = [Sys0 median(Systolic(iii).nopain)];
    Dia0 = [Dia0 median(Diastolic(iii).nopain)];
    Mea0 = [Mea0 median(Mean(iii).nopain)];
    Grp0 = [Grp0 0];
    end
    end
    end
end

DataVecYM0 = [Sys0',Dia0',Mea0'];
GRPYM0 = Grp0;
DataVecYM1 = [Sys',Dia',Mea'];
GRPYM1 = Grp;
Dia = []
Sys =[]
Mea = []

Dia0 = []
Sys0 =[]
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
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)'
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)'
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)'
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)'
        
        Mean(iii).pain = Dataset(iii).Mean(painful)'
        Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Systolic(iii).pain)
    Sys = [Sys median(Systolic(iii).pain)];
    Dia = [Dia median(Diastolic(iii).pain)];
    Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    else
        iii
    end

    end
    end
    end
end
DataVecYM20 = [Sys',Dia',Mea'];
GRPYM20 = Grp*2;
Dia = []
Sys =[]
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
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)'
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)'
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)'
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)'
        
        Mean(iii).pain = Dataset(iii).Mean(painful)'
        Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Systolic(iii).pain)
    Sys = [Sys median(Systolic(iii).pain)];
    Dia = [Dia median(Diastolic(iii).pain)];
    Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
    end
end
DataVecYM50 = [Sys',Dia',Mea'];
GRPYM50 = Grp*3;
Dia = []
Sys =[]
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
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)'
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)'
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)'
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)'
        
        Mean(iii).pain = Dataset(iii).Mean(painful)'
        Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Systolic(iii).pain)
    Sys = [Sys median(Systolic(iii).pain)];
    Dia = [Dia median(Diastolic(iii).pain)];
    Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    else
        iii
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    
    Sys0 = [Sys0 median(Systolic(iii).nopain)];
    Dia0 = [Dia0 median(Diastolic(iii).nopain)];
    Mea0 = [Mea0 median(Mean(iii).nopain)];
    Grp0 = [Grp0 0];
    end
    end
    end
end
DataVecOM0 = [Sys0',Dia0',Mea0'];
GRPOM0 = Grp0;
DataVecOM1 = [Sys',Dia',Mea'];
GRPOM1 = Grp;
Dia = []
Sys =[]
Mea = []
Grp = []

Dia0 = []
Sys0 =[]
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
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)'
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)'
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)'
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)'
        
        Mean(iii).pain = Dataset(iii).Mean(painful)'
        Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Systolic(iii).pain)
    Sys = [Sys median(Systolic(iii).pain)];
    Dia = [Dia median(Diastolic(iii).pain)];
    Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
    end
end
DataVecOM20 = [Sys',Dia',Mea'];
GRPOM20 = Grp*2;
Dia = []
Sys =[]
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
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)'
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)'
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)'
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)'
        
        Mean(iii).pain = Dataset(iii).Mean(painful)'
        Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Systolic(iii).pain)
    Sys = [Sys median(Systolic(iii).pain)];
    Dia = [Dia median(Diastolic(iii).pain)];
    Mea = [Mea median(Mean(iii).pain)];
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
DataVecOM50 = [Sys',Dia',Mea'];
GRPOM50 = Grp*3;
Dia = []
Sys =[]
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
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)'
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)'
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)'
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)'
        
        Mean(iii).pain = Dataset(iii).Mean(painful)'
        Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
   if length(Systolic(iii).pain)
    Sys = [Sys median(Systolic(iii).pain)];
    Dia = [Dia median(Diastolic(iii).pain)];
    Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    
    Sys0 = [Sys0 median(Systolic(iii).nopain)];
    Dia0 = [Dia0 median(Diastolic(iii).nopain)];
    Mea0 = [Mea0 median(Mean(iii).nopain)];
    Grp0 = [Grp0 0];
    end
    end
    end
end
DataVecYW0 = [Sys0',Dia0',Mea0'];
GRPYW0 = Grp0;

DataVecYW1 = [Sys',Dia',Mea'];
GRPYW1 = Grp;
Dia = []
Sys =[]
Mea = []
Grp = []

Dia0 = []
Sys0 =[]
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
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)'
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)'
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)'
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)'
        
        Mean(iii).pain = Dataset(iii).Mean(painful)'
        Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Systolic(iii).pain)
    Sys = [Sys median(Systolic(iii).pain)];
    Dia = [Dia median(Diastolic(iii).pain)];
    Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
    end
end
DataVecYW20 = [Sys',Dia',Mea'];
GRPYW20 = Grp*2;
Dia = []
Sys =[]
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
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)'
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)'
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)'
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)'
        
        Mean(iii).pain = Dataset(iii).Mean(painful)'
        Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Systolic(iii).pain)
    Sys = [Sys median(Systolic(iii).pain)];
    Dia = [Dia median(Diastolic(iii).pain)];
    Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
    end
end
DataVecYW50 = [Sys',Dia',Mea'];
GRPYW50 = Grp*3;
Dia = []
Sys =[]
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
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)'
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)'
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)'
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)'
        
        Mean(iii).pain = Dataset(iii).Mean(painful)'
        Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Systolic(iii).pain)
    Sys = [Sys median(Systolic(iii).pain)];
    Dia = [Dia median(Diastolic(iii).pain)];
    Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    
    Sys0 = [Sys0 median(Systolic(iii).nopain)];
    Dia0 = [Dia0 median(Diastolic(iii).nopain)];
    Mea0 = [Mea0 median(Mean(iii).nopain)];
    Grp0 = [Grp0 0];
    end
    end
    end
end
DataVecOW0 = [Sys0',Dia0',Mea0'];
GRPOW0 = Grp0;
DataVecOW1 = [Sys',Dia',Mea'];
GRPOW1 = Grp;
Dia = []
Sys =[]
Mea = []
Grp = []

Dia0 = []
Sys0 =[]
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
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)'
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)'
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)'
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)'
        
        Mean(iii).pain = Dataset(iii).Mean(painful)'
        Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Systolic(iii).pain)
    Sys = [Sys median(Systolic(iii).pain)];
    Dia = [Dia median(Diastolic(iii).pain)];
    Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
    end
end
DataVecOW20 = [Sys',Dia',Mea'];
GRPOW20 = Grp*2;
Dia = []
Sys =[]
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
        
        Systolic(iii).pain = Dataset(iii).Systolic(painful)'
        Systolic(iii).nopain = Dataset(iii).Systolic(nopain)'
        
        Diastolic(iii).pain = Dataset(iii).Diastolic(painful)'
        Diastolic(iii).nopain = Dataset(iii).Diastolic(nopain)'
        
        Mean(iii).pain = Dataset(iii).Mean(painful)'
        Mean(iii).nopain = Dataset(iii).Mean(nopain)'
    
    if length(Systolic(iii).pain)
    Sys = [Sys median(Systolic(iii).pain)];
    Dia = [Dia median(Diastolic(iii).pain)];
    Mea = [Mea median(Mean(iii).pain)];
    Grp = [Grp 1];
    end
%     Def = [Def Deflection(iii).nopain];
% %     Bas = [Bas Baseline(iii).nopain];
%     Grp = [Grp zeros(1,length(Deflection(iii).nopain))];
    end
    end
    end
end
DataVecOW50 = [Sys',Dia',Mea'];
GRPOW50 = Grp*3;
Dia = []
Sys =[]
Mea = []
Grp = []

