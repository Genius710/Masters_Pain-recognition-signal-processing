clear all
close all
clc
BoxplotMultiplot_dataload_v2

%seni
DataVecYM = [DataVecYM0,DataVecYM1,DataVecYM20,DataVecYM50];
GRPYM = [GRPYM0,GRPYM1,GRPYM20,GRPYM50];
% figure
% boxplot(DataVecYM,GRPYM)
%jauni
DataVecOM = [DataVecOM0,DataVecOM1,DataVecOM20,DataVecOM50];
GRPOM = [GRPOM0,GRPOM1,GRPOM20,GRPOM50];
% figure
% boxplot(DataVecYM,GRPYM)

%vyrai
DataVecYW = [DataVecYW0,DataVecYW1,DataVecYW20,DataVecYW50];
GRPYW = [GRPYW0,GRPYW1,GRPYW20,GRPYW50];
% figure
% boxplot(DataVecYW,GRPYW)
%moterys
DataVecOW = [DataVecOW0,DataVecOW1,DataVecOW20,DataVecOW50];
GRPOW = [GRPOW0,GRPOW1,GRPOW20,GRPOW50];
% figure
% boxplot(DataVecOW,GRPOW)

DataVecAll = [DataVecYM,DataVecOM,DataVecYW,DataVecOW]
GRPAll = [GRPYM,GRPOM,GRPYW,GRPOW]





ylim_org = [0 3;-2 2; -0.2 0.2; 0 300; 200 800]
ylim_norm = [0.4 0.6; 0.4 0.6; 0 0.2; 0 1; 0.4 0.9]
Titles = {'Deflection','Baseline'}
ylabels = {'Normalized amplitude with',' respect to baseline'}
sz = [0.005, 0.01]
ylims = [0.6 1.3]






for yyy =1:1

meds(:) =  [median(DataVecYW0(yyy,:)),median(DataVecYW1(yyy,:)),median(DataVecYW20(yyy,:)),median(DataVecYW50(yyy,:)) ]
meds = meds';
clear meds
meds(:) =  [median(DataVecOW0(yyy,:)),median(DataVecOW1(yyy,:)),median(DataVecOW20(yyy,:)),median(DataVecOW50(yyy,:)) ];
meds = meds';
clear meds
meds(:) =  [median(DataVecYM0(yyy,:)),median(DataVecYM1(yyy,:)),median(DataVecYM20(yyy,:)),median(DataVecYM50(yyy,:)) ]
meds = meds';
clear meds
meds(:) =  [median(DataVecOM0(yyy,:)),median(DataVecOM1(yyy,:)),median(DataVecOM20(yyy,:)),median(DataVecOM50(yyy,:)) ];
meds = meds';
clear meds
meds(:) =  [median([DataVecOM0(yyy,:),DataVecYM0(yyy,:),DataVecOW0(yyy,:),DataVecYW0(yyy,:)]),median([DataVecOM1(yyy,:),DataVecYM1(yyy,:),DataVecOW1(yyy,:),DataVecYW1(yyy,:)]),    median([DataVecOM20(yyy,:),DataVecYM20(yyy,:),DataVecOW20(yyy,:),DataVecYW20(yyy,:)]),median([DataVecOM50(yyy,:),DataVecYM50(yyy,:),DataVecOW50(yyy,:),DataVecYW50(yyy,:)]) ];
meds = meds';
clear meds

end



BoxplotMultiplot_dataload_v2_IPD
for ttt =1: 2
%seni
DataVecYM = [DataVecYM0(:,ttt)',DataVecYM1(:,ttt)',DataVecYM20(:,ttt)',DataVecYM50(:,ttt)'];
GRPYM = [GRPYM0,GRPYM1,GRPYM20,GRPYM50];

DataVecOM = [DataVecOM0(:,ttt)',DataVecOM1(:,ttt)',DataVecOM20(:,ttt)',DataVecOM50(:,ttt)'];
GRPOM = [GRPOM0,GRPOM1,GRPOM20,GRPOM50];

DataVecYW = [DataVecYW0(:,ttt)',DataVecYW1(:,ttt)',DataVecYW20(:,ttt)',DataVecYW50(:,ttt)'];
GRPYW = [GRPYW0,GRPYW1,GRPYW20,GRPYW50];

