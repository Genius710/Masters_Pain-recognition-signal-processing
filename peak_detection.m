function [peaks,peak_value] = peak_detection(signal,delay,fs,ratio)
n = length(signal);
m = 1;
% ratio = 0.1 

last_peak = max(signal(1*fs:10*fs))*ratio; %finding first value from where to search

% delay = 250; %ms % delay after which new peaks are not searched, due to refractory period of the ventricular muscle
delay = delay *  fs/1000; % datapoints
% plot(f_signal)
% hold on


xxx = 1;

while xxx <n-delay
    xxx;
    if signal(xxx) > last_peak % threshold is trigered for peak detection, further X values will be searched to find the actual peak
        
        %peaks(m) = xxx;
        en = xxx+delay; % in how many next datapoints we find the maximum of the peak
        if en > n % limit if its end of the signal
            en = n
        end
         [peak_value(m),yyy] = max(signal(xxx:en)); % the search of the maximum value of the peak
        
        peaks(m) = xxx+yyy-1; % location of the maximum of the peak, in datapoints
        last_peak = peak_value(m)*ratio; %update to threshold value
        m = m+1;  % update to peak counter
        xxx = xxx+yyy + delay; % do not search in the next DELAY time period, skips those datapoints
    end
    xxx = xxx+1;  
end

end

