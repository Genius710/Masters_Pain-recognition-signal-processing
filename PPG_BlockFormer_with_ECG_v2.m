close all
clear all
clc

folder = fileparts(which(mfilename)); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

for iii = 51:51
    
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
    B(iii) = load(strcat('C:\OneDrive - Kaunas University of Technology\Aurimod2019_BMI\05_Data\Final\Aurimod',num,'\Aurimod',num,'.mat'));
%     B(iii) = load(strcat('C:\OneDrive - Kaunas University of Technology\[2021 Project] Pain & AI\05_Data\Final\painless',num,'\Painless',num,'.mat'));

    
    
%     test = load(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'CNAPBlockV2.mat'));
%     test = length(test.Input);
   fs =1000
%     signal = B(iii).Biopac.EarBioimpedance.Magnitude;
    signal = B(iii).Nautilus.PPG.EarRed;
%     signal = B(iii).Nautilus.PPG.EarIR;
%     plot(signal)
%     set(gcf,'Units','centimeters','Position',[1 1 6 4])
%     yticks([])
%     xticks([])
%     box off
%     exportgraphics(gcf,'Raw IPD.emf','ContentType','vector')
    if 1
        sig_name = 'signal'
band = [0.5 10] % Hz;

band = band*2/fs;

% [b1,a1] = fir1(1000,band(1),'high');
% [b2,a2] = fir1(1000,band(2),'low');
[b1,a1] = butter(4,band(1),'high');
[b2,a2] = butter(2,band(2),'low');

                    if 1 %flip
                        signal_filtered =eval(sig_name);
                        signal_filtered = -1*signal_filtered;
                    else 
                        signal_filtered =eval(sig_name) ;
                    end
                    signal_filtered = filtfilt(b1,a1,signal_filtered);
                    plot(signal_filtered)
                       
                    %sig_name = 'signal_filtered'                 
                    signal_filtered = filtfilt(b2,a2,signal_filtered);

f_signal = signal_filtered;
    end

    
    %% ecg 

[indeksai, hrvSeka, rrSeka] = fun_qrsDetector(B(iii).Nautilus.Biopotential.ECG.Lead2, 300, 2000)

peaks = indeksai/2;




% PPG_signal = f_signal - min(f_signal);
PPG_signal = f_signal;
%% parameter extraction
yyy =1;
in = 1;
mid = peaks(1)
out = peaks(2)

    [E(iii).PPG.Min(yyy),E(iii).PPG.MinIndex(yyy)] = min(PPG_signal(in:in+(mid-in)/2));
    E(iii).PPG.MinIndex(yyy) = int32(E(iii).PPG.MinIndex(yyy)+round(in));
    [E(iii).PPG.Max(yyy),E(iii).PPG.MaxIndex(yyy)] = max(PPG_signal(E(iii).PPG.MinIndex(yyy):mid));
    E(iii).PPG.MaxIndex(yyy) = int32(E(iii).PPG.MaxIndex(yyy)+E(iii).PPG.MinIndex(yyy));

for yyy =2 : length(peaks)-1
    in = peaks(yyy-1);
    out =peaks(yyy+1);
    mid =peaks(yyy);

    [E(iii).PPG.Min(yyy),E(iii).PPG.MinIndex(yyy)] = min(PPG_signal(in:in+(mid-in)/2));
    E(iii).PPG.MinIndex(yyy) = int32(E(iii).PPG.MinIndex(yyy)+round(in));
    [E(iii).PPG.Max(yyy),E(iii).PPG.MaxIndex(yyy)] = max(PPG_signal(E(iii).PPG.MinIndex(yyy):mid));
    E(iii).PPG.MaxIndex(yyy) = int32(E(iii).PPG.MaxIndex(yyy)+E(iii).PPG.MinIndex(yyy));

    
% Pain = nprs_re(yyy);
%         E(iii).NPRS(yyy) = Pain;
%         E(iii).NPRST(yyy) = mid/100;
%         Data(iii).Pain(yyy) = Pain;
%         Data(iii).PainTime(yyy) = mid/100;
%         
%         if Pain == 0 || Pain == NaN
%         E(iii).Block(yyy).Pain = [1 zeros(1,100)];
%         else
% %             yyy
% %             Pain
%         E(iii).Block(yyy).Pain = [zeros(1,Pain) 1 zeros(1,100-Pain)];
%         end
end



    %% nprs remap

t= E(iii).PPG.MaxIndex(:)/fs;

nprs_raw =[0 B(iii).PainValue.PainValue' 0];
nprs_raw_t =[0 B(iii).PainValue.Time' max(B(iii).Nautilus.PPG.Time)]

nprs_raw = [nprs_raw 0]
nprs_raw_t = [nprs_raw_t B(iii).PhaseTime.ColdWater10C.Start]

nprs_re = round( interp1(nprs_raw_t,nprs_raw,t));
nprs_re(isnan(nprs_re)) = 0;
nprs_re(isinf(nprs_re)) = 0;

for yyy =1: length(E(iii).PPG.Max)-1
Data(iii).Blocks(yyy).Pain = nprs_re(yyy);
Data(iii).Blocks(yyy).PainTime = t(yyy);
end

%% block forming    
    for yyy =1: length(E(iii).PPG.Max)-1
        
        E(iii).Block(yyy).PPG.Max = E(iii).PPG.Max(yyy);
        E(iii).Block(yyy).PPG.Min = E(iii).PPG.Min(yyy+1);
        
        E(iii).Block(yyy).PPG.MaxIndex = E(iii).PPG.MaxIndex(yyy);
        E(iii).Block(yyy).PPG.MinIndex = E(iii).PPG.MinIndex(yyy+1);
        
        Data(iii).Blocks(yyy).Start = E(iii).PPG.MinIndex(yyy);
        Data(iii).Blocks(yyy).End = E(iii).PPG.MinIndex(yyy+1);
        Data(iii).Blocks(yyy).Max = E(iii).PPG.MaxIndex(yyy);
        
        
    end
    Data(iii).Blocks(1).Start =1;
    
    for yyy =2: length(E(iii).PPG.Max)-1
        
        E(iii).Block(yyy).PPG.Signal = PPG_signal(E(iii).Block(yyy-1).PPG.MinIndex:E(iii).Block(yyy).PPG.MinIndex);
        E(iii).Block(yyy).PPG.Org.Signal = signal(E(iii).Block(yyy-1).PPG.MinIndex:E(iii).Block(yyy).PPG.MinIndex);


    end
    
    
   Data(iii).Signal = PPG_signal;
    
Data(iii).Raw_Signal = signal;
Data(iii).Diff(1).Signal = diff(Data(iii).Signal);
for xxx =2:6
Data(iii).Diff(xxx).Signal = diff(Data(iii).Diff(xxx-1).Signal);
end


%% normalization and resampling
Data(iii).Normalized.Signal = [];


for yyy =1: length(Data(iii).Blocks)
% tic
% Data(iii).Signal = PPG_signal;
if yyy ==1
    lim = Data(iii).Blocks(yyy).End/2;
   [~,Data(iii).Blocks(yyy).Start] = min(Data(iii).Signal(1:lim));
end

Sig_block = Data(iii).Signal(Data(iii).Blocks(yyy).Start:Data(iii).Blocks(yyy).End);
trig = 0;
for xxx =1:6
    if Data(iii).Blocks(yyy).Start <= xxx
        temp_start = Data(iii).Blocks(yyy).Start; 
    Data(iii).Blocks(yyy).Start = xxx+1;
    trig =0;
    end
    Data(iii).Diff(xxx).Blocks(yyy).Signal = Data(iii).Diff(xxx).Signal(Data(iii).Blocks(yyy).Start-xxx:Data(iii).Blocks(yyy).End-xxx);
    if trig
    Data(iii).Blocks(yyy).Start = temp_start;
    trig =0;
    end
end

% figure(5)
% plot(E(iii).Block(yyy).PPG.Signal)
% hold on
% plot(Sig_block)


%100
% in = Sig_block/max(Sig_block);
% 
% coefa = (in(length(Sig_block))-in(1))/length(Sig_block);
% coefb = in(1);
% tempt = 0:length(Sig_block)-1;
% baseline = coefa.*tempt+coefb;
% out = resample((in-baseline),100,length(Sig_block));
% out(1) = 0;
% out(100) = 0;
% new_coefa = coefa*length(Sig_block)/100;
% new_tempt = 0:99;
% new_baseline = new_coefa.*new_tempt+coefb;
% 
% 
% E(iii).Block(yyy).PPG.Signal = out+new_baseline';

%500
% in = Sig_block/max(Sig_block);
in = Sig_block;
coefa = (in(length(Sig_block))-in(1))/length(Sig_block);
coefb = in(1);
tempt = 0:length(Sig_block)-1;
baseline = coefa.*tempt+coefb;
out = resample((in-baseline),500,length(Sig_block));
out(1) = 0;
out(500) = 0;
new_coefa = coefa*length(Sig_block)/500;
new_tempt = 0:499;
new_baseline = new_coefa.*new_tempt+coefb;

% figure(5)
% subplot(1,4,1)
% plot(baseline)
% hold on
% plot(in)
% title("Only filtered")
% ylabel("Amplitude, ADC units")
% xlabel("Length, Datapoints")
% % figure(6)
% subplot(1,4,2)
% plot(in-baseline)
% % figure(7)
% title("Baseline removed")
% xlabel("Length, Datapoints")
% subplot(1,4,3)
% plot(out)
% xlim([0 500])
% % figure(8)
% title("Unified length to 500units")
% xlabel("Length, Datapoints")
% subplot(1,4,4)
% plot(new_baseline)
% hold on
% plot(out+new_baseline)
% xlim([0 500])
% title("Baseline restored")
% xlabel("Length, Datapoints")


Data(iii).Blocks(yyy).Signal = (in-baseline);
Data(iii).Blocks(yyy).Baseline.a = coefa;
Data(iii).Blocks(yyy).Baseline.b = coefb;
 
Data(iii).Normalized.Blocks(yyy).Signal = out;
Data(iii).Normalized.Blocks(yyy).Baseline.a = new_coefa;
Data(iii).Normalized.Blocks(yyy).Baseline.b = coefb;

Data(iii).Normalized.Signal = [ Data(iii).Normalized.Signal  Data(iii).Normalized.Blocks(yyy).Signal ];




for xxx =1:6
    Sig_block = Data(iii).Diff(xxx).Blocks(yyy).Signal;
    
    %500
in = Sig_block;

% coefa = (in(length(Sig_block))-in(1))/length(Sig_block);
% coefb = in(1);
% tempt = 0:length(Sig_block)-1;
% baseline = coefa.*tempt+coefb;
out = resample((in),500,length(Sig_block));
% out(1) = 0;
% out(500) = 0;
% new_coefa = coefa*length(Sig_block)/500;
% new_tempt = 0:499;
% new_baseline = new_coefa.*new_tempt+coefb;

Data(iii).Normalized.Diff(xxx).Blocks(yyy).Signal = out;
% figure(5)
% hold on
% plot(out)
% Data(iii).Normalized.Diff(xxx).Blocks(yyy).Baseline = new_baseline;

end


% figure(5)
% hold on
% plot(Data(iii).Blocks(yyy).Signal)
% plot(Data(iii).Blocks(yyy).Normalized_Signal)
% 
% figure(6)
% hold on
% plot(Data(iii).Blocks(yyy).Baseline)
% plot(Data(iii).Blocks(yyy).Normalized_Baseline)
% if yyy == 500
%     yyy
% end
% toc
end
%% extra data
Data(iii).SubjectData = B(iii).SubjectData;
Data(iii).PhaseTime = B(iii).PhaseTime;
%% saving
Blocks = Data(iii)
save(strcat('C:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'PPG_Ear_Red_Final_Struct.mat'),'Blocks');
end


% save(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\PPG_Final_Struct_All.mat'),'Data');


