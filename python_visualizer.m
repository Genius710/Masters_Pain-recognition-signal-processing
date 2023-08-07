clear all
 close all
% a1 =load('ans_lstm2_to_ppg.txt');
% a =load('ans_whitelisted.txt');
a =load('mlp_fh_ans.txt')
a1 =load('mlp_fh_ans.txt')
[~,am] = max(a');

[~,am1] = max(a');
whitelist = [23,25,26,27,28,29,30,31,32,34,35,36,37,38,40,41,43,44,45,46,48,49,50,51]


% [b,c] = fir1(240,0.05,'LOW')
% b = ones(1,100)./10;
% am = filtfilt(b,c,am);
% % pwelch(am)
% for iii =1: length(am)
% probs(iii) = a(iii,am(iii));
% probs1(iii) = a1(iii,am1(iii));
% end
% figure
% plot(probs)
% figure
% plot(probs1)
% figure
% plot(probs-probs1)
am = medfilt1(am,3);
am1 = medfilt1(am1,3);
lam = 0
v =0
for iii = 1:21
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
la = load(strcat('Data/Aurimod',num,'CNAPBlockV2.mat'));
% la = load(strcat('Data/Aurimod',num,'PPGBlockECGXC_Lim1.mat'));
la = la.Label;
 [~,lam1] = max(la');
 v = [v length(lam1)]
 lam = [ lam lam1];
end

for iii = 1:length(whitelist)
    
    num = string(whitelist(iii));
    
la = load(strcat('Data/Aurimod',num,'CNAPBlockV2.mat'));
% la = load(strcat('Data/Aurimod',num,'PPGBlockECGXC_Lim1.mat'));
la = la.Label;
 [~,lam1] = max(la');
 v = [v length(lam1)]
 lam = [ lam lam1];
end
 
%  la = load('Data/Aurimod02CNAPBlock.mat');
% la = la.Label;
%  [~,lam2] = max(la');
%  
%  la = load('Data/Aurimod03CNAPBlock.mat');
% la = la.Label;
%  [~,lam3] = max(la');
%  lam = [lam1 lam2 lam3]
for iii =1:length(lam)
    
if lam(iii) ==1
lam(iii) = 0;
elseif lam(iii) > 1 && lam(iii) <25
lam(iii) = 1;
elseif lam(iii) >= 25 && lam(iii) <50
lam(iii) = 2;
elseif lam(iii) >= 50 && lam(iii) <75
lam(iii) = 3;
elseif lam(iii) >= 75
lam(iii) = 4;
end
end
% am =am./max(am);
% am = am-0.2;
figure
plot(am,'-x','MarkerSize',6,'MarkerEdgeColor','black')

hold on
% plot(amf,'o','MarkerSize',3,'MarkerEdgeColor','blue')
plot(lam+1,'-o','MarkerSize',3,'MarkerEdgeColor','red')

% xlim([last last+v(iii+1)])
% last =v(iii+1)+last

% figure(1)
% 
% c(:,:) =a(2:end,:)
% imshow(c,[min(min(c)) max(max(c))])

