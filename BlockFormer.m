% clear all
% close all
% clc

clear E

 form = [ 1 2 3 4 7 13 15 35 36 23]
for iii = 10:51
    
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
%     B(iii).Nautilus.PPG = A.Nautilus.PPG;
%     B(iii).Nautilus.Biopotential = A.Nautilus.Biopotential; 
%     B(iii).CNAP = A.CNAP;
%     B(iii).PainValue=A.PainValue;
%     B(iii).PhaseTime = A.PhaseTime;
%     clear A;
    
%     load(strcat('D:\OneDrive - Kaunas University of Technology\Burimod2019_BMI\05_Data\Final\Burimod',num,'\Burimod',num,'.mat'));
    clear ax
    close all
    folder = fileparts(which(mfilename)); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

%% ecg R detection
    if 1
        [index] = fun_qrsDetector(B(iii).Nautilus.Biopotential.ECG.Lead2,200,2000);
%        [rr,peaks,peak_value,f_signal,p2_signal] = ecg_peak_detector(B(iii).Nautilus.Biopotential.ECG.Lead2,2000,B(iii).Nautilus.Biopotential.ECG.Time);
%        figure
% %        plot(index-peaks(1:2206))
       
%       plot(B(iii).Nautilus.Biopotential.ECG.Lead2)
%        hold on 
%         stem(index,ones(1,length(index)))
        
    end
    %% ppg filtering
    if 1
        sig_name = 'B(iii).Nautilus.PPG.FingerRed'
band = [0.5 7] % Hz;
fs =1000;
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
                       
                    %sig_name = 'signal_filtered'                 
                    signal_filtered = filtfilt(b2,a2,signal_filtered);
%                     if 1 %flip
%                         signal_filtered = -1*signal_filtered;
%                     end
PPG_signal = signal_filtered;
end
%% nprs remap

