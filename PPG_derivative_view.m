close all
clear all
clc

folder = fileparts(which(mfilename)); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));
% load('C:\Users\Povilas-Predator-PC\Downloads\DIA802_E1.mat'

for iii = 10:10
    
%     if form(iii)< 10
%         num = strcat('0',string(form(iii)))
%     else
%     num = string(form(iii))
%     end
    if iii< 10
        num = strcat('0',string(iii))
    else
    num = string(iii)
    end
    clear B
    B(iii) = load(strcat('D:\OneDrive - Kaunas University of Technology\Aurimod2019_BMI\05_Data\Final\Aurimod',num,'\Aurimod',num,'.mat'));
%     test = load(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'CNAPBlockV2.mat'));
%     test = length(test.Input);
% load('C:\Users\Povilas-Predator-PC\Downloads\DIA802_E1.mat')
   fs =1000
%     fs =250
%     signal = B(iii).Biopac.EarBioimpedance.Magnitude;
    signal = B(iii).Nautilus.PPG.FingerRed;
    time = B(iii).Nautilus.PPG.Time;
%     signal = Data.PPG(:,2);
%     time = Data.Time_PPG


    if 1
        sig_name = 'signal'
band = [0.5 10] % Hz;

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
                    signal_filtered = filtfilt(b2,a2,signal_filtered);

f_signal = signal_filtered;
    end
end
% f_signal = signal;
    
figure(1)
ax(1)= subplot(6,1,1)
plot(time,f_signal)
signal = f_signal;
n_time = time
for iii =1:5
ax(1+iii) =subplot(6,1,iii+1)
signal = diff(signal);
n_time = n_time(2:end);
plot(n_time,signal)
end
linkaxes(ax,'x')

% figure(2)
% ax(1)= subplot(11,1,1)
% plot(time,f_signal)
% signal = f_signal;
% n_time = time
% for iii =1:10
% ax(1+iii) =subplot(11,1,iii+1)
% signal = diff(signal);
% n_time = n_time(2:end);
% plot(n_time,signal)
% end
% linkaxes(ax,'x')
