clear all
close all
clc
% 
Triclass_result_load
Recog_result_load
True_Label_load

Triclass_parameter_calc
Recog_parameter_calc

figure(4)
Demo4 = load('C:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Python\Trained\RawSignalLong1Features_CNN_v1_recog\CNN_Long1_demo.txt');
Demo4tri = load('C:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Python\Trained\RawSignalLong1Features_CNN_v1_triclass\CNN_Long1_demo4tri.txt');

[~,Dem4] = max(Demo4')
[~,Dem4tri] = max(Demo4tri')

a=load('Feature_DataBlock_04_multi_1.mat')

plot(Dem4-1)
hold on
plot(a.DataBlock.Label/100)
set(gcf,'Units','centimeters','Position',[1 1 21 3])
xlabel('Time, s')
ylabel({'Normalized pain';'value /pain class'})
box off

figure(1)
Demo1 = load('C:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Python\Trained\RawSignalLong1Features_CNN_v1_recog\CNN_Long1_demo1.txt');
Demo1tri = load('C:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Python\Trained\RawSignalLong1Features_CNN_v1_triclass\CNN_Long1_demo1tri.txt');

[~,Dem] = max(Demo1')
[~,Dem1tri] = max(Demo1tri')
Demf = filter([ones(1,10)/10],1,Dem)
Demftri = filter([ones(1,10)/10],1,Dem1tri)
b=load('Feature_DataBlock_01_multi_1.mat')

plot(b.DataBlock.Time,Dem-1)
hold on
% plot(Demf)
plot(b.DataBlock.Time,b.DataBlock.Label/100)
box off
set(gcf,'Units','centimeters','Position',[1 1 21 3])
xlabel('Time, s')
ylabel({'Normalized pain';'value /pain class'})
box off

figure(2)
% plot(Dem-1)
hold on
plot(b.DataBlock.Time,Demf-1)
plot(b.DataBlock.Time,b.DataBlock.Label/100)
ylim([0 1])
set(gcf,'Units','centimeters','Position',[1 1 21 3])
xlabel('Time, s')
ylabel({'Normalized pain';'value /pain class'})
box off

figure(14)
plot(a.DataBlock.Time,(Dem4-1) .* (Dem4tri))
hold on
plot(a.DataBlock.Time,a.DataBlock.Label/100*3)
set(gcf,'Units','centimeters','Position',[1 1 21 3])
xlabel('Time, s')
ylabel({'Normalized pain';'value /pain class'})
box off
ylim([0 3])

figure(11)
plot(b.DataBlock.Time,(Dem-1) .* (Dem1tri))
hold on
plot(b.DataBlock.Time,b.DataBlock.Label/100*3)
set(gcf,'Units','centimeters','Position',[1 1 21 3])
xlabel('Time, s')
ylabel({'Normalized pain';'value /pain class'})
box off
ylim([0 3])
% figure(12)
% plot(b.DataBlock.Time,(Dem-1) .* (Demftri))
% hold on
% plot(b.DataBlock.Time,b.DataBlock.Label/100*3)
% set(gcf,'Units','centimeters','Position',[1 1 21 3])
% xlabel('Time, s')
% ylabel('Normalized pain value/ pain class')

figure(15)
subplot(3,1,1)
plot(a.DataBlock.Time,(Dem4-1) .* (Dem4tri))
hold on
plot(a.DataBlock.Time,a.DataBlock.Label/100*3,'LineWidth',2)
set(gcf,'Units','centimeters','Position',[1 1 21 9])
% xlabel('Time, s')
ylabel({'Normalized pain';'value /pain class'})
box off
ylim([0 3])
title('Training dataset sample')

subplot(3,1,2)
plot(b.DataBlock.Time,(Dem-1) .* (Dem1tri))
hold on
plot(b.DataBlock.Time,b.DataBlock.Label/100*3,'LineWidth',2)
% set(gcf,'Units','centimeters','Position',[1 1 21 3])
% xlabel('Time, s')
ylabel({'Normalized pain';'value /pain class'})
box off
ylim([0 3])
title('Testing dataset sample')

subplot(3,1,3)
Demftri2 = filter([ones(1,10)/10],1,((Dem-1) .* (Dem1tri)))
plot(b.DataBlock.Time,(Dem-1) .* (Demftri2))
hold on
plot(b.DataBlock.Time,b.DataBlock.Label/100*3,'LineWidth',2)
% set(gcf,'Units','centimeters','Position',[1 1 21 3])
xlabel('Time, s')
ylabel({'Normalized pain';'value /pain class'})
box off
ylim([0 3])
title('Testing dataset sample, filtered with averaging filter of 10th order')







figure(5)
subplot(3,1,1)
plot(a.DataBlock.Time/60,Dem4-1)
hold on
plot(a.DataBlock.Time/60,a.DataBlock.Label/100,'LineWidth',2)

box off
%title('a)','FontName','Times New Roman')
title('Training dataset','FontName','Times New Roman')

ylabel({'Normalized pain';'value /pain class'},'FontName','Times New Roman')
xlim([0 2200/60])
subplot(3,1,2)
hold on

plot(b.DataBlock.Time/60,Dem-1)
plot(b.DataBlock.Time/60,b.DataBlock.Label/100,'LineWidth',2)

box off
ylabel({'Normalized pain';'value /pain class'},'FontName','Times New Roman')
box off
xlim([0 2200/60])
%title('b)','FontName','Times New Roman')
title('Testing dataset','FontName','Times New Roman')

subplot(3,1,3)
hold on

plot(b.DataBlock.Time/60,Demf-1)
plot(b.DataBlock.Time/60,b.DataBlock.Label/100,'LineWidth',2)
ylim([0 1])
set(gcf,'Units','centimeters','Position',[1 1 21 9])
xlabel('Time, min','FontName','Times New Roman')
ylabel({'Normalized pain';'value /pain class'},'FontName','Times New Roman')
% ylabel({'Normalized pain';'value /pain class'})
box off
%title('c)','FontName','Times New Roman')
title('Testing dataset, with an averaging filter of 10th order','FontName','Times New Roman')
legend({'Model results','Subjective evaluation'},'FontName','Times New Roman')

xlim([0 2200/60])




figure(13)
plot(b.DataBlock.Time,(Dem-1) .* (Demftri2))
hold on
plot(b.DataBlock.Time,b.DataBlock.Label/100*3)
set(gcf,'Units','centimeters','Position',[1 1 21 3])
xlabel('Time, s')
ylabel({'Normalized pain';'value /pain class'})
box off
ylim([0 3])

% exportgraphics(figure(1),'Demo of 1.emf','ContentType','vector');
% exportgraphics(figure(2),'Demo of 1F.emf','ContentType','vector');
% exportgraphics(figure(4),'Demo of 4.emf','ContentType','vector');
% % 
% exportgraphics(figure(11),'Demo tri of 1.emf','ContentType','vector');
% exportgraphics(figure(13),'Demo tri of 1F.emf','ContentType','vector');
% exportgraphics(figure(14),'Demo tri of 4.emf','ContentType','vector');

% exportgraphics(figure(5),'Demo combo.emf','ContentType','vector');
% exportgraphics(figure(15),'Demo tri combo.emf','ContentType','vector');

% exportgraphics(figure(5),'Demo for biomdlore.jpg','Resolution','600');

acc= [
Triclass.Feature.Long(1).MLP.AccuracyC1
Triclass.Feature.Long(5).MLP.AccuracyC1
Triclass.Feature.Long(12).MLP.AccuracyC1
Triclass.Feature.Mean(5).MLP.AccuracyC1
Triclass.Feature.Mean(12).MLP.AccuracyC1    

Triclass.Feature.Long(1).LSTM.AccuracyC1
Triclass.Feature.Long(5).LSTM.AccuracyC1
Triclass.Feature.Long(12).LSTM.AccuracyC1
Triclass.Feature.Mean(5).LSTM.AccuracyC1
Triclass.Feature.Mean(12).LSTM.AccuracyC1

Triclass.Feature.Long(1).CNN.AccuracyC1
Triclass.Feature.Long(5).CNN.AccuracyC1
Triclass.Feature.Long(12).CNN.AccuracyC1
Triclass.Feature.Mean(5).CNN.AccuracyC1
Triclass.Feature.Mean(12).CNN.AccuracyC1
]


acc = [
Triclass.Raw.Long(1).CNN.AccuracyC1
Triclass.Raw.Long(5).CNN.AccuracyC1
Triclass.Raw.Long(12).CNN.AccuracyC1
Triclass.Raw.Mean(5).CNN.AccuracyC1
Triclass.Raw.Mean(12).CNN.AccuracyC1

Triclass.Raw.Long(1).LSTM.AccuracyC1
Triclass.Raw.Long(5).LSTM.AccuracyC1
% Triclass.Raw.Long(12).LSTM.AccuracyC1
Triclass.Raw.Mean(5).LSTM.AccuracyC1
Triclass.Raw.Mean(12).LSTM.AccuracyC1

Triclass.Raw.Long(1).MLP.AccuracyC1
Triclass.Raw.Long(5).MLP.AccuracyC1
Triclass.Raw.Long(12).MLP.AccuracyC1
Triclass.Raw.Mean(5).MLP.AccuracyC1
Triclass.Raw.Mean(12).MLP.AccuracyC1]

