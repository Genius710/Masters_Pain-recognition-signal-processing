 close all
clear all
clc

startpath = '.';
[file,filepath]=uigetfile('.mat','Choose the file struct',startpath);
%dir_file=[filepath,file];
load([filepath,file]);
sig_name = 'signal.nautilus.PPG.ear.ir'
print_name = sig_name;
time_name = 'signal.nautilus.PPG.time'
%signal.MMR.gyro.time =signal.MMR.gyro.time- signal.MMR.gyro.time(1);
% x_values=[ 382 386 637 641 754 758 1177 1181]
x_values=[ 382 386 637 641 754 758 1177 1181 1850 1854]
y_label ='Amplidtude, ADC units';
autolim = 1;
ylimraw =[1.6E6 2.6E6];
ylimfil =[-1.5E5 1E5];
ylimq =[-7.5E4 5E4];
%y_ticksraw =
y_tick_sizer = (ylimraw(2)-ylimraw(1))/4;
y_tick_sizef = (ylimfil(2)-ylimfil(1))/5;
y_tick_size = (ylimq(2)-ylimq(1))/5;
if 1
band = [0.5 7] % Hz;
fs =1000;
band = band*2/fs;

[b1,a1] = butter(4,band(1),'high');
[b2,a2] = butter(2,band(2),'low');

                    if 1 %flip
                        signal_filtered =eval(sig_name);
                        signal_filtered = -1*signal_filtered;
                    else 
                        signal_filtered =eval(sig_name) ;
                    end
                    signal_filtered = filtfilt(b1,a1,signal_filtered);
                       
                    %sig_name = 'signal_filtered'                 
                    signal_filtered = filtfilt(b2,a2,signal_filtered);
%                     if 1 %flip
%                         signal_filtered = -1*signal_filtered;
%                     end
end
%% ploting mains
figure
subplot(3,5,[1 5])
plot(eval(time_name),eval(sig_name),'Color','black');
ylimm=get(gca,'ylim');
ylabel(y_label,'FontSize',8);
xlim([0 2200]);

if ~autolim  
    ylim(ylimraw)
    ylimm =ylimraw
    yticks([ylimm(1):y_tick_sizer:ylimm(2)]);
else
 ylim(ylimm)
end


print_set
title('Raw signal')
subplot(3,5,[6 10])
plot(eval(time_name),signal_filtered,'Color','black');
ylimm=get(gca,'ylim');
ylabel(y_label,'FontSize',8);
xlabel('Time, s','FontSize',8);
xlim([0 2200]);

if ~autolim  
    ylim(ylimfil)
    ylimm =ylimfil
    yticks([ylimm(1):y_tick_sizef:ylimm(2)]);
else
 ylim(ylimm)
 
end
 
print_set
title('Filtered signal')

%% ploting quads
 sig_name = 'signal_filtered'
%y_ticks = [-2:2:8]
ylimmax = -Inf;
ylimmin = Inf;
for iii =1:4
subplot(3,4,9)
plot(eval(time_name),eval(sig_name),'Color','black');
ylimm=get(gca,'ylim');
if ylimm(2) > ylimmax
    ylimmax = ylimm(2)
end
if ylimm(1) < ylimmin
    ylimmin = ylimm(1)
end
end


 if ~autolim  
    ylimm= ylimq
    y_ticks = [ylimm(1):y_tick_size:ylimm(2)];
else
 ylimm = [ylimmin ylimmax];
 
 end


subplot(3,5,11)
plot(eval(time_name),eval(sig_name),'Color','black');
xlim([x_values(1:2)])
ylim(ylimm);
yticks(y_ticks);
ylabel(y_label,'FontSize',8);
xlabel('Time, s','FontSize',8);
print_set
subplot(3,5,12)
plot(eval(time_name),eval(sig_name),'Color','black');
xlim([x_values(3:4)])

xticks([x_values(3):2:x_values(4)])
yticks(y_ticks);
ylim(ylimm);
xlabel('Time, s','FontSize',8);
print_set
subplot(3,5,13)
plot(eval(time_name),eval(sig_name),'Color','black');
xlim([x_values(5:6)])
ylim(ylimm);
yticks(y_ticks);
xlabel('Time, s','FontSize',8);
print_set
subplot(3,5,14)
plot(eval(time_name),eval(sig_name),'Color','black');
xlim([x_values(7:8)])
ylim(ylimm);
xticks([x_values(7):2:x_values(8)])
yticks(y_ticks);
xlabel('Time, s','FontSize',8);
print_set

subplot(3,5,15)
plot(eval(time_name),eval(sig_name),'Color','black');
xlim([x_values(9:10)])
ylim(ylimm);
yticks(y_ticks);
xlabel('Time, s','FontSize',8);
print_set
xticks([x_values(9):2:x_values(10)])

time = num2str(round(clock))
            time(isspace(time)) = [];
            savename = strcat(file,print_name,time);
%             exportgraphics(gcf,strcat(savename,'.emf'),'ContentType','vector');
            %print('-dtiff','-r400',savename)
            %strcat(savename,'.png'
%             crop(strcat(filepath,savename,'.png'),0)
%             crop(strcat('C:\Users\Povilas-Predator-PC\OneDrive - Kaunas University of Technology\Aurimod2019_BMI\Data\Raw\Aurimod01\',savename,'.png'),0)  
%             crop(strcat('D:\Aurimod cloud\OneDrive - Kaunas University of Technology\Aurimod2019_BMI\Data\Raw\Aurimod01\',savename,'.png'),0)
%             close gcf