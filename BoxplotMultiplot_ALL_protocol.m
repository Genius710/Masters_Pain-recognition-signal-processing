dadadclear all
close all
clc
figure
%% HR
load('HR_Protocol_Dataset_normalized.mat')

subplot(3,2,1)

no = 3
step = 1
width = 0.5
yvec = 0:step:no

% offset = -0.25
% boxchart(GRPMedianMen*step+offset,DataVecMedianMen,'BoxWidth',width,'BoxFaceColor','black','MarkerColor','black')
% hold on
% plot(GRPMedianMen*step+offset,DataVecMedianMen,'x','Color','black','MarkerSize',3)
% 
% offset = -0.125
% boxchart(GRPMedianWomen*step+offset,DataVecMedianWomen,'BoxWidth',width,'BoxFaceColor','red','MarkerColor','red')
% plot(GRPMedianWomen*step+offset,DataVecMedianWomen,'x','Color','red','MarkerSize',3)
% 
% offset = 0.25
% boxchart(GRPMedianYoung*step+offset,DataVecMedianYoung,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
% plot(GRPMedianYoung*step+offset,DataVecMedianYoung,'x','Color','blue','MarkerSize',3)
% 
% offset = 0.125
% boxchart(GRPMedianOld*step+offset,DataVecMedianOld,'BoxWidth',width,'BoxFaceColor','green','MarkerColor','green')
% plot(GRPMedianOld*step+offset,DataVecMedianOld,'x','Color','green','MarkerSize',3)

offset = 0
boxchart(GRPMedian*step+offset,DataVecMedian,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
hold on
plot(GRPMedian*step+offset,DataVecMedian,'x','Color','black','MarkerSize',3)

% ylim([50 120])
xticks([1:8])
xticklabels({'Rest1','WarmWater','CP7C','Rest2','CP10C','Rest3','DB','Rest4'})

%% PPG

load('PPG_Protocol_Dataset_Deflection_normalized.mat')
title('HR')
subplot(3,2,2)

% no = 3
% step = 1
% width = 0.1
% yvec = 0:step:no

% offset = -0.25
% boxchart(GRPMedianMen*step+offset,DataVecMedianMen,'BoxWidth',width,'BoxFaceColor','black','MarkerColor','black')
% hold on
% plot(GRPMedianMen*step+offset,DataVecMedianMen,'x','Color','black','MarkerSize',3)
% 
% offset = -0.125
% boxchart(GRPMedianWomen*step+offset,DataVecMedianWomen,'BoxWidth',width,'BoxFaceColor','red','MarkerColor','red')
% plot(GRPMedianWomen*step+offset,DataVecMedianWomen,'x','Color','red','MarkerSize',3)
% 
% offset = 0.25
% boxchart(GRPMedianYoung*step+offset,DataVecMedianYoung,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
% plot(GRPMedianYoung*step+offset,DataVecMedianYoung,'x','Color','blue','MarkerSize',3)
% 
% offset = 0.125
% boxchart(GRPMedianOld*step+offset,DataVecMedianOld,'BoxWidth',width,'BoxFaceColor','green','MarkerColor','green')
% plot(GRPMedianOld*step+offset,DataVecMedianOld,'x','Color','green','MarkerSize',3)

offset = 0
boxchart(GRPMedian*step+offset,DataVecMedian,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
hold on
plot(GRPMedian*step+offset,DataVecMedian,'x','Color','black','MarkerSize',3)

% ylim([0.7 1.1])
xticks([1:8])
xticklabels({'Rest1','WarmWater','CP7C','Rest2','CP10C','Rest3','DB','Rest4'})


%% IPD

load('IPD_Protocol_Dataset_Deflection_normalized.mat')
title('PPG Deflection')
subplot(3,2,3)

% no = 3
% step = 1
% width = 0.1
% yvec = 0:step:no

% offset = -0.25
% boxchart(GRPMedianMen*step+offset,DataVecMedianMen,'BoxWidth',width,'BoxFaceColor','black','MarkerColor','black')
% hold on
% plot(GRPMedianMen*step+offset,DataVecMedianMen,'x','Color','black','MarkerSize',3)
% 
% offset = -0.125
% boxchart(GRPMedianWomen*step+offset,DataVecMedianWomen,'BoxWidth',width,'BoxFaceColor','red','MarkerColor','red')
% plot(GRPMedianWomen*step+offset,DataVecMedianWomen,'x','Color','red','MarkerSize',3)
% 
% offset = 0.25
% boxchart(GRPMedianYoung*step+offset,DataVecMedianYoung,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
% plot(GRPMedianYoung*step+offset,DataVecMedianYoung,'x','Color','blue','MarkerSize',3)
% 
% offset = 0.125
% boxchart(GRPMedianOld*step+offset,DataVecMedianOld,'BoxWidth',width,'BoxFaceColor','green','MarkerColor','green')
% plot(GRPMedianOld*step+offset,DataVecMedianOld,'x','Color','green','MarkerSize',3)

offset = 0
boxchart(GRPMedian*step+offset,DataVecMedian,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
hold on
plot(GRPMedian*step+offset,DataVecMedian,'x','Color','black','MarkerSize',3)

% ylim([0.5 1.5])
xticks([1:8])
xticklabels({'Rest1','WarmWater','CP7C','Rest2','CP10C','Rest3','DB','Rest4'})

load('IPD_Protocol_Dataset_Baseline_normalized.mat')
title('IPD Deflection')
subplot(3,2,4)

% no = 3
% step = 1
% width = 0.1
% yvec = 0:step:no

% offset = -0.25
% boxchart(GRPMedianMen*step+offset,DataVecMedianMen,'BoxWidth',width,'BoxFaceColor','black','MarkerColor','black')
% hold on
% plot(GRPMedianMen*step+offset,DataVecMedianMen,'x','Color','black','MarkerSize',3)
% 
% offset = -0.125
% boxchart(GRPMedianWomen*step+offset,DataVecMedianWomen,'BoxWidth',width,'BoxFaceColor','red','MarkerColor','red')
% plot(GRPMedianWomen*step+offset,DataVecMedianWomen,'x','Color','red','MarkerSize',3)
% 
% offset = 0.25
% boxchart(GRPMedianYoung*step+offset,DataVecMedianYoung,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
% plot(GRPMedianYoung*step+offset,DataVecMedianYoung,'x','Color','blue','MarkerSize',3)
% 
% offset = 0.125
% boxchart(GRPMedianOld*step+offset,DataVecMedianOld,'BoxWidth',width,'BoxFaceColor','green','MarkerColor','green')
% plot(GRPMedianOld*step+offset,DataVecMedianOld,'x','Color','green','MarkerSize',3)

offset = 0
boxchart(GRPMedian*step+offset,DataVecMedian,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
hold on
plot(GRPMedian*step+offset,DataVecMedian,'x','Color','black','MarkerSize',3)

% ylim([0.9 1.15])
xticks([1:8])
xticklabels({'Rest1','WarmWater','CP7C','Rest2','CP10C','Rest3','DB','Rest4'})

%% CNAP

load('CNAP_Protocol_Dataset_Systolic_normalized.mat')
title('IPD Magnitude')
subplot(3,2,5)

% no = 3
% step = 1
% width = 0.1
% yvec = 0:step:no

% offset = -0.25
% boxchart(GRPMedianMen*step+offset,DataVecMedianMen,'BoxWidth',width,'BoxFaceColor','black','MarkerColor','black')
% hold on
% plot(GRPMedianMen*step+offset,DataVecMedianMen,'x','Color','black','MarkerSize',3)
% 
% offset = -0.125
% boxchart(GRPMedianWomen*step+offset,DataVecMedianWomen,'BoxWidth',width,'BoxFaceColor','red','MarkerColor','red')
% plot(GRPMedianWomen*step+offset,DataVecMedianWomen,'x','Color','red','MarkerSize',3)
% 
% offset = 0.25
% boxchart(GRPMedianYoung*step+offset,DataVecMedianYoung,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
% plot(GRPMedianYoung*step+offset,DataVecMedianYoung,'x','Color','blue','MarkerSize',3)
% 
% offset = 0.125
% boxchart(GRPMedianOld*step+offset,DataVecMedianOld,'BoxWidth',width,'BoxFaceColor','green','MarkerColor','green')
% plot(GRPMedianOld*step+offset,DataVecMedianOld,'x','Color','green','MarkerSize',3)

offset = 0
boxchart(GRPMedian*step+offset,DataVecMedian,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
hold on
plot(GRPMedian*step+offset,DataVecMedian,'x','Color','black','MarkerSize',3)

% ylim([0.8 1.4])
xticks([1:8])
xticklabels({'Rest1','WarmWater','CP7C','Rest2','CP10C','Rest3','DB','Rest4'})

load('CNAP_Protocol_Dataset_Diastolic_normalized.mat')
title('BP Systolic')
subplot(3,2,6)

% no = 3
% step = 1
% width = 0.1
% yvec = 0:step:no

% offset = -0.25
% boxchart(GRPMedianMen*step+offset,DataVecMedianMen,'BoxWidth',width,'BoxFaceColor','black','MarkerColor','black')
% hold on
% plot(GRPMedianMen*step+offset,DataVecMedianMen,'x','Color','black','MarkerSize',3)
% 
% offset = -0.125
% boxchart(GRPMedianWomen*step+offset,DataVecMedianWomen,'BoxWidth',width,'BoxFaceColor','red','MarkerColor','red')
% plot(GRPMedianWomen*step+offset,DataVecMedianWomen,'x','Color','red','MarkerSize',3)
% 
% offset = 0.25
% boxchart(GRPMedianYoung*step+offset,DataVecMedianYoung,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
% plot(GRPMedianYoung*step+offset,DataVecMedianYoung,'x','Color','blue','MarkerSize',3)
% 
% offset = 0.125
% boxchart(GRPMedianOld*step+offset,DataVecMedianOld,'BoxWidth',width,'BoxFaceColor','green','MarkerColor','green')
% plot(GRPMedianOld*step+offset,DataVecMedianOld,'x','Color','green','MarkerSize',3)

offset = 0
boxchart(GRPMedian*step+offset,DataVecMedian,'BoxWidth',width,'BoxFaceColor','blue','MarkerColor','blue')
hold on
plot(GRPMedian*step+offset,DataVecMedian,'x','Color','black','MarkerSize',3)

% ylim([0.7 1.40001])
xticks([1:8])
xticklabels({'Rest1','WarmWater','CP7C','Rest2','CP10C','Rest3','DB','Rest4'})
title('BP Diastolic')
% legend({'Men','','Women','','Young <40','','Old >=40','','All',''},'Location','eastoutside')
% figure(5)
% title('PPG Phases')
% 
% exportgraphics(figure(5),'PPG phases.jpg','Resolution','600');

% exportgraphics(figure(1),'All phases.jpg','Resolution','600');

subplot(3,2,1)
ylim([0.6 1.2])
subplot(3,2,2)
ylim([0.6 1.1])
subplot(3,2,3)
ylim([0 2.5])
subplot(3,2,4)
ylim([0.9 1.1])

subplot(3,2,5)
ylim([0.8 1.4])

subplot(3,2,6)
ylim([0.6 1.6])
exportgraphics(figure(1),'All phases normalized.jpg','Resolution','600');

