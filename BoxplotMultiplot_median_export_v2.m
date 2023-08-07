clear all
close all
clc

BoxplotMultiplot_dataload_v2_HR

DataVecYM = [DataVecYM0,DataVecYM1,DataVecYM20,DataVecYM50];
GRPYM = [GRPYM0,GRPYM1,GRPYM20,GRPYM50];

DataVecOM = [DataVecOM0,DataVecOM1,DataVecOM20,DataVecOM50];
GRPOM = [GRPOM0,GRPOM1,GRPOM20,GRPOM50];

DataVecYW = [DataVecYW0,DataVecYW1,DataVecYW20,DataVecYW50];
GRPYW = [GRPYW0,GRPYW1,GRPYW20,GRPYW50];

DataVecOW = [DataVecOW0,DataVecOW1,DataVecOW20,DataVecOW50];
GRPOW = [GRPOW0,GRPOW1,GRPOW20,GRPOW50];


DataVecAll = [DataVecYM,DataVecOM,DataVecYW,DataVecOW]
GRPAll = [GRPYM,GRPOM,GRPYW,GRPOW]

First =1
BoxplotMultiplot_median_export_data_manipulation

for iii =1:4
    for yyy =1:5
Table{iii,yyy} = names{iii,yyy};
    end
end



%%PPG
BoxplotMultiplot_dataload_v2


DataVecYM = [DataVecYM0,DataVecYM1,DataVecYM20,DataVecYM50];
GRPYM = [GRPYM0,GRPYM1,GRPYM20,GRPYM50];

DataVecOM = [DataVecOM0,DataVecOM1,DataVecOM20,DataVecOM50];
GRPOM = [GRPOM0,GRPOM1,GRPOM20,GRPOM50];

DataVecYW = [DataVecYW0,DataVecYW1,DataVecYW20,DataVecYW50];
GRPYW = [GRPYW0,GRPYW1,GRPYW20,GRPYW50];

DataVecOW = [DataVecOW0,DataVecOW1,DataVecOW20,DataVecOW50];
GRPOW = [GRPOW0,GRPOW1,GRPOW20,GRPOW50];


DataVecAll = [DataVecYM,DataVecOM,DataVecYW,DataVecOW]
GRPAll = [GRPYM,GRPOM,GRPYW,GRPOW]


First =0
BoxplotMultiplot_median_export_data_manipulation

for iii =1:4
    for yyy =1:5
Table{iii+4,yyy} = names{iii,yyy};
    end
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





First =0
BoxplotMultiplot_median_export_data_manipulation

for iii =1:4
    for yyy =1:5
Table{iii+4+ttt*4,yyy} = names{iii,yyy};
    end
end

end



BoxplotMultiplot_dataload_v2_CNAP
for ttt =1: 2
    
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





First =0
BoxplotMultiplot_median_export_data_manipulation


for iii =1:4
    for yyy =1:5
Table{iii+12+ttt*4,yyy} = names{iii,yyy};
    end
end

end
