DataVecOW = [DataVecOW0(:,ttt)',DataVecOW1(:,ttt)',DataVecOW20(:,ttt)',DataVecOW50(:,ttt)'];
GRPOW = [GRPOW0,GRPOW1,GRPOW20,GRPOW50];

DataVecAll = [DataVecYM,DataVecOM,DataVecYW,DataVecOW]
GRPAll = [GRPYM,GRPOM,GRPYW,GRPOW]




for yyy =1:1

meds(:) =  [median(DataVecYW0(yyy,:)),median(DataVecYW1(yyy,:)),median(DataVecYW20(yyy,:)),median(DataVecYW50(yyy,:)) ]
meds = meds';
clear meds
meds(:) =  [median(DataVecOW0(yyy,:)),median(DataVecOW1(yyy,:)),median(DataVecOW20(yyy,:)),median(DataVecOW50(yyy,:)) ];
meds = meds';
clear meds
meds(:) =  [median(DataVecYM0(yyy,:)),median(DataVecYM1(yyy,:)),median(DataVecYM20(yyy,:)),median(DataVecYM50(yyy,:)) ]
meds = meds';
clear meds
meds(:) =  [median(DataVecOM0(yyy,:)),median(DataVecOM1(yyy,:)),median(DataVecOM20(yyy,:)),median(DataVecOM50(yyy,:)) ];
meds = meds';
clear meds
meds(:) =  [median([DataVecOM0(yyy,:),DataVecYM0(yyy,:),DataVecOW0(yyy,:),DataVecYW0(yyy,:)]),median([DataVecOM1(yyy,:),DataVecYM1(yyy,:),DataVecOW1(yyy,:),DataVecYW1(yyy,:)]),    median([DataVecOM20(yyy,:),DataVecYM20(yyy,:),DataVecOW20(yyy,:),DataVecYW20(yyy,:)]),median([DataVecOM50(yyy,:),DataVecYM50(yyy,:),DataVecOW50(yyy,:),DataVecYW50(yyy,:)]) ];
meds = meds';
clear meds
end

end

clear all

BoxplotMultiplot_dataload_v2_CNAP
for ttt =1: 3
%seni
DataVecYM = [DataVecYM0(:,ttt)',DataVecYM1(:,ttt)',DataVecYM20(:,ttt)',DataVecYM50(:,ttt)'];
GRPYM = [GRPYM0,GRPYM1,GRPYM20,GRPYM50];
% figure
% boxplot(DataVecYM,GRPYM)
%jauni
DataVecOM = [DataVecOM0(:,ttt)',DataVecOM1(:,ttt)',DataVecOM20(:,ttt)',DataVecOM50(:,ttt)'];
GRPOM = [GRPOM0,GRPOM1,GRPOM20,GRPOM50];
% figure
% boxplot(DataVecYM,GRPYM)

%vyrai
DataVecYW = [DataVecYW0(:,ttt)',DataVecYW1(:,ttt)',DataVecYW20(:,ttt)',DataVecYW50(:,ttt)'];
GRPYW = [GRPYW0,GRPYW1,GRPYW20,GRPYW50];
% figure
% boxplot(DataVecYW,GRPYW)
%moterys
DataVecOW = [DataVecOW0(:,ttt)',DataVecOW1(:,ttt)',DataVecOW20(:,ttt)',DataVecOW50(:,ttt)'];
GRPOW = [GRPOW0,GRPOW1,GRPOW20,GRPOW50];
% figure
% boxplot(DataVecOW,GRPOW)

DataVecAll = [DataVecYM,DataVecOM,DataVecYW,DataVecOW]
GRPAll = [GRPYM,GRPOM,GRPYW,GRPOW]






for yyy =1:1

