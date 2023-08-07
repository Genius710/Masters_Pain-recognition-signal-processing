clear all
close all
clc

name_vector = {
'MLP Single heartbeat'
'MLP 5 heartbeats'
'MLP 12 heartbeats'
'MLP 5 heartbeats averaged'
'MLP 12 heartbeats averaged'
'LSTM Single heartbeat'
'LSTM 5 heartbeats'
'LSTM 12 heartbeats'
'LSTM 5 heartbeats averaged'
'LSTM 12 heartbeats averaged'
'CNN Single heartbeat'
'CNN 5 heartbeats'
'CNN 12 heartbeats'
'CNN 5 heartbeats averaged'
'CNN 12 heartbeats averaged'
}
Binary_table = readtable('Binary_class_table')

Trinary_table = readtable('Trinary_class_prec_table')
Trinary_table_recall = readtable('Trinary_class_recall_table')

Feature_Train_bi_acc =  table2array(Binary_table(:,2));
Feature_Test_bi_acc =   table2array(Binary_table(:,3));
Signal_Train_bi_acc =   table2array(Binary_table(:,4));
Signal_Test_bi_acc =    table2array(Binary_table(:,5));
Feature_bi_spec =       table2array(Binary_table(:,6));
Signal_bi_spec =        table2array(Binary_table(:,7));
Feature_bi_sen =        table2array(Binary_table(:,8));
Signal_bi_sen =         table2array(Binary_table(:,9));

Feature_Train_Accuracy =    table2array(Trinary_table(:,2));
Feature_Prec_c1 =           table2array(Trinary_table(:,3));
Signal_Train_Accuracy =     table2array(Trinary_table(:,4));
Signal_Prec_c1 =            table2array(Trinary_table(:,5));
Feature_Prec_c2 =           table2array(Trinary_table(:,6));
Signal_Prec_c2 =            table2array(Trinary_table(:,7));
Feature_Prec_c3 =           table2array(Trinary_table(:,8));
Signal_Prec_c3 =            table2array(Trinary_table(:,9));

Feature_Recall_c1 =           table2array(Trinary_table_recall(:,1));
Signal_Recall_c1 =            table2array(Trinary_table_recall(:,2));
Feature_Recall_c2 =           table2array(Trinary_table_recall(:,3));
Signal_Recall_c2 =            table2array(Trinary_table_recall(:,4));
Feature_Recall_c3 =           table2array(Trinary_table_recall(:,5));
Signal_Recall_c3 =            table2array(Trinary_table_recall(:,6));

FN = [1:15]

figure(1)
set(gcf,'Units','centimeters','Position',[1 1 27 6])

% stem(FN,Feature_Train_bi_acc)
hold on
plot(FN,Feature_Train_bi_acc,'b')
plot(FN,Signal_Train_bi_acc)
plot(FN,Feature_Test_bi_acc)
plot(FN,Signal_Test_bi_acc)
xticks(FN)
xticklabels(name_vector)
xtickangle(25)
box off
ylim([0.6 1])
legend({'Feature based model accuracy, training dataset','Signal based model accuracy, training dataset','Feature based model accuracy, testing dataset','Signal based model accuracy, testing dataset'})
legend('Location','eastoutside')
% legend('Orientation','horizontal')
% lgd.NumColumns = 2;
legend('boxoff')

figure(2)
set(gcf,'Units','centimeters','Position',[1 1 25 6])

% stem(FN,Feature_Train_bi_acc)
hold on
plot(FN,Feature_bi_sen)
plot(FN,Signal_bi_sen)
plot(FN,Feature_bi_spec)
plot(FN,Signal_bi_spec)
xticks(FN)
xticklabels(name_vector)
xtickangle(25)
box off
ylim([0 1])
legend({'Feature based model sensitivity','Signal based model sensitivity','Feature based model specificity','Signal based model specificity'})
legend('Location','eastoutside')
legend('boxoff')



figure(3)


set(gcf,'Units','centimeters','Position',[1 1 27 6])

% stem(FN,Feature_Train_bi_acc)
hold on
plot(FN,Feature_Prec_c1)
plot(FN,Feature_Prec_c2)
plot(FN,Feature_Prec_c3)

plot(FN,Signal_Prec_c1)
plot(FN,Signal_Prec_c2)
plot(FN,Signal_Prec_c3)

xticks(FN)
xticklabels(name_vector)
xtickangle(25)
box off
ylim([0 1])
legend({'Feature based trinary model precision class 1','Feature based trinary model precision class 2','Feature based trinary model precision class 3','Signal based trinary model precision class 1','Signal based trinary model precision class 2','Signal based trinary model precision class 3'})
legend('Location','eastoutside')
legend('boxoff')


figure(4)


set(gcf,'Units','centimeters','Position',[1 1 27 6])

% stem(FN,Feature_Train_bi_acc)
hold on
plot(FN,Feature_Recall_c1)
plot(FN,Feature_Recall_c2)
plot(FN,Feature_Recall_c3)

plot(FN,Signal_Recall_c1)
plot(FN,Signal_Recall_c2)
plot(FN,Signal_Recall_c3)

xticks(FN)
xticklabels(name_vector)
xtickangle(25)
box off
ylim([0 1])
legend({'Feature based trinary model recall class 1','Feature based trinary model recall class 2','Feature based trinary model recall class 3','Signal based trinary model recall class 1','Signal based trinary model recall class 2','Signal based trinary model recall class 3'})
legend('Location','eastoutside')
legend('boxoff')
% 
% exportgraphics(figure(1),'Binary accuracy.emf','ContentType','vector');
% exportgraphics(figure(2),'Binary sen_spec.emf','ContentType','vector');
% exportgraphics(figure(3),'Trinary precision.emf','ContentType','vector');
% exportgraphics(figure(4),'Trinary recall.emf','ContentType','vector');


