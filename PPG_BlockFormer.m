close all
clear all
clc

folder = fileparts(which(mfilename)); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

for iii = 1:1
    
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
    test = load(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'CNAPBlockV2.mat'));
    test = length(test.Input);
   fs =1000
    signal = B(iii).Nautilus.PPG.FingerIR;
%     signal = B(iii).Nautilus.PPG.FingerRed;
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
                       
                    %sig_name = 'signal_filtered'                 
                    signal_filtered = filtfilt(b2,a2,signal_filtered);
%                     if 1 %flip
%                         signal_filtered = -1*signal_filtered;
%                     end
f_signal = signal_filtered;
    end

stdf_signal = std_norm(f_signal,1E-3);

    d_signal = diff(stdf_signal);
    
        if 1
        sig_name = 'd_signal'
band = [0.5 10] % Hz;

band = band*2/fs;

% [b1,a1] = fir1(1000,band(1),'high');
% [b2,a2] = fir1(1000,band(2),'low');
[b1,a1] = butter(4,band(1),'high');
[b2,a2] = butter(2,band(2),'low');

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
md_signal = signal_filtered;
        end
        
a = 1
b = ones(1,200)./200;

loop =1;
std_lim = 1E-4;
ratio = 0.15;
threshold = 75;
step_size = 0.01
yyy =1
   
i_signal = filtfilt(b,a,md_signal.^2);
while(loop)
    
        s_signal = std_norm(i_signal,std_lim);
         i_signal = filtfilt(b,a,s_signal);
          plot(i_signal)
    [peaks,peak_value] = peak_detection(i_signal,400,fs,ratio);
    var = length(peaks)

    if var-test > 0
        std_lim = std_lim - step_size/1000;
        ratio =ratio+step_size;
        difference(yyy) = 1;
    end
    if var-test <0
        std_lim = std_lim + step_size/1000;
        ratio = ratio-step_size;
        difference(yyy) = -1;
    end

    
    
    if yyy>4 && abs(var-test)~=0
        vect =[difference(yyy),difference(yyy-1),difference(yyy-2),difference(yyy-3)]
        if mean(vect)==0
            step_size = step_size -0.0001
        end
        if step_size < 0.002
            if  var-test < 0
                loop = 0
                last_err = var-test
            end
        end
    end
    
    if abs(var-test) < threshold
        loop = 0
        last_err = var-test
    else
        last_err = var-test
    end
    yyy = yyy+1
end
err_log(iii) = last_err;
    
    figure(iii)
    subplot(3,1,1)
    plot(f_signal)
    hold on 
    stem(peaks,peak_value)
    subplot(3,1,2)
    plot(i_signal)
    hold on 
    stem(peaks,peak_value)
    subplot(3,1,3)
    plot(signal-mean(signal))
    hold on 
    stem(peaks,peak_value)
    length(peaks)
    
    %% nprs remap