meds(:) =  [median(DataVecYW0(yyy,:)),median(DataVecYW1(yyy,:)),median(DataVecYW20(yyy,:)),median(DataVecYW50(yyy,:)) ]
meds = meds';
clear meds
meds(:) =  [median(DataVecOW0(yyy,:)),median(DataVecOW1(yyy,:)),median(DataVecOW20(yyy,:)),median(DataVecOW50(yyy,:)) ];
meds = meds';
clear meds
meds(:) =  [median(DataVecYM0(yyy,:)),median(DataVecYM1(yyy,:)),median(DataVecYM20(yyy,:)),median(DataVecYM50(yyy,:)) ]
meds = meds';
clear meds
meds(:) =  [median(DataVecOM0(yyy,:)),median(DataVecOM1(yyy,:)),median(DataVecOM20(yyy,:)),median(DataVecOM50(yyy,:)) ];
meds = meds';
clear meds
meds(:) =  [median([DataVecOM0(yyy,:),DataVecYM0(yyy,:),DataVecOW0(yyy,:),DataVecYW0(yyy,:)]),median([DataVecOM1(yyy,:),DataVecYM1(yyy,:),DataVecOW1(yyy,:),DataVecYW1(yyy,:)]),    median([DataVecOM20(yyy,:),DataVecYM20(yyy,:),DataVecOW20(yyy,:),DataVecYW20(yyy,:)]),median([DataVecOM50(yyy,:),DataVecYM50(yyy,:),DataVecOW50(yyy,:),DataVecYW50(yyy,:)]) ];
meds = meds';
clear meds

end



end















BoxplotMultiplot_dataload_v2_HR

%seni
DataVecYM = [DataVecYM0,DataVecYM1,DataVecYM20,DataVecYM50];
GRPYM = [GRPYM0,GRPYM1,GRPYM20,GRPYM50];
% figure
% boxplot(DataVecYM,GRPYM)
%jauni
DataVecOM = [DataVecOM0,DataVecOM1,DataVecOM20,DataVecOM50];
GRPOM = [GRPOM0,GRPOM1,GRPOM20,GRPOM50];
% figure
% boxplot(DataVecYM,GRPYM)

%vyrai
DataVecYW = [DataVecYW0,DataVecYW1,DataVecYW20,DataVecYW50];
GRPYW = [GRPYW0,GRPYW1,GRPYW20,GRPYW50];
% figure
% boxplot(DataVecYW,GRPYW)
%moterys
DataVecOW = [DataVecOW0,DataVecOW1,DataVecOW20,DataVecOW50];
GRPOW = [GRPOW0,GRPOW1,GRPOW20,GRPOW50];
% figure
% boxplot(DataVecOW,GRPOW)

DataVecAll = [DataVecYM,DataVecOM,DataVecYW,DataVecOW]
GRPAll = [GRPYM,GRPOM,GRPYW,GRPOW]





ylim_org = [0 3;-2 2; -0.2 0.2; 0 300; 200 800]
ylim_norm = [0.4 0.6; 0.4 0.6; 0 0.2; 0 1; 0.4 0.9]
Titles = {'Deflection','Baseline'}
ylabels = {'Normalized amplitude with',' respect to baseline'}
sz = [0.005, 0.01]
ylims = [0.6 1.3]






for yyy =1:1

meds(:) =  [median(DataVecYW0(yyy,:)),median(DataVecYW1(yyy,:)),median(DataVecYW20(yyy,:)),median(DataVecYW50(yyy,:)) ]
meds = meds';
clear meds
meds(:) =  [median(DataVecOW0(yyy,:)),median(DataVecOW1(yyy,:)),median(DataVecOW20(yyy,:)),median(DataVecOW50(yyy,:)) ];
meds = meds';
clear meds
meds(:) =  [median(DataVecYM0(yyy,:)),median(DataVecYM1(yyy,:)),median(DataVecYM20(yyy,:)),median(DataVecYM50(yyy,:)) ]
meds = meds';
clear meds
meds(:) =  [median(DataVecOM0(yyy,:)),median(DataVecOM1(yyy,:)),median(DataVecOM20(yyy,:)),median(DataVecOM50(yyy,:)) ];
meds = meds';
clear meds
meds(:) =  [median([DataVecOM0(yyy,:),DataVecYM0(yyy,:),DataVecOW0(yyy,:),DataVecYW0(yyy,:)]),median([DataVecOM1(yyy,:),DataVecYM1(yyy,:),DataVecOW1(yyy,:),DataVecYW1(yyy,:)]),    median([DataVecOM20(yyy,:),DataVecYM20(yyy,:),DataVecOW20(yyy,:),DataVecYW20(yyy,:)]),median([DataVecOM50(yyy,:),DataVecYM50(yyy,:),DataVecOW50(yyy,:),DataVecYW50(yyy,:)]) ];
meds = meds';
clear meds

end


