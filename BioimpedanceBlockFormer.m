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
    signal = B(iii).Biopac.EarBioimpedance.Magnitude
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
b = ones(1,300)./300;

loop =1;
std_lim = 1E-4;
ratio = 0.15;
threshold = 50;
step_size = 0.01
yyy =1
   
i_signal = filtfilt(b,a,md_signal.^2);
s_signal = std_norm(i_signal,std_lim);
% test = test*2;
while(loop)
    
%         
%         i_signal = filtfilt(b,a,s_signal);
    [peaks,peak_value] = peak_detection(s_signal,600,fs,ratio);
    var = length(peaks)

    if var-test > 0
        std_lim = std_lim - step_size/1000;
        ratio =ratio+step_size
        difference(yyy) = 1;
    end
    if var-test <0
        std_lim = std_lim + step_size/1000;
        ratio = ratio-step_size
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
  ax(1)=  subplot(3,1,1)
    plot(f_signal)
    hold on 
    stem(peaks,peak_value)
    ax(2)= subplot(3,1,2)
    plot(i_signal)
    hold on 
    stem(peaks,peak_value)
    ax(3)= subplot(3,1,3)
    plot(signal-mean(signal))
    hold on 
    stem(peaks,peak_value)
    length(peaks)
    linkaxes(ax,'x')

end