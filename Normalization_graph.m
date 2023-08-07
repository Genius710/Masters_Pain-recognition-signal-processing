clear all
close all
clc


load(strcat('Feature_DataBlock_01_multi_1.mat'));
Sig = []
for iii =1:length(DataBlock.Signal)
   Sig = [Sig,DataBlock.Signal(iii,:) ] ;
end

figure
plot(Sig)
hold on
plot([1:500:length(Sig)],DataBlock.Label/100)
ylim([0 2])
box off
ylabel({'Normalized amplitude/';'Rescaled pain'})
xlabel('Heartbeat signal datapoints')