t= 0:0.1:max(B(iii).CNAP.Hemodynamics.BeatTime);
nprs_raw =[0 B(iii).PainValue.PainValue' 0];
nprs_raw_t =[0 B(iii).PainValue.Time' max(B(iii).CNAP.Hemodynamics.BeatTime)]
nprs_raw = [nprs_raw 0]
nprs_raw_t = [nprs_raw_t B(iii).PhaseTime.ColdWater10C.Start]

nprs_re = round( interp1(nprs_raw_t,nprs_raw,t));

%% parameter extraction
for yyy =2 : length(index)-1
    in = round(index(yyy-1)/2);
    out =round(index(yyy+1)/2);
    mid =round(index(yyy)/2);
    
    
%     range = t_in:0.01:t_mid;
%     range = round(range*100);
    [E(iii).PPG.Max(yyy),E(iii).PPG.MaxIndex(yyy)] = max(PPG_signal(in:mid));
    E(iii).PPG.MaxIndex(yyy) = E(iii).PPG.MaxIndex(yyy) +in-1; 
   
%     E(iii).Time*yyy) = t_mid;
%     plot(PPG_signal(tin:tout))
    [E(iii).PPG.Min(yyy),E(iii).PPG.MinIndex(yyy)] = min(PPG_signal(in:E(iii).PPG.MaxIndex(yyy)));
    E(iii).PPG.MinIndex(yyy) = E(iii).PPG.MinIndex(yyy) +in-1;
%     if  E(iii).PPG.MinIndex(yyy) >E(iii).PPG.MaxIndex(yyy)
% %     tvec = t_in:0.001:t_out;
%     vvec = PPG_signal(in:mid);
%     
%     figure(1)
%     plot(vvec)
%     hold on
% %      stem(round(t_mid*1000),PPG_signal(round(t_mid*1000)))
%      stem(E(iii).PPG.MaxIndex(yyy),E(iii).PPG.Max(yyy));
%      stem(E(iii).PPG.MinIndex(yyy),E(iii).PPG.Min(yyy));
% %     
%     end

    t_in = (index(yyy-1)/2000)+(index(yyy)/2000);
    t_in = round(t_in*100/2)/100;
    
      t_mid =index(yyy)/2000;
    
    t_out = (index(yyy)/2000)+(index(yyy+1)/2000);
    t_out = round(t_out*100/2)/100+20;
    
%     [E(iii).CNAP.Max(yyy),E(iii).CNAP.MaxIndex(yyy)] = max(B(iii).CNAP.ABPWave.Wave(t_in*100+20:t_out*100));
% %     plot(B(iii).CNAP.ABPWave.Wave(t_in*100+20:t_out*100))
%     E(iii).CNAP.MaxIndex(yyy) = E(iii).CNAP.MaxIndex(yyy) +round(t_in*100)-1+20; 
%     
%     [E(iii).CNAP.Min(yyy),E(iii).CNAP.MinIndex(yyy)] = min(B(iii).CNAP.ABPWave.Wave(t_in*100:E(iii).CNAP.MaxIndex(yyy)));
% %     plot(B(iii).CNAP.ABPWave.Wave(t_in*100:E(iii).CNAP.MaxIndex(yyy)))
%     E(iii).CNAP.MinIndex(yyy) = E(iii).CNAP.MinIndex(yyy) +round(t_in*100)-1;
%     
%         if  E(iii).CNAP.MinIndex(yyy) >E(iii).CNAP.MaxIndex(yyy)
% %     tvec = t_in:0.001:t_out;
%     vvec = B(iii).CNAP.ABPWave.Wave(t_in*100:t_out*100);
    
%     figure(1)
%     plot(vvec)
%     hold on
% %      stem(round(t_mid*1000),PPG_signal(round(t_mid*1000)))
%      stem(E(iii).CNAP.MaxIndex(yyy)-round(t_in*100),E(iii).CNAP.Max(yyy));
%      stem(E(iii).CNAP.MinIndex(yyy)-round(t_in*100),E(iii).CNAP.Min(yyy));
% %     
%         end
    
   round(t_mid*10)
   if round(t_mid*10) <1
       t_mid = 0.1
   end
   if round(t_mid*10) >length(nprs_re)
       t_mid = length(nprs_re)/10
   end
        Pain = nprs_re(round(t_mid*10));
        E(iii).NPRS(yyy) = Pain;
        E(iii).NPRST(yyy) = t_mid*10;
        
        if Pain == 0
        E(iii).Block(yyy).Pain = [1 zeros(1,100)];
        else
%             yyy
%             Pain
        E(iii).Block(yyy).Pain = [zeros(1,Pain) 1 zeros(1,100-Pain)];
        end
end

clear nprs_raw
clear nprs_raw_t
clear nprs_re
clear t

%% block forming    
    for yyy =1: length(E(iii).PPG.Max)
        
        E(iii).Block(yyy).PPG.Max = E(iii).PPG.Max(yyy);
        E(iii).Block(yyy).PPG.Min = E(iii).PPG.Min(yyy);
        
        E(iii).Block(yyy).PPG.MaxIndex = E(iii).PPG.MaxIndex(yyy);
        E(iii).Block(yyy).PPG.MinIndex = E(iii).PPG.MinIndex(yyy);
        
%         E(iii).Block(yyy).CNAP.Max = E(iii).CNAP.Max(yyy);
%         E(iii).Block(yyy).CNAP.Min = E(iii).CNAP.Min(yyy);
%         
%         E(iii).Block(yyy).CNAP.MaxIndex = E(iii).CNAP.MaxIndex(yyy);
%         E(iii).Block(yyy).CNAP.MinIndex = E(iii).CNAP.MinIndex(yyy);
        
        
    end
    
    for yyy =2: length(E(iii).PPG.Max)-1
        
        E(iii).Block(yyy).PPG.Rise = E(iii).PPG.MaxIndex(yyy)- E(iii).PPG.MinIndex(yyy);
        if E(iii).Block(yyy).PPG.Rise < 0
            plot(PPG_signal(E(iii).Block(yyy-1).PPG.MinIndex:E(iii).Block(yyy).PPG.MinIndex))
            hold on
            stem( E(iii).PPG.MaxIndex(yyy)-E(iii).Block(yyy-1).PPG.MinIndex,1)
            
            stem(E(iii).PPG.MinIndex(yyy-1)-E(iii).Block(yyy-1).PPG.MinIndex,1)
            
        end
        E(iii).Block(yyy).PPG.Fall = E(iii).PPG.MinIndex(yyy+1)- E(iii).PPG.MaxIndex(yyy);
        E(iii).Block(yyy).PPG.Signal = PPG_signal(E(iii).Block(yyy).PPG.MinIndex:E(iii).Block(yyy+1).PPG.MinIndex);
%         length(E(iii).Block(yyy).PPG.Signal)
%         plot(E(iii).Block(yyy).PPG.Signal)
        
%         E(iii).Block(yyy).CNAP.Rise = E(iii).CNAP.MaxIndex(yyy)- E(iii).CNAP.MinIndex(yyy);
%         E(iii).Block(yyy).CNAP.Fall = E(iii).CNAP.MinIndex(yyy+1)- E(iii).CNAP.MaxIndex(yyy);
%         E(iii).Block(yyy).CNAP.Signal = B(iii).CNAP.ABPWave.Wave(E(iii).Block(yyy).CNAP.MinIndex:E(iii).Block(yyy+1).CNAP.MinIndex);
        

    end
    
    E(iii).Block = E(iii).Block(2:end-1);
    E(iii).NPRS = E(iii).NPRS(2:end-1);
    E(iii).NPRST = E(iii).NPRST(2:end-1);
    
    
% 
% figure(3)
%         plot(B(iii).Nautilus.PPG.Time,  B(iii).Nautilus.PPG.FingerRed*-1);
%     hold on
%     for yyy =1: 5%length(E(iii).Block)
%     stem(E(iii).Block(yyy).PPG.MaxIndex/1000,    E(iii).Block(yyy).PPG.Max);
%     stem(E(iii).Block(yyy).PPG.MinIndex/1000,    E(iii).Block(yyy).PPG.Min);
%     end
%     stem(B(iii).CNAP.Hemodynamics.BeatTime(1:(length(E(iii).CNAP.Min))),E(iii).PPG.Min*-1);
    
%     figure(4)
%         plot(B(iii).CNAP.ABPWave.Time,B(iii).CNAP.ABPWave.Wave);
%     hold on
%     for yyy =1:5 %length(E(iii).Block)
%     stem(E(iii).Block(yyy).CNAP.MaxIndex/100,    E(iii).Block(yyy).CNAP.Max);
%     stem(E(iii).Block(yyy).CNAP.MinIndex/100,    E(iii).Block(yyy).CNAP.Min);
%     end
%      stem(B(iii).CNAP.Hemodynamics.BeatTime(1:(length(E(iii).CNAP.Min))),E(iii).CNAP.Min*-1);

%% normalization and resampling

PPGMaxSys = max( B(iii).Nautilus.PPG.FingerRed);
% CNAPMaxSys = max( B(iii).CNAP.ABPWave.Wave);
R =0;
F = 0;
RP =0
FP =0
for yyy =1: length(E(iii).Block)
%   R = [R E(iii).Block(yyy).CNAP.Rise];
%   F = [F E(iii).Block(yyy).CNAP.Fall];
  RP = [RP E(iii).Block(yyy).PPG.Rise];
  FP = [FP E(iii).Block(yyy).PPG.Fall];
  
end
CNAPRiseMax = max(R);
CNAPFallMax = max(F);
PPGRiseMax = max(RP);
PPGFallMax = max(FP);


for yyy =1: length(E(iii).Block)

% E(iii).Block(yyy).CNAP.Signal = E(iii).Block(yyy).CNAP.Signal - E(iii).Block(yyy).CNAP.Min;
% E(iii).Block(yyy).CNAP.Signal = E(iii).Block(yyy).CNAP.Signal / max(E(iii).Block(yyy).CNAP.Signal);
% E(iii).Block(yyy).CNAP.Signal = resample(E(iii).Block(yyy).CNAP.Signal,100,length(E(iii).Block(yyy).CNAP.Signal));
% E(iii).Block(yyy).CNAP.Rise = E(iii).Block(yyy).CNAP.Rise./CNAPRiseMax;
% E(iii).Block(yyy).CNAP.Fall =E(iii).Block(yyy).CNAP.Fall./CNAPFallMax; 
% E(iii).Block(yyy).CNAP.Max = E(iii).Block(yyy).CNAP.Max/ CNAPMaxSys;
% E(iii).Block(yyy).CNAP.Min = E(iii).Block(yyy).CNAP.Min/ CNAPMaxSys;

% plot(E(iii).Block(yyy).PPG.Signal)
local_min = E(iii).Block(yyy).PPG.Min;
if local_min<0
    E(iii).Block(yyy).PPG.Signal = E(iii).Block(yyy).PPG.Signal - E(iii).Block(yyy).PPG.Min;
else
    E(iii).Block(yyy).PPG.Signal = E(iii).Block(yyy).PPG.Signal + E(iii).Block(yyy).PPG.Min;
end

% plot(E(iii).Block(yyy).PPG.Signal)
E(iii).Block(yyy).PPG.Signal = E(iii).Block(yyy).PPG.Signal / abs(max(E(iii).Block(yyy).PPG.Signal));
% plot(E(iii).Block(yyy).PPG.Signal)
E(iii).Block(yyy).PPG.Signal = resample(E(iii).Block(yyy).PPG.Signal,100,length(E(iii).Block(yyy).PPG.Signal));


% plot(E(iii).Block(yyy).PPG.Signal)
E(iii).Block(yyy).PPG.Rise = E(iii).Block(yyy).PPG.Rise./PPGRiseMax;
E(iii).Block(yyy).PPG.Fall =E(iii).Block(yyy).PPG.Fall./PPGFallMax; 
E(iii).Block(yyy).PPG.Max = E(iii).Block(yyy).PPG.Max/ PPGMaxSys;
E(iii).Block(yyy).PPG.Min = E(iii).Block(yyy).PPG.Min/ PPGMaxSys;

end




%% final signal generation CNAP
%     for yyy =1: length(E(iii).Block)
%         
%         a = E(iii).Block(yyy).CNAP.Signal;
%         [x,y] = size(a)
%         if x>y
%             a = a';
%         end
%         clear x
%         clear y
%         b = E(iii).Block(yyy).CNAP.Max;
%         c = E(iii).Block(yyy).CNAP.Min;
%         d = E(iii).Block(yyy).CNAP.Rise;
%         e = E(iii).Block(yyy).CNAP.Fall;
%         Input(yyy,1:100+4) = [a b c d e ];
%         
%         Label(yyy,:) = E(iii).Block(yyy).Pain;
%         
%     end
%         NPRS = E(iii).NPRS;
%         NPRST =E(iii).NPRST;
% %     plot(Input(:,104));
%      save(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'CNAPBlock.mat'),'Input', 'Label','NPRS','NPRST');
%          clear Input;
%          clear Label;
%          clear NPRS;
clear NPRST;
         
         %% final signal generation PPG
    for yyy =1: length(E(iii).Block)
        
        a = E(iii).Block(yyy).PPG.Signal;
%         plot(E(iii).Block(yyy).PPG.Signal)
        [x,y] = size(a);
        if x>y
            a = a';
        end
        clear x
        clear y
        b = E(iii).Block(yyy).PPG.Max;
        c = E(iii).Block(yyy).PPG.Min;
        d = E(iii).Block(yyy).PPG.Rise;
        e = E(iii).Block(yyy).PPG.Fall;
        Input(yyy,1:100+4) = [a b c d e ];
        
        Label(yyy,:) = E(iii).Block(yyy).Pain;
        
        
    end
        NPRS = E(iii).NPRS;
        NPRST =E(iii).NPRST;
      plot(Input(:,103));
     save(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'PPGBlock.mat'),'Input', 'Label','NPRS','NPRST');
         clear Input;
         clear Label;
         clear NPRS;
         clear NPRST;
end 
% figure(2)   
% plot(C)