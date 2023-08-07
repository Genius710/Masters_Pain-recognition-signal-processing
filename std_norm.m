function [signal] = std_norm(signal,lim)
    std_old = std(signal);
    std_new = std_old-lim*2;
    while(std_old-std_new>lim)
        std_old = std(signal);
        for iii =1: length(signal)
            if signal(iii)> std_old
                signal(iii) = 0;
%                     signal(iii) = signal(iii)/10;

            end
        end
        std_new = std(signal);
    end
    
end

