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