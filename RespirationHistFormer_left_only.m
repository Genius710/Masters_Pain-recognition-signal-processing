clear all
close all 
clc

folder = fileparts(which(mfilename)); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));


for iii = 1:51
    
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
    
    signal = B(iii).Biopac.Respiration.Respiration;
    signal = decimate(signal,10)
    fs = 100
%     pwelch(signal)
%     signal = B(iii).Nautilus.PPG.FingerRed;

    if 1
        sig_name = 'signal'
band = [0.5 10] % Hz;

band = band*2/fs;

% [b1,a1] = fir1(1000,band(1),'high');
% [b2,a2] = fir1(1000,band(2),'low');
% [b1,a1] = butter(4,band(1),'high');
[b2,a2] = fir1(100,0.01,'low');
 [b1,a1] = fir1(2000,0.001,'high');
% freqz(b2,a2)

                    if 0 %flip
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
f_signal = signal_filtered;
    end
    
%     hold on
%     plot(signal)
% mf = mean(f_signal)
% p_signal = f_signal -mf ;
% p_signal =p_signal +abs(min(p_signal))
p_signal = diff(f_signal);
% p_signal = diff(f_signal);
p_signal = medfilt1(p_signal,3)
[peaks,peak_value] = peak_detection(p_signal,2500,fs,0.25)
% [min_peaks,min_peak_value] = peak_detection(-1*f_signal,2500,fs,0.5)
% [peak_value,peaks] = findpeaks(f_signal)
% [x_max,y_max] = get_max1(f_signal,1000)

%     figure(1)
%     plot(f_signal)
%     hold on
%     stem(peaks,f_signal(peaks))
%     figure(2)
%     plot(p_signal)
%     hold on
%     stem(peaks,p_signal(peaks))
%     stem(min_peaks,min_peak_value)

t= peaks/fs;
nprs_raw =[0 B(iii).PainValue.PainValue' 0];
nprs_raw_t =[0 B(iii).PainValue.Time' max(B(iii).CNAP.Hemodynamics.BeatTime)]
nprs_raw = [nprs_raw 0]
nprs_raw_t = [nprs_raw_t B(iii).PhaseTime.ColdWater10C.Start]

nprs_re = round( interp1(nprs_raw_t,nprs_raw,t));
nprs_re(isnan(nprs_re)) = 0;
nprs_re(isinf(nprs_re)) = 0;

PPG_signal = f_signal- mean(f_signal);
PPG_signal = PPG_signal./max(PPG_signal);
plot(PPG_signal);

for yyy =2 : length(peaks)-1
    in = peaks(yyy-1);
    out =peaks(yyy+1);
    mid =peaks(yyy);

    [E(iii).RSP.Min(yyy),E(iii).RSP.MinIndex(yyy)] = min(PPG_signal(in+150:mid));
%     plot(B(iii).Nautilus.PPG.FingerRed(t_in*100:E(iii).PPG.MaxIndex(yyy)))
    E(iii).RSP.MinIndex(yyy) = E(iii).RSP.MinIndex(yyy)+in+150;
    
    [E(iii).RSP.Max(yyy),E(iii).RSP.MaxIndex(yyy)] = max(PPG_signal(mid:mid+300));
% %     plot(B(iii).Nautilus.PPG.FingerRed(t_in*100+20:t_out*100))
    E(iii).RSP.MaxIndex(yyy) = E(iii).RSP.MaxIndex(yyy)+mid; 
%     

    
%     if  E(iii).PPG.MinIndex(yyy) >E(iii).PPG.MaxIndex(yyy)
%      tvec = in:out;
%     vvec = PPG_signal(in:out);
%     
% %     
%     figure(4)
%     plot(tvec,vvec)
%     hold on
%       stem(      mid,      PPG_signal(mid))
%       
%       stem(E(iii).RSP.MaxIndex(yyy),E(iii).RSP.Max(yyy));
%      stem(E(iii).RSP.MinIndex(yyy),E(iii).RSP.Min(yyy));
%      hold off
%     
%     end

Pain = nprs_re(yyy);
        E(iii).RSP.NPRS(yyy) = Pain;
        E(iii).RSP.NPRST(yyy) = mid/100;
       
        
end

for yyy =2 : length(E(iii).RSP.Max)-1
    E(iii).RSP.Volume(yyy) = sum(PPG_signal(E(iii).RSP.MinIndex(yyy):E(iii).RSP.MinIndex(yyy+1))-min(PPG_signal(E(iii).RSP.MinIndex(yyy):E(iii).RSP.MinIndex(yyy+1))));
end

%%normalization
st =2 
en = find( E(iii).RSP.NPRS)
en = en(1)
NormMax(iii) = mean(E(iii).RSP.Max(st:en))
NormMin(iii) = mean(E(iii).RSP.Min(st:en))
NormVol(iii) = mean(E(iii).RSP.Volume(st:en))
NormAC(iii) = mean(E(iii).RSP.Max(st:en)-E(iii).RSP.Min(st:en))


E(iii).RSP.NormMax = E(iii).RSP.Max/NormMax(iii);
E(iii).RSP.NormMin = E(iii).RSP.Min/abs(NormMin(iii));
E(iii).RSP.NormVolume = E(iii).RSP.Volume/NormVol(iii);


for yyy =2 : length(E(iii).RSP.Max)-1
    E(iii).RSP.Block(yyy).Max = E(iii).RSP.Max(yyy);
    E(iii).RSP.Block(yyy).Min = E(iii).RSP.Min(yyy);
    E(iii).RSP.Block(yyy).Volume = E(iii).RSP.Volume(yyy);
    E(iii).RSP.Block(yyy).AC = E(iii).RSP.Block(yyy).Max -E(iii).RSP.Block(yyy).Min;
    
    E(iii).RSP.Block(yyy).NormMax = E(iii).RSP.NormMax(yyy);
    E(iii).RSP.Block(yyy).NormMin = E(iii).RSP.NormMin(yyy);
    E(iii).RSP.Block(yyy).NormVolume = E(iii).RSP.NormVolume(yyy);
    E(iii).RSP.Block(yyy).NormAC =  E(iii).RSP.Block(yyy).AC/NormAC(iii);
    
    E(iii).RSP.Block(yyy).NPRS = E(iii).RSP.NPRS(yyy)
    E(iii).RSP.Block(yyy).NPRST = E(iii).RSP.NPRST(yyy)
end
E(iii).RSP.Block = E(iii).RSP.Block(2:end)
end






NPRS = []
Max = []
Min = []
Volume = []

NormMax = []
NormMin = []
NormVolume = []
AC =[]
NormAC= []
for iii =1 : 51
NPRS =[NPRS; [E(iii).RSP.Block(:).NPRS]'];
Max = [Max; [E(iii).RSP.Block(:).Max]'];
Min = [Min; [E(iii).RSP.Block(:).Min]'];
Volume = [Volume; [E(iii).RSP.Block(:).Volume]'];
AC = [AC; [E(iii).RSP.Block(:).AC]'];

NormMax = [NormMax; [E(iii).RSP.Block(:).NormMax]'];
NormMin = [NormMin; [E(iii).RSP.Block(:).NormMin]'];
NormVolume = [NormVolume; [E(iii).RSP.Block(:).NormVolume]'];
NormAC = [NormAC; [E(iii).RSP.Block(:).NormAC]'];

end
% 
for iii = 1:11
Block(iii).MaxB =[]
Block(iii).MinB = []
Block(iii).ACB = []
Block(iii).VolumeB = []

Block(iii).NormMaxB =[]
Block(iii).NormMinB = []
Block(iii).NormACB = []
Block(iii).NormVolumeB = []
end

NPRS = round(NPRS/10)
% AC = [(Max-Min)];
% NormAC = [(NormMax-NormMin)];

for xxx = 1:length(Volume)
    for yyy =1:11
        if NPRS(xxx) == yyy-1
            
            a = [Block(yyy).MaxB(:);Max(xxx);];
            clear  Block(yyy).MaxB
            Block(yyy).MaxB =a;
            clear a
            a = [ Block(yyy).MinB(:); Min(xxx)];
            clear  Block(yyy).MinB
            Block(yyy).MinB =a;
            clear a
            a = [ Block(yyy).ACB(:); AC(xxx)];
            clear  Block(yyy).ACB
            Block(yyy).ACB =a;
            clear a
            a = [ Block(yyy).VolumeB(:); Volume(xxx)];
            clear  Block(yyy).VolumeB
            Block(yyy).VolumeB =a;
            clear a
            
            a = [Block(yyy).NormMaxB(:);NormMax(xxx);];
            clear  Block(yyy).NormMaxB
            Block(yyy).NormMaxB =a;
            clear a
            a = [ Block(yyy).NormMinB(:); NormMin(xxx)];
            clear  Block(yyy).NormMinB
            Block(yyy).NormMinB =a;
            clear a
            a = [ Block(yyy).NormACB(:); NormAC(xxx)];
            clear  Block(yyy).NormACB
            Block(yyy).NormACB =a;
            clear a
            a = [ Block(yyy).NormVolumeB(:); NormVolume(xxx)];
            clear  Block(yyy).NormVolumeB
            Block(yyy).NormVolumeB =a;
            clear a
            
            
        end
    end
            
            
end 

load('RSP_Hist_blocks');

[countsx,binsx] = hist(NPRS,11);
 countsx(1) = countsx(1)/50 ;
 binsx = 0:10;
 
 nn =4
 mm = 11
for iii = 1:mm
subplot(nn,mm,iii)
[countsy,binsy] = hist(Block(iii).MaxB,10);
barh(binsy,countsy/max(countsy))
title(strcat('Max, Pain = ',string(iii-1),'/10'))
ylim([-1.5 1])
end
for iii = 1:mm
subplot(nn,mm,iii+11)
[countsy,binsy] = hist(Block(iii).MinB,10);
barh(binsy,countsy/max(countsy))
title(strcat('Min, Pain = ',string(iii-1),'/10'))
ylim([-4 1])
end
for iii = 1:mm
subplot(nn,mm,iii+22)
[countsy,binsy] = hist(Block(iii).MeanB,10);
barh(binsy,countsy/max(countsy))
title(strcat('Mean, Pain = ',string(iii-1),'/10'))
ylim([0 2])
end

subplot(nn,mm,34:44)
bar(binsx,countsx)
title('Pain levels, level 0 reduced by 50 times')