clear all
close all
clc



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





figure(5)
subplot(3,2,1)
no = 3
step = 1
width = 0.5
yvec = 0:step:no
for yyy =1:1
% subplot(1,2,yyy)
% offset = -0.25
% % boxplot(DataVecYW(yyy,:),GRPYW,'positions', yvec+offset)
% boxchart(GRPYW*step+offset,DataVecYW,'BoxWidth',width,'BoxFaceColor','black','MarkerColor','black')
% hold on
% plot(GRPYW*step+offset,DataVecYW,'x','Color','black','MarkerSize',3)
% 
% meds(:) =  [median(DataVecYW0(yyy,:)),median(DataVecYW1(yyy,:)),median(DataVecYW20(yyy,:)),median(DataVecYW50(yyy,:)) ]
% plot(yvec+offset,meds,'black')
% 
% % yvec= yvec+40;
% offset = -0.125
% % boxplot(DataVecOW(yyy,:),GRPOW,'positions', yvec+offset)
% boxchart(GRPOW*step+offset,DataVecOW,'BoxWidth',width,'BoxFaceColor','red','MarkerColor','red')
% hold on
% plot(GRPOW*step+offset,DataVecOW,'x','Color','black','MarkerSize',3)
% 
% clear meds
% meds(:) =  [median(DataVecOW0(yyy,:)),median(DataVecOW1(yyy,:)),median(DataVecOW20(yyy,:)),median(DataVecOW50(yyy,:)) ];
% 
% plot(yvec+offset,meds,'red')
% 
% % legend
% 
% %% men
% offset = 0.25
% % boxplot(DataVecYM(yyy,:),GRPYM,'positions', yvec+offset)
% boxchart(GRPYM*step+offset,DataVecYM,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
% hold on
% plot(GRPYM*step+offset,DataVecYM,'x','Color','black','MarkerSize',3)
% 
% 
% meds(:) =  [median(DataVecYM0(yyy,:)),median(DataVecYM1(yyy,:)),median(DataVecYM20(yyy,:)),median(DataVecYM50(yyy,:)) ]
% plot(yvec+offset,meds,'blue')
% 
% 
% offset = 0.125
% % boxplot(DataVecOM(yyy,:),GRPOM,'positions', yvec+offset)
% boxchart(GRPOM*step+offset,DataVecOM,'BoxWidth',width,'BoxFaceColor','green','MarkerColor','green')
% hold on
% plot(GRPOM*step+offset,DataVecOM,'x','Color','black','MarkerSize',3)
% 
% 
% clear meds
% meds(:) =  [median(DataVecOM0(yyy,:)),median(DataVecOM1(yyy,:)),median(DataVecOM20(yyy,:)),median(DataVecOM50(yyy,:)) ];
% 
% 
% plot(yvec+offset,meds,'green')
% 
% 
% % ylim([0.6 1.1])
% xlim([-0.5 3.5])

offset = 0
boxchart(GRPAll*step+offset,DataVecAll,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
hold on
plot(GRPAll*step+offset,DataVecAll,'x','Color','black','MarkerSize',3)


clear meds
meds(:) =  [median([DataVecOM0(yyy,:),DataVecYM0(yyy,:),DataVecOW0(yyy,:),DataVecYW0(yyy,:)]),median([DataVecOM1(yyy,:),DataVecYM1(yyy,:),DataVecOW1(yyy,:),DataVecYW1(yyy,:)]),    median([DataVecOM20(yyy,:),DataVecYM20(yyy,:),DataVecOW20(yyy,:),DataVecYW20(yyy,:)]),median([DataVecOM50(yyy,:),DataVecYM50(yyy,:),DataVecOW50(yyy,:),DataVecYW50(yyy,:)]) ];


plot(yvec+offset,meds,'blue')


% ylim([0.6 1.1])
xlim([-0.5 3.5])

end

% legend({'Women <40','','','Women >=40','','','Men <40','','','Men >=40','','','All','',''},'Location','eastoutside')

% legend({'Men','','','Women','','','Old >=40','','','Young <40','','','All','',''},'Location','eastoutside')


xticks([0 1 2 3])
xticklabels({'NPRS=0','NPRS>0','NPRS>=20','NPRS>=50'})
% ylim([0.65 1.05])


title('HR')

















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





figure(5)
subplot(3,2,2)
% no = 3
% step = 1
% width = 0.1
% yvec = 0:step:no
for yyy =1:1
% subplot(1,2,yyy)
% offset = -0.25
% % boxplot(DataVecYW(yyy,:),GRPYW,'positions', yvec+offset)
% boxchart(GRPYW*step+offset,DataVecYW,'BoxWidth',width,'BoxFaceColor','black','MarkerColor','black')
% hold on
% plot(GRPYW*step+offset,DataVecYW,'x','Color','black','MarkerSize',3)
% 
% meds(:) =  [median(DataVecYW0(yyy,:)),median(DataVecYW1(yyy,:)),median(DataVecYW20(yyy,:)),median(DataVecYW50(yyy,:)) ]
% plot(yvec+offset,meds,'black')
% 
% % yvec= yvec+40;
% offset = -0.125
% % boxplot(DataVecOW(yyy,:),GRPOW,'positions', yvec+offset)
% boxchart(GRPOW*step+offset,DataVecOW,'BoxWidth',width,'BoxFaceColor','red','MarkerColor','red')
% hold on
% plot(GRPOW*step+offset,DataVecOW,'x','Color','black','MarkerSize',3)
% 
% clear meds
% meds(:) =  [median(DataVecOW0(yyy,:)),median(DataVecOW1(yyy,:)),median(DataVecOW20(yyy,:)),median(DataVecOW50(yyy,:)) ];
% 
% plot(yvec+offset,meds,'red')
% 
% % legend
% 
% %% men
% offset = 0.25
% % boxplot(DataVecYM(yyy,:),GRPYM,'positions', yvec+offset)
% boxchart(GRPYM*step+offset,DataVecYM,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
% hold on
% plot(GRPYM*step+offset,DataVecYM,'x','Color','black','MarkerSize',3)
% 
% 
% meds(:) =  [median(DataVecYM0(yyy,:)),median(DataVecYM1(yyy,:)),median(DataVecYM20(yyy,:)),median(DataVecYM50(yyy,:)) ]
% plot(yvec+offset,meds,'blue')
% 
% 
% offset = 0.125
% % boxplot(DataVecOM(yyy,:),GRPOM,'positions', yvec+offset)
% boxchart(GRPOM*step+offset,DataVecOM,'BoxWidth',width,'BoxFaceColor','green','MarkerColor','green')
% hold on
% plot(GRPOM*step+offset,DataVecOM,'x','Color','black','MarkerSize',3)
% 
% 
% clear meds
% meds(:) =  [median(DataVecOM0(yyy,:)),median(DataVecOM1(yyy,:)),median(DataVecOM20(yyy,:)),median(DataVecOM50(yyy,:)) ];
% 
% 
% plot(yvec+offset,meds,'green')
% 
% 
% ylim([0.6 1.1])
% xlim([-0.5 3.5])

offset = 0
boxchart(GRPAll*step+offset,DataVecAll,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
hold on
plot(GRPAll*step+offset,DataVecAll,'x','Color','black','MarkerSize',3)


clear meds
meds(:) =  [median([DataVecOM0(yyy,:),DataVecYM0(yyy,:),DataVecOW0(yyy,:),DataVecYW0(yyy,:)]),median([DataVecOM1(yyy,:),DataVecYM1(yyy,:),DataVecOW1(yyy,:),DataVecYW1(yyy,:)]),    median([DataVecOM20(yyy,:),DataVecYM20(yyy,:),DataVecOW20(yyy,:),DataVecYW20(yyy,:)]),median([DataVecOM50(yyy,:),DataVecYM50(yyy,:),DataVecOW50(yyy,:),DataVecYW50(yyy,:)]) ];


plot(yvec+offset,meds,'blue')


ylim([0.6 1.1])
xlim([-0.5 3.5])

end

% legend({'Women <40','','','Women >=40','','','Men <40','','','Men >=40','','','All','',''},'Location','eastoutside')

% legend({'Men','','','Women','','','Old >=40','','','Young <40','','','All','',''},'Location','eastoutside')


xticks([0 1 2 3])
xticklabels({'NPRS=0','NPRS>0','NPRS>=20','NPRS>=50'})
ylim([0.65 1.05])







% 
% figure(5)
figure(5)
subplot(3,2,2)
title('PPG Deflection')

% exportgraphics(figure(5),'PPG Deflection boxplots.jpg','Resolution','600');








% clear all
% close all
% clc

BoxplotMultiplot_dataload_v2_IPD
for ttt =1: 2
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





ylim_org = [0 3;-2 2; -0.2 0.2; 0 300; 200 800]
ylim_norm = [0.4 0.6; 0.4 0.6; 0 0.2; 0 1; 0.4 0.9]
Titles = {'Deflection','Baseline'}
ylabels = {'Normalized amplitude with',' respect to baseline'}
sz = [0.005, 0.01]
ylims = [0.6 1.3]





% figure(ttt)
figure(5)
subplot(3,2,2+ttt)
% no = 3
% step = 1
% width = 0.1
% yvec = 0:step:no
for yyy =1:1
% subplot(1,2,yyy)
% offset = -0.25
% % boxplot(DataVecYW(yyy,:),GRPYW,'positions', yvec+offset)
% boxchart(GRPYW*step+offset,DataVecYW,'BoxWidth',width,'BoxFaceColor','black','MarkerColor','black')
% hold on
% plot(GRPYW*step+offset,DataVecYW,'x','Color','black','MarkerSize',3)
% 
% meds(:) =  [median(DataVecYW0(:,ttt)),median(DataVecYW1(:,ttt)),median(DataVecYW20(:,ttt)),median(DataVecYW50(:,ttt)) ]
% plot(yvec+offset,meds,'black')
% 
% % yvec= yvec+40;
% offset = -0.125
% % boxplot(DataVecOW(yyy,:),GRPOW,'positions', yvec+offset)
% boxchart(GRPOW*step+offset,DataVecOW,'BoxWidth',width,'BoxFaceColor','red','MarkerColor','red')
% hold on
% plot(GRPOW*step+offset,DataVecOW,'x','Color','black','MarkerSize',3)
% 
% clear meds
% meds(:) =  [median(DataVecOW0(:,ttt)),median(DataVecOW1(:,ttt)),median(DataVecOW20(:,ttt)),median(DataVecOW50(:,ttt)) ];
% 
% plot(yvec+offset,meds,'red')
% 
% % legend
% 
% %% men
% offset = 0.25
% % boxplot(DataVecYM(yyy,:),GRPYM,'positions', yvec+offset)
% boxchart(GRPYM*step+offset,DataVecYM,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
% hold on
% plot(GRPYM*step+offset,DataVecYM,'x','Color','black','MarkerSize',3)
% 
% 
% meds(:) =  [median(DataVecYM0(:,ttt)),median(DataVecYM1(:,ttt)),median(DataVecYM20(:,ttt)),median(DataVecYM50(:,ttt)) ]
% plot(yvec+offset,meds,'blue')
% 
% 
% offset = 0.125
% % boxplot(DataVecOM(yyy,:),GRPOM,'positions', yvec+offset)
% boxchart(GRPOM*step+offset,DataVecOM,'BoxWidth',width,'BoxFaceColor','green','MarkerColor','green')
% hold on
% plot(GRPOM*step+offset,DataVecOM,'x','Color','black','MarkerSize',3)
% 
% 
% clear meds
% meds(:) =  [median(DataVecOM0(:,ttt)),median(DataVecOM1(:,ttt)),median(DataVecOM20(:,ttt)),median(DataVecOM50(:,ttt)) ];
% 
% 
% plot(yvec+offset,meds,'green')
% 
% 
% % ylim([0.6 1.1])
% % xlim([-0.5 3.5])

offset = 0
boxchart(GRPAll*step+offset,DataVecAll,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
hold on
plot(GRPAll*step+offset,DataVecAll,'x','Color','black','MarkerSize',3)


clear meds
meds(:) =  [median([DataVecOM0(:,ttt)',DataVecYM0(:,ttt)',DataVecOW0(:,ttt)',DataVecYW0(:,ttt)']),median([DataVecOM1(:,ttt)',DataVecYM1(:,ttt)',DataVecOW1(:,ttt)',DataVecYW1(:,ttt)']),    median([DataVecOM20(:,ttt)',DataVecYM20(:,ttt)',DataVecOW20(:,ttt)',DataVecYW20(:,ttt)']),median([DataVecOM50(:,ttt)',DataVecYM50(:,ttt)',DataVecOW50(:,ttt)',DataVecYW50(:,ttt)']) ];


plot(yvec+offset,meds,'blue')


% ylim([0.6 1.1])
xlim([-0.5 3.5])

end

% legend({'Women <40','','','Women >=40','','','Men <40','','','Men >=40','','','All','',''},'Location','eastoutside')

% legend({'Men','','','Women','','','Old >=40','','','Young <40','','','All','',''},'Location','eastoutside')


xticks([0 1 2 3])
xticklabels({'NPRS=0','NPRS>0','NPRS>=20','NPRS>=50'})
% ylim([0.65 1.05])



end
% figure(3)
figure(5)
subplot(3,2,3)
title('IPD Deflection')

figure(5)
subplot(3,2,4)
title('IPD Baseline')
% title('Mean')

% exportgraphics(figure(1),'IPD deflection boxplots.jpg','Resolution','600');
% exportgraphics(figure(2),'IPD baseline boxplots.jpg','Resolution','600');
% exportgraphics(figure(3),'meanBP boxplots.jpg','Resolution','600');





% clear all
% close all
% clc
BoxplotMultiplot_dataload_v2_CNAP
for ttt =1: 2
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





ylim_org = [0 3;-2 2; -0.2 0.2; 0 300; 200 800]
ylim_norm = [0.4 0.6; 0.4 0.6; 0 0.2; 0 1; 0.4 0.9]
Titles = {'Deflection','Baseline'}
ylabels = {'Normalized amplitude with',' respect to baseline'}
sz = [0.005, 0.01]
ylims = [0.6 1.3]





% figure(ttt)
subplot(3,2,4+ttt)
% no = 3
% step = 1
% width = 0.1
% yvec = 0:step:no
for yyy =1:1
% subplot(1,2,yyy)
% offset = -0.25
% % boxplot(DataVecYW(yyy,:),GRPYW,'positions', yvec+offset)
% boxchart(GRPYW*step+offset,DataVecYW,'BoxWidth',width,'BoxFaceColor','black','MarkerColor','black')
% hold on
% plot(GRPYW*step+offset,DataVecYW,'x','Color','black','MarkerSize',3)
% 
% meds(:) =  [median(DataVecYW0(:,ttt)),median(DataVecYW1(:,ttt)),median(DataVecYW20(:,ttt)),median(DataVecYW50(:,ttt)) ]
% plot(yvec+offset,meds,'black')
% 
% % yvec= yvec+40;
% offset = -0.125
% % boxplot(DataVecOW(yyy,:),GRPOW,'positions', yvec+offset)
% boxchart(GRPOW*step+offset,DataVecOW,'BoxWidth',width,'BoxFaceColor','red','MarkerColor','red')
% hold on
% plot(GRPOW*step+offset,DataVecOW,'x','Color','black','MarkerSize',3)
% 
% clear meds
% meds(:) =  [median(DataVecOW0(:,ttt)),median(DataVecOW1(:,ttt)),median(DataVecOW20(:,ttt)),median(DataVecOW50(:,ttt)) ];
% 
% plot(yvec+offset,meds,'red')
% 
% % legend
% 
% %% men
% offset = 0.25
% % boxplot(DataVecYM(yyy,:),GRPYM,'positions', yvec+offset)
% boxchart(GRPYM*step+offset,DataVecYM,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
% hold on
% plot(GRPYM*step+offset,DataVecYM,'x','Color','black','MarkerSize',3)
% 
% 
% meds(:) =  [median(DataVecYM0(:,ttt)),median(DataVecYM1(:,ttt)),median(DataVecYM20(:,ttt)),median(DataVecYM50(:,ttt)) ]
% plot(yvec+offset,meds,'blue')
% 
% 
% offset = 0.125
% % boxplot(DataVecOM(yyy,:),GRPOM,'positions', yvec+offset)
% boxchart(GRPOM*step+offset,DataVecOM,'BoxWidth',width,'BoxFaceColor','green','MarkerColor','green')
% hold on
% plot(GRPOM*step+offset,DataVecOM,'x','Color','black','MarkerSize',3)
% 
% 
% clear meds
% meds(:) =  [median(DataVecOM0(:,ttt)),median(DataVecOM1(:,ttt)),median(DataVecOM20(:,ttt)),median(DataVecOM50(:,ttt)) ];
% 
% 
% plot(yvec+offset,meds,'green')
% 
% 
% % ylim([0.6 1.1])
% % xlim([-0.5 3.5])

offset = 0
boxchart(GRPAll*step+offset,DataVecAll,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
hold on
plot(GRPAll*step+offset,DataVecAll,'x','Color','black','MarkerSize',3)


clear meds
meds(:) =  [median([DataVecOM0(:,ttt)',DataVecYM0(:,ttt)',DataVecOW0(:,ttt)',DataVecYW0(:,ttt)']),median([DataVecOM1(:,ttt)',DataVecYM1(:,ttt)',DataVecOW1(:,ttt)',DataVecYW1(:,ttt)']),    median([DataVecOM20(:,ttt)',DataVecYM20(:,ttt)',DataVecOW20(:,ttt)',DataVecYW20(:,ttt)']),median([DataVecOM50(:,ttt)',DataVecYM50(:,ttt)',DataVecOW50(:,ttt)',DataVecYW50(:,ttt)']) ];


plot(yvec+offset,meds,'blue')


% ylim([0.6 1.1])
xlim([-0.5 3.5])

end

% legend({'Women <40','','','Women >=40','','','Men <40','','','Men >=40','','','All','',''},'Location','eastoutside')

% legend({'Men','','','Women','','','Old >=40','','','Young <40','','','All','',''},'Location','eastoutside')


xticks([0 1 2 3])
xticklabels({'NPRS=0','NPRS>0','NPRS>=20','NPRS>=50'})
% ylim([0.65 1.05])



end
figure(5)
subplot(3,2,5)
title('BP Systolic')
figure(5)
subplot(3,2,6)
title('BP Diastolic')
% figure(5)
% subplot(3,2,6)
% title('BP Mean')



% subplot(3,2,1)
% ylim([0.65 1.05])

subplot(3,2,1)
ylim([0.6 1.2])
subplot(3,2,2)
ylim([0.6 1.2])
subplot(3,2,3)
ylim([0 2])
subplot(3,2,4)
ylim([0.9 1.1])

subplot(3,2,5)
ylim([0.5 1.5])

subplot(3,2,6)
ylim([0.5 1.5])

% 
% exportgraphics(figure(1),'systolic boxplots.jpg','Resolution','600');
% exportgraphics(figure(2),'diastolic boxplots.jpg','Resolution','600');
% exportgraphics(figure(3),'meanBP boxplots.jpg','Resolution','600');


