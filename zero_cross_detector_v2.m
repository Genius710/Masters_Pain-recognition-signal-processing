function [cross_index] = zero_cross_detector(Signal,th)
% th = 4;
Signs = sign(Signal.*circshift(Signal,1));
cross_index  = find(Signs < 0);
rmv = [];
for iii =2:length(cross_index)
if cross_index(iii) - cross_index(iii-1) < th
    rmv = [rmv iii iii-1];
end
end
cross_index(rmv) = [];

end

