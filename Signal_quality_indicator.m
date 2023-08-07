close all
clear all
clc
% % 
% load('PPG_E.mat')
% load('PPG_FIR_Quality.mat')

load('IPD_E.mat')
load('IPD_Quality.mat')

for iii =4:20
    for yyy =2:length(E(iii).Block)
   PPG_signal(E(iii).Block(yyy-1).PPG.MinIndex:E(iii).Block(yyy).PPG.MinIndex) = cell2mat(E(iii).Block(yyy).PPG.Org.Signal);
    end
    figure(iii)
    plot(PPG_signal,'black')
    hold on
    ylimm=get(gca,'ylim');
    qual =cell2mat(Quality(iii))
    for yyy =2:length(cell2mat(Quality(iii,:)))
% for yyy =2:100
        if qual(yyy) >5
        x1 =E(iii).Block(yyy-1).PPG.MinIndex
        x2 =E(iii).Block(yyy).PPG.MinIndex
    patch([x1 x2 x2 x1]', [ylimm(1) ylimm(1) ylimm(2) ylimm(2) ]',[0.7695 0.875 0.7031],'EdgeColor','blue')
%     set(gca,'children',flipud(get(gca,'children'))) % switch order or drawing
%     set(gca, 'Layer', 'top')
% get(gca,'children')
        end
end
    set(gca,'children',flipud(get(gca,'children')))
    figure(100+iii)
    plot(qual)
end



