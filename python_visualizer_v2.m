clear all
 close all
% a1 =load('ans_lstm2_to_ppg.txt');
% a =load('ans_whitelisted.txt');
am =load('lstm128_mbc_fh.txt')
 nprs = load('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Dataset\CNAP\NE_MBC_test.mat')

 for iii =1:length(nprs.Label)
     switch nprs.Label(iii)
         case 0
             nprs.Label(iii) =0
         case 1
             nprs.Label(iii) =0
         case 2
             nprs.Label(iii) =1
         case 3
             nprs.Label(iii) =2
         case 4
             nprs.Label(iii) =3
         case 5
             nprs.Label(iii) =3
     end
 end

% am = medfilt1(am,10);


[b,c] = fir1(240,0.01,'LOW')
% b = ones(1,100)./10;
am = filtfilt(b,c,am);

plot(am)
hold on
plot(nprs.Label)
ylabel('Simplified NPRS')
xlabel('Datapoints')

legend('Lowpass filtered NN output','Label')
