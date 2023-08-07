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
    
   fs =100
    signal = B(iii).CNAP.ABPWave.Wave;
%     signal = B(iii).Nautilus.PPG.FingerRed;
    d_signal = diff(signal);
    md_signal = medfilt1(d_signal,5);
    [peaks,peak_value] = peak_detection(md_signal,300,fs,0.3);
%     plot(md_signal)
%     hold on 
% %     stem(peaks,ones(1,length(peak_value))*200)
%     stem(peaks,peak_value)
    
    
    %% nprs remap

t= peaks/fs;
nprs_raw =[0 B(iii).PainValue.PainValue' 0];
nprs_raw_t =[0 B(iii).PainValue.Time' max(B(iii).CNAP.Hemodynamics.BeatTime)]
nprs_raw = [nprs_raw 0]
nprs_raw_t = [nprs_raw_t B(iii).PhaseTime.ColdWater10C.Start]

nprs_re = round( interp1(nprs_raw_t,nprs_raw,t));
nprs_re(length(nprs_re)) = 0;
nprs_re(length(nprs_re)-1) = 0;
    %% parameter extraction
for yyy =2 : length(peaks)-1
    in = peaks(yyy-1);
    out =peaks(yyy+1);
    mid =peaks(yyy);

    
    [E(iii).CNAP.Max(yyy),E(iii).CNAP.MaxIndex(yyy)] = max(B(iii).CNAP.ABPWave.Wave(mid:mid+30));
%     plot(B(iii).CNAP.ABPWave.Wave(t_in*100+20:t_out*100))
    E(iii).CNAP.MaxIndex(yyy) = E(iii).CNAP.MaxIndex(yyy)+mid ; 
    
    [E(iii).CNAP.Min(yyy),E(iii).CNAP.MinIndex(yyy)] = min(B(iii).CNAP.ABPWave.Wave(in:mid));
%     plot(B(iii).CNAP.ABPWave.Wave(t_in*100:E(iii).CNAP.MaxIndex(yyy)))
    E(iii).CNAP.MinIndex(yyy) = E(iii).CNAP.MinIndex(yyy)+in ;
    
%     vvec = B(iii).CNAP.ABPWave.Wave(in:out);
    
%     figure(1)
%     plot(vvec)
%     hold on
%      stem(mid-in,B(iii).CNAP.ABPWave.Wave(mid))
%      stem(E(iii).CNAP.MaxIndex(yyy),E(iii).CNAP.Max(yyy));
%      stem(E(iii).CNAP.MinIndex(yyy),E(iii).CNAP.Min(yyy));
%     hold off
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
    for yyy =1: length(E(iii).CNAP.Max)        
        E(iii).Block(yyy).CNAP.Max = E(iii).CNAP.Max(yyy);
        E(iii).Block(yyy).CNAP.Min = E(iii).CNAP.Min(yyy);
        
        E(iii).Block(yyy).CNAP.MaxIndex = E(iii).CNAP.MaxIndex(yyy);
        E(iii).Block(yyy).CNAP.MinIndex = E(iii).CNAP.MinIndex(yyy);
    end
    
    for yyy =2: length(E(iii).CNAP.Max)-1
        
        E(iii).Block(yyy).CNAP.Rise = E(iii).Block(yyy).CNAP.MaxIndex- E(iii).Block(yyy).CNAP.MinIndex;
        E(iii).Block(yyy).CNAP.Fall = E(iii).Block(yyy+1).CNAP.MinIndex- E(iii).Block(yyy).CNAP.MaxIndex;
        E(iii).Block(yyy).CNAP.Signal = B(iii).CNAP.ABPWave.Wave(E(iii).Block(yyy).CNAP.MinIndex:E(iii).Block(yyy+1).CNAP.MinIndex);
        E(iii).Block(yyy).CNAP.RealMean = sum(E(iii).Block(yyy).CNAP.Signal)/length(E(iii).Block(yyy).CNAP.Signal);

    end
    
    E(iii).Block = E(iii).Block(2:end-1);
    E(iii).NPRS = E(iii).NPRS(2:end-1);
    E(iii).NPRST = E(iii).NPRST(2:end-1);
    
    %% normalization and resampling

CNAPMaxSys = max(B(iii).CNAP.ABPWave.Wave);
R =0;
F = 0;
M =0;
for yyy =1: length(E(iii).Block)
  R = [R E(iii).Block(yyy).CNAP.Rise];
  F = [F E(iii).Block(yyy).CNAP.Fall];  
  M = [M E(iii).Block(yyy).CNAP.RealMean];
end
CNAPRiseMax = max(R);
CNAPFallMax = max(F);
CNAPMeanMax = max(M);

for yyy =1: length(E(iii).Block)
    
% E(iii).Block(yyy).CNAP.Signal = E(iii).Block(yyy).CNAP.Signal - E(iii).Block(yyy).CNAP.Min;
% E(iii).Block(yyy).CNAP.Signal = E(iii).Block(yyy).CNAP.Signal / max(E(iii).Block(yyy).CNAP.Signal);
in = E(iii).Block(yyy).CNAP.Signal;
coefa = (in(length(E(iii).Block(yyy).CNAP.Signal))-in(1))/length(E(iii).Block(yyy).CNAP.Signal);
coefb = in(1);
tempt = 0:length(E(iii).Block(yyy).CNAP.Signal)-1;
baseline = coefa.*tempt+coefb;
% figure(5)
% plot(in)
% hold on 
% plot(in-baseline')
out = resample(in-baseline',100,length(E(iii).Block(yyy).CNAP.Signal));

new_coefa = coefa*length(E(iii).Block(yyy).CNAP.Signal)/100;
new_tempt = 0:99;
new_baseline = new_coefa.*new_tempt+coefb;
 
% figure(6)
%  plot(out)
%  hold on
%  plot(out+new_baseline')
 E(iii).Block(yyy).CNAP.Signal = out+new_baseline';

% E(iii).Block(yyy).CNAP.Rise = E(iii).Block(yyy).CNAP.Rise./CNAPRiseMax;
% E(iii).Block(yyy).CNAP.Fall =E(iii).Block(yyy).CNAP.Fall./CNAPFallMax; 
% E(iii).Block(yyy).CNAP.Max = E(iii).Block(yyy).CNAP.Max/ CNAPMaxSys;
% E(iii).Block(yyy).CNAP.Min = E(iii).Block(yyy).CNAP.Min/ CNAPMaxSys;
% E(iii).Block(yyy).CNAP.RealMean =  E(iii).Block(yyy).CNAP.RealMean/CNAPMeanMax;
E(iii).Block(yyy).CNAP.Rise = E(iii).Block(yyy).CNAP.Rise;
E(iii).Block(yyy).CNAP.Fall =E(iii).Block(yyy).CNAP.Fall; 
E(iii).Block(yyy).CNAP.Max = E(iii).Block(yyy).CNAP.Max;
E(iii).Block(yyy).CNAP.Min = E(iii).Block(yyy).CNAP.Min;
E(iii).Block(yyy).CNAP.RealMean =  E(iii).Block(yyy).CNAP.RealMean;
end

%% final signal generation CNAP and saving
    for yyy =1: length(E(iii).Block)
        if E(iii).Block(yyy).CNAP.Rise>0 && E(iii).Block(yyy).CNAP.Fall > 0
        
        a = E(iii).Block(yyy).CNAP.Signal;
        [x,y] = size(a)
        if x>y
            a = a';
        end
        clear x
        clear y
        b = E(iii).Block(yyy).CNAP.Max;
        c = E(iii).Block(yyy).CNAP.Min;
        d = E(iii).Block(yyy).CNAP.Rise;
        e = E(iii).Block(yyy).CNAP.Fall;
        Input(yyy,1:100+4) = [a b c d e ];
        
        Label(yyy,:) = E(iii).Block(yyy).Pain;
        Mean(yyy) =E(iii).Block(yyy).CNAP.RealMean; 
        end
        
    end
        
        NPRS = E(iii).NPRS;
        NPRST =E(iii).NPRST;
%     plot(Input(:,104));
     save(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'CNAPBlock_y_org_v4.mat'),'Input', 'Label','NPRS','NPRST','Mean');
         clear Input;
         clear Label;
         clear NPRS;
         
clear NPRST;
clear Mean
end