t= peaks/fs;
nprs_raw =[0 B(iii).PainValue.PainValue' 0];
nprs_raw_t =[0 B(iii).PainValue.Time' max(B(iii).CNAP.Hemodynamics.BeatTime)]
nprs_raw = [nprs_raw 0]
nprs_raw_t = [nprs_raw_t B(iii).PhaseTime.ColdWater10C.Start]

nprs_re = round( interp1(nprs_raw_t,nprs_raw,t));
nprs_re(isnan(nprs_re)) = 0;
nprs_re(isinf(nprs_re)) = 0;

PPG_signal = f_signal;

%% ecg 

[indeksai, hrvSeka, rrSeka] = fun_qrsDetector(B(iii).Nautilus.Biopotential.ECG.Lead2, 300, 2000)

peaks2 = indeksai/2;


%% parameter extraction
for yyy =5 : length(peaks)-1
    in = peaks(yyy-1);
    out =peaks(yyy+1);
    mid =peaks(yyy);

    [E(iii).PPG.Min(yyy),E(iii).PPG.MinIndex(yyy)] = min(PPG_signal(in:mid));
%     plot(B(iii).Nautilus.PPG.FingerRed(t_in*100:E(iii).PPG.MaxIndex(yyy)))
%     E(iii).PPG.MinIndex(yyy) = E(iii).PPG.MinIndex(yyy)+in;
    E(iii).PPG.MinIndex(yyy) = E(iii).PPG.MinIndex(yyy);
    
    [E(iii).PPG.Max(yyy),E(iii).PPG.MaxIndex(yyy)] = max(PPG_signal(E(iii).PPG.MinIndex(yyy):mid+300));
%     plot(B(iii).Nautilus.PPG.FingerRed(t_in*100+20:t_out*100))
    E(iii).PPG.MaxIndex(yyy) = E(iii).PPG.MaxIndex(yyy); 
%     E(iii).PPG.MaxIndex(yyy) = E(iii).PPG.MaxIndex(yyy)+E(iii).PPG.MinIndex(yyy); 
    

    
%     if  E(iii).PPG.MinIndex(yyy) >E(iii).PPG.MaxIndex(yyy)
%      tvec = in:mid+300;
    vvec = PPG_signal(in:mid+300);
%     
%     figure(4)
    plot(vvec)
    hold on
%       stem(      E(iii).PPG.MinIndex(yyy),      PPG_signal(E(iii).PPG.MinIndex(yyy)-in))
%       
% %      stem(E(iii).PPG.MaxIndex(yyy),E(iii).PPG.Max(yyy));
% %      stem(E(iii).PPG.MinIndex(yyy),E(iii).PPG.Min(yyy));
%      hold off
%     
%     end

Pain = nprs_re(yyy);
        E(iii).NPRS(yyy) = Pain;
        E(iii).NPRST(yyy) = mid/100;
        
        if Pain == 0 || Pain ==NaN
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
    for yyy =5: length(E(iii).PPG.Max)
        
        E(iii).Block(yyy).PPG.Max = E(iii).PPG.Max(yyy);
        E(iii).Block(yyy).PPG.Min = E(iii).PPG.Min(yyy);
        
        E(iii).Block(yyy).PPG.MaxIndex = E(iii).PPG.MaxIndex(yyy);
        E(iii).Block(yyy).PPG.MinIndex = E(iii).PPG.MinIndex(yyy);      
        
    end
    
    for yyy =5: length(E(iii).PPG.Max)-1
        
        E(iii).Block(yyy).PPG.Rise = E(iii).Block(yyy).PPG.MaxIndex- E(iii).Block(yyy).PPG.MinIndex;
        E(iii).Block(yyy).PPG.Fall = E(iii).Block(yyy+1).PPG.MinIndex- E(iii).Block(yyy).PPG.MaxIndex;
        E(iii).Block(yyy).PPG.Signal = PPG_signal(E(iii).Block(yyy).PPG.MinIndex:E(iii).Block(yyy+1).PPG.MinIndex);
%         figure(6)
%         plot(E(iii).Block(yyy).PPG.Signal )

    end
    
    
    E(iii).Block = E(iii).Block(5:end-1);
    E(iii).NPRS = E(iii).NPRS(5:end-1);
    E(iii).NPRST = E(iii).NPRST(5:end-1);


%% normalization and resampling

PPGMaxSys = max( PPG_signal);

RP =0
FP =0
for yyy =1: length(E(iii).Block)

  RP = [RP E(iii).Block(yyy).PPG.Rise];
  FP = [FP E(iii).Block(yyy).PPG.Fall];
  
end

PPGRiseMax = max(RP);
PPGFallMax = max(FP);


for yyy =1: length(E(iii).Block)

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
%         figure(5)
%         plot(Input(yyy,:))
%         
        
    end
        NPRS = E(iii).NPRS;
        NPRST =E(iii).NPRST;
      plot(Input(:,103));
     save(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'PPGBlockV3IR.mat'),'Input', 'Label','NPRS','NPRST');
         clear Input;
         clear Label;
         clear NPRS;
         clear NPRST;

end