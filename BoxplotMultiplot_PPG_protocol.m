clear all
close all
clc


load('HR_Protocol_Dataset.mat')

% step = 1
% offset = -0.25
% width = 0.1
% boxplot(DataVecYW(yyy,:),GRPYW,'positions', yvec+offset)
% boxchart(GRPMen*step+offset,DataVecMen,'BoxWidth',width,'BoxFaceColor','black','MarkerColor','black')



figure
no = 3
step = 1
width = 0.1
yvec = 0:step:no
for yyy =1:1
% subplot(1,2,yyy)
offset = -0.25
% boxplot(DataVecYW(yyy,:),GRPYW,'positions', yvec+offset)
boxchart(GRPMen*step+offset,DataVecMen,'BoxWidth',width,'BoxFaceColor','black','MarkerColor','black')
hold on
% plot(GRPMen*step+offset,DataVecMen,'x','Color','black','MarkerSize',3)

% meds(:) =  [median(DataVecYW0(yyy,:)),median(DataVecYW1(yyy,:)),median(DataVecYW20(yyy,:)),median(DataVecYW50(yyy,:)) ]
% plot(yvec+offset,meds,'black')

% yvec= yvec+40;
offset = -0.125
% boxplot(DataVecOW(yyy,:),GRPOW,'positions', yvec+offset)
boxchart(GRPWomen*step+offset,DataVecWomen,'BoxWidth',width,'BoxFaceColor','red','MarkerColor','red')
% hold on
% plot(GRPWomen*step+offset,DataVecWomen,'x','Color','black','MarkerSize',3)

% clear meds
% meds(:) =  [median(DataVecOW0(yyy,:)),median(DataVecOW1(yyy,:)),median(DataVecOW20(yyy,:)),median(DataVecOW50(yyy,:)) ];

% plot(yvec+offset,meds,'red')

% legend

%% men
offset = 0.25
% boxplot(DataVecYM(yyy,:),GRPYM,'positions', yvec+offset)
boxchart(GRPYoung*step+offset,DataVecYoung,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
% hold on
% plot(GRPYoung*step+offset,DataVecYoung,'x','Color','black','MarkerSize',3)


% meds(:) =  [median(DataVecYM0(yyy,:)),median(DataVecYM1(yyy,:)),median(DataVecYM20(yyy,:)),median(DataVecYM50(yyy,:)) ]
% plot(yvec+offset,meds,'blue')


offset = 0.125
% boxplot(DataVecOM(yyy,:),GRPOM,'positions', yvec+offset)
boxchart(GRPOld*step+offset,DataVecOld,'BoxWidth',width,'BoxFaceColor','green','MarkerColor','green')
hold on
plot(GRPOld*step+offset,DataVecOld,'x','Color','black','MarkerSize',3)


% clear meds
% meds(:) =  [median(DataVecOM0(yyy,:)),median(DataVecOM1(yyy,:)),median(DataVecOM20(yyy,:)),median(DataVecOM50(yyy,:)) ];


% plot(yvec+offset,meds,'green')


% ylim([0.6 1.1])
% xlim([-0.5 3.5])

offset = 0
boxchart(GRP*step+offset,DataVec,'BoxWidth',width,'BoxFaceColor','magenta','MarkerColor','magenta')
% hold on
% plot(GRPAll*step+offset,DataVecAll,'x','Color','black','MarkerSize',3)


% clear meds
% meds(:) =  [median([DataVecOM0(yyy,:),DataVecYM0(yyy,:),DataVecOW0(yyy,:),DataVecYW0(yyy,:)]),median([DataVecOM1(yyy,:),DataVecYM1(yyy,:),DataVecOW1(yyy,:),DataVecYW1(yyy,:)]),    median([DataVecOM20(yyy,:),DataVecYM20(yyy,:),DataVecOW20(yyy,:),DataVecYW20(yyy,:)]),median([DataVecOM50(yyy,:),DataVecYM50(yyy,:),DataVecOW50(yyy,:),DataVecYW50(yyy,:)]) ];


% plot(yvec+offset,meds,'magenta')


% ylim([0.6 1.1])
% xlim([-0.5 3.5])

end

% legend({'Women <40','','','Women >=40','','','Men <40','','','Men >=40','','','All','',''},'Location','eastoutside')

% legend({'Men','','','Women','','','Old >=40','','','Young <40','','','All','',''},'Location','eastoutside')
% 
% 
legend({'Men','','Women','','Young <40','','Old >=40','','All',''},'Location','eastoutside')

xticks([1:8])
% xticklabels({'NPRS=0','NPRS>0','NPRS>=20','NPRS>=50'})
xticklabels({'Rest1','WarmWater','CP7C','Rest2','CP10C','Rest3','DB','Rest4'})
% ylim([0.65 1.05])











figure
no = 3
step = 1
width = 0.1
yvec = 0:step:no
for yyy =1:1

offset = -0.25

boxchart(GRPMedianMen*step+offset,DataVecMedianMen,'BoxWidth',width,'BoxFaceColor','black','MarkerColor','black')
hold on
plot(GRPMedianMen*step+offset,DataVecMedianMen,'x','Color','black','MarkerSize',3)

offset = -0.125
boxchart(GRPMedianWomen*step+offset,DataVecMedianWomen,'BoxWidth',width,'BoxFaceColor','red','MarkerColor','red')
plot(GRPMedianWomen*step+offset,DataVecMedianWomen,'x','Color','red','MarkerSize',3)
%% men
offset = 0.25
boxchart(GRPMedianYoung*step+offset,DataVecMedianYoung,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
plot(GRPMedianYoung*step+offset,DataVecMedianYoung,'x','Color','blue','MarkerSize',3)

offset = 0.125
boxchart(GRPMedianOld*step+offset,DataVecMedianOld,'BoxWidth',width,'BoxFaceColor','green','MarkerColor','green')
plot(GRPMedianOld*step+offset,DataVecMedianOld,'x','Color','green','MarkerSize',3)

offset = 0
boxchart(GRPMedian*step+offset,DataVecMedian,'BoxWidth',width,'BoxFaceColor','magenta','MarkerColor','magenta')
plot(GRPMedian*step+offset,DataVecMedian,'x','Color','magenta','MarkerSize',3)

end


legend({'Men','','Women','','Young <40','','Old >=40','','All',''},'Location','eastoutside')

xticks([1:8])
xticklabels({'Rest1','WarmWater','CP7C','Rest2','CP10C','Rest3','DB','Rest4'})





% figure(5)
% title('PPG Phases')
% 
% exportgraphics(figure(5),'PPG phases.jpg','Resolution','600');




