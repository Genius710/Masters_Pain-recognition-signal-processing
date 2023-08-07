close all
clear all
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
%     test = load(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'CNAPBlockV2.mat'));
%     test = length(test.Input);
   fs =1000
%     signal = B(iii).Biopac.EarBioimpedance.Magnitude;
    signal = B(iii).Nautilus.PPG.FingerRed;
    plot(signal)
    set(gcf,'Units','centimeters','Position',[1 1 6 4])
    yticks([])
    xticks([])
    box off
%     exportgraphics(gcf,'Raw PPG.emf','ContentType','vector')
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
                    plot(signal_filtered)
                    set(gcf,'Units','centimeters','Position',[1 1 6 4])
                    yticks([])
                    xticks([])
                    box off
%                     exportgraphics(gcf,'Filtered PPG.emf','ContentType','vector')
%                     if 1 %flip
%                         signal_filtered = -1*signal_filtered;
%                     end
f_signal = signal_filtered;
    end

    
    %% ecg 

[indeksai, hrvSeka, rrSeka] = fun_qrsDetector(B(iii).Nautilus.Biopotential.ECG.Lead2, 300, 2000)

peaks = indeksai/2;

    %% nprs remap

t= peaks/fs;
nprs_raw =[0 B(iii).PainValue.PainValue' 0];
nprs_raw_t =[0 B(iii).PainValue.Time' max(B(iii).CNAP.Hemodynamics.BeatTime)]
nprs_raw = [nprs_raw 0]
nprs_raw_t = [nprs_raw_t B(iii).PhaseTime.ColdWater10C.Start]

nprs_re = round( interp1(nprs_raw_t,nprs_raw,t));
nprs_re(isnan(nprs_re)) = 0;
nprs_re(isinf(nprs_re)) = 0;

PPG_signal = f_signal - min(f_signal);


plot(PPG_signal)

%% parameter extraction
for yyy =2 : length(peaks)-1
    in = peaks(yyy-1);
    out =peaks(yyy+1);
    mid =peaks(yyy);

    [E(iii).PPG.Min(yyy),E(iii).PPG.MinIndex(yyy)] = min(PPG_signal(in:in+(mid-in)/2));
%     plot(B(iii).Nautilus.PPG.FingerRed(t_in*100:E(iii).PPG.MaxIndex(yyy)))
    E(iii).PPG.MinIndex(yyy) = E(iii).PPG.MinIndex(yyy)+in;
%     E(iii).PPG.MinIndex(yyy) = E(iii).PPG.MinIndex(yyy);
    
    [E(iii).PPG.Max(yyy),E(iii).PPG.MaxIndex(yyy)] = max(PPG_signal(E(iii).PPG.MinIndex(yyy):mid));
%     plot(B(iii).Nautilus.PPG.FingerRed(t_in*100+20:t_out*100))
%     E(iii).PPG.MaxIndex(yyy) = E(iii).PPG.MaxIndex(yyy); 
    E(iii).PPG.MaxIndex(yyy) = E(iii).PPG.MaxIndex(yyy)+E(iii).PPG.MinIndex(yyy); 
    
% plot(PPG_signal)
% hold on 
% stem(E(iii).PPG.MaxIndex(yyy),E(iii).PPG.Max(yyy))
% stem(E(iii).PPG.MinIndex(yyy),E(iii).PPG.Min(yyy))
% % stem(mid,0.05)
% xlim([in,out])
%  exportgraphics(gcf,'MinMax Detection.emf','ContentType','vector')
%     
%     if  E(iii).PPG.MinIndex(yyy) >E(iii).PPG.MaxIndex(yyy)
%      tvec = in:mid+300;
% figure(2)
%     vvec = PPG_signal(in:mid);
% %     
%     figure(4)
% %     plot([zeros(1,round(in)) ,vvec])
% plot(vvec)
%     hold on
% % %       stem(      E(iii).PPG.MinIndex(yyy),      PPG_signal(E(iii).PPG.MinIndex(yyy)-in))
% % %       
%      stem(E(iii).PPG.MaxIndex(yyy)-round(in),E(iii).PPG.Max(yyy));
%      stem(E(iii).PPG.MinIndex(yyy)-round(in),E(iii).PPG.Min(yyy));
%      hold off
% %     
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
    for yyy =1: length(E(iii).PPG.Max)-1
        
        E(iii).Block(yyy).PPG.Max = E(iii).PPG.Max(yyy);
        E(iii).Block(yyy).PPG.Min = E(iii).PPG.Min(yyy+1);
        
        E(iii).Block(yyy).PPG.MaxIndex = E(iii).PPG.MaxIndex(yyy);
        E(iii).Block(yyy).PPG.MinIndex = E(iii).PPG.MinIndex(yyy+1);      
        
    end
    
    for yyy =2: length(E(iii).PPG.Max)-1
        
        E(iii).Block(yyy).PPG.Rise = E(iii).Block(yyy).PPG.MaxIndex- E(iii).Block(yyy-1).PPG.MinIndex;
        E(iii).Block(yyy).PPG.Fall = E(iii).Block(yyy).PPG.MinIndex- E(iii).Block(yyy).PPG.MaxIndex;
        E(iii).Block(yyy).PPG.Signal = PPG_signal(E(iii).Block(yyy-1).PPG.MinIndex:E(iii).Block(yyy).PPG.MinIndex);
%         figure(6)
%         plot(E(iii).Block(yyy).PPG.Signal )

    end
    
    
    E(iii).Block = E(iii).Block(2:end-1);
    E(iii).NPRS = E(iii).NPRS(2:end-1);
    E(iii).NPRST = E(iii).NPRST(2:end-1);


%% normalization and resampling

PPGMaxSys = max( PPG_signal);

RP =0;
FP =0;
for yyy =1: length(E(iii).Block)

  RP = [RP E(iii).Block(yyy).PPG.Rise];
  FP = [FP E(iii).Block(yyy).PPG.Fall];
  
end

PPGRiseMax = max(RP);
PPGFallMax = max(FP);


for yyy =1: length(E(iii).Block)
    
E(iii).Block(yyy).PPG.Org.Signal = {E(iii).Block(yyy).PPG.Signal};

% plot(E(iii).Block(yyy).PPG.Signal)

% E(iii).Block(yyy).PPG.Signal = E(iii).Block(yyy).PPG.Signal - min(E(iii).Block(yyy).PPG.Signal);
% E(iii).Block(yyy).PPG.Signal = E(iii).Block(yyy).PPG.Signal / abs(max(E(iii).Block(yyy).PPG.Signal));

% close all
% plot(E(iii).Block(yyy).PPG.Signal)
% set(gcf,'Units','centimeters','Position',[1 1 6 4])
% exportgraphics(gcf,'Normalized signal.emf','ContentType','vector')
% figure(5)
in = E(iii).Block(yyy).PPG.Signal;
coefa = (in(length(E(iii).Block(yyy).PPG.Signal))-in(1))/length(E(iii).Block(yyy).PPG.Signal);
coefb = in(1);
tempt = 0:length(E(iii).Block(yyy).PPG.Signal)-1;
baseline = coefa.*tempt+coefb;
% plot(in)
% hold on 
% plot(in-baseline)
out = resample(in-baseline,100,length(E(iii).Block(yyy).PPG.Signal));

new_coefa = coefa*length(E(iii).Block(yyy).PPG.Signal)/100;
new_tempt = 0:99;
new_baseline = new_coefa.*new_tempt+coefb;
 
% figure(6)
%  plot(out)
%  hold on
%  plot(out+new_baseline)
 E(iii).Block(yyy).PPG.Signal = out+new_baseline;
 
% plot(E(iii).Block(yyy).PPG.Signal)
% exportgraphics(gcf,'Resampled signal.emf','ContentType','vector')


E(iii).Block(yyy).PPG.Org.Rise = E(iii).Block(yyy).PPG.Rise;
E(iii).Block(yyy).PPG.Org.Fall =E(iii).Block(yyy).PPG.Fall; 
E(iii).Block(yyy).PPG.Org.Max = E(iii).Block(yyy).PPG.Max;
E(iii).Block(yyy).PPG.Org.Min = E(iii).Block(yyy).PPG.Min;
% plot(E(iii).Block(yyy).PPG.Signal)
E(iii).Block(yyy).PPG.Rise = E(iii).Block(yyy).PPG.Rise./PPGRiseMax;
E(iii).Block(yyy).PPG.Fall =E(iii).Block(yyy).PPG.Fall./PPGFallMax; 
E(iii).Block(yyy).PPG.Max = E(iii).Block(yyy).PPG.Max/ PPGMaxSys;
E(iii).Block(yyy).PPG.Min = E(iii).Block(yyy).PPG.Min/ PPGMaxSys;

end

% save(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'PPG_E.mat'),'E');         
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
        
        figure(2)
      plot(Input(iii,:));
      set(gcf,'Units','centimeters','Position',[1 1 6 4])
% exportgraphics(gcf,'Final Vector.emf','ContentType','vector')
     save(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'PPGBlockECG_y_org_v3.mat'),'Input', 'Label','NPRS','NPRST');
         clear Input;
         clear Label;
         clear NPRS;
         clear NPRST;

end

% save(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\PPG_E.mat'),'E');         
 