clear all
close all
clc
s =1
limn=51
% ppg
% blacklist = [ 3 6 8 9 11 15 18 21 29 31 33 34 35 39 40 42 44 46 47 49 ]
% blacklist = [3 21] %% 22 has error with a single diff4 not having enough points
% blacklist = [46 40 35 34 33 31 29 15 11 9 8 3 21 49 ] %finger ir
blacklist = [3 21] 
% imped_
% blacklist = [ 1 2 4 5 6 7 8 10 11 12 13 14 18 21 23 26 27 28 29 30 32 35 36 39 40 43 46 50 51]
for qqq =1:51
    s = qqq;
    limn =s
for iii = s:limn
     if ismember(iii,blacklist)
     else
        
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
    load(strcat('C:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'PPG_Finger_Red_Final_Struct.mat'))
    Blocks.Signal =Blocks.Signal-mean(Blocks.Signal)
     
     %% error correction for diff normalized
     count1 =1
%      lim = 103;
    lim =0.1327;
%     triplet(iii).no = [];
     Blocks.QC = [];
     Blocks.Normalized.QC =[];
    for xxx=1:6
            Blocks.Diff(xxx).QC=[]
    end
     for yyy=1:length(Blocks.Blocks)
         
%          if Blocks.Blocks(yyy-2).RMSE < lim  && Blocks.Blocks(yyy-1).RMSE < lim Blocks.Blocks(yyy).RMSE < lim
%               triplet(iii).no = [triplet(iii).no count1];
%          end
          
        if Blocks.Blocks(yyy).RMSE < lim
            Blocks.QC.Blocks(count1) = Blocks.Blocks(yyy);
            Blocks.Normalized.QC.Blocks(count1) = Blocks.Normalized.Blocks(yyy);
            for xxx=1:6
            Blocks.Diff(xxx).QC.Blocks(count1) = Blocks.Diff(xxx).Blocks(yyy);
            Blocks.Normalized.QC.Diff(xxx).Blocks(count1) = Blocks.Normalized.Diff(xxx).Blocks(yyy);
            end
%             Blocks.QC.Blocks(count1).Sum_RMSE = Blocks.Blocks.Sum_RMSE; 
            count1 = count1+1;
        end
     end
     
     if iii == 22
        rmv3 = [ 2092 2199 2285 2336 2338 2500 2502 2550 2557 2558 2848 2849 3054]
        for xxx=1:6
        Blocks.Normalized.QC.Diff(xxx).Blocks(rmv3) = [];
        end
        Blocks.Diff(xxx).QC.Blocks(rmv3) = [];
        Blocks.QC.Blocks(rmv3) = [];
         Blocks.Normalized.QC.Blocks(rmv3) = [];
     end
     
% 
% if iii == 22
%         rmv3 = [1187  1975 2064 2065 2172 2173  2258 2259 2289 2310 2311 2348 2454 2474 2523 2524 2530 2531 2823]
%         rmv3 = rmv3+4;
%         for xxx=1:6
%         Blocks.Normalized.QC.Diff(xxx).Blocks(rmv3) = [];
%         end
%         Blocks.Diff(xxx).QC.Blocks(rmv3) = [];
%         Blocks.QC.Blocks(rmv3) = [];
%          Blocks.Normalized.QC.Blocks(rmv3) = [];
%      end
     
     %%
     vec = []
     t = []
%      maxvec = []
     for  yyy =1:length(Blocks.Normalized.QC.Blocks)
     %% Diff 1-3 Zero crossing detection
     c= zero_cross_detector(Blocks.Normalized.QC.Diff(1).Blocks(yyy).Signal);
     if c(1) == 1
         
         c = c(2:end);
     end
     if c(1) ==2
         c = c(2:end);
     end
     if c(end) == 500
         
         c = c(1:end-1);
     end
     Blocks.Features.Diff(1).Blocks(yyy).Zero_cross_index = c;
     difvec(yyy,1) = length(c);
     for xxx=2:6
         if xxx > 3
             signal_filtered = Blocks.Normalized.QC.Diff(xxx).Blocks(yyy).Signal;
%              figure(xxx)
%              plot(signal_filtered)
            band = [0.5 25]; % Hz;
            fs = 500;
            band = band*2/fs;
            [b1,a1] = butter(4,band(1),'high');
            [b2,a2] = butter(2,band(2),'low');
%                     signal_filtered = filtfilt(b1,a1,signal_filtered);                 
                    signal_filtered = filtfilt(b2,a2,signal_filtered);
%               hold on
%              plot(signal_filtered)
                    Blocks.Normalized.QC.Diff(xxx).Blocks(yyy).Signal = signal_filtered;
                    
                    if xxx ==4
                         c = zero_cross_detector(signal_filtered(15:end));
                         if c(1) == 1
                             c = c(2:end);
                         end
                         Blocks.Features.Diff(xxx).Blocks(yyy).Zero_cross_index = c+ 14;
%                          plot(signal_filtered(1:end))
%                          hold on 
%                          stem(Blocks.Features.Diff(xxx).Blocks(yyy).Zero_cross_index,ones(1,length(Blocks.Features.Diff(xxx).Blocks(yyy).Zero_cross_index)))
                    else
                        
         Blocks.Features.Diff(xxx).Blocks(yyy).Zero_cross_index= zero_cross_detector(signal_filtered) ;
                    end
         
         else
             if xxx ==3
            Blocks.Features.Diff(xxx).Blocks(yyy).Zero_cross_index= zero_cross_detector(Blocks.Normalized.QC.Diff(xxx).Blocks(yyy).Signal) ;
%                         count = find(Blocks.Features.Diff(xxx).Blocks(yyy).Zero_cross_index < 300)
%                         if length(count) > 3
%                             count
%                         end
             else
             Blocks.Features.Diff(xxx).Blocks(yyy).Zero_cross_index= zero_cross_detector(Blocks.Normalized.QC.Diff(xxx).Blocks(yyy).Signal) ;
             end
         end
         
         difvec(yyy,xxx) = length(Blocks.Features.Diff(xxx).Blocks(yyy).Zero_cross_index);
     end
%      Blocks.Features.Diff(2).Blocks(yyy).Zero_cross_index= zero_cross_detector(Blocks.Normalized.QC.Diff(2).Blocks(yyy).Signal);
%      Blocks.Features.Diff(3).Blocks(yyy).Zero_cross_index = zero_cross_detector(Blocks.Normalized.QC.Diff(3).Blocks(yyy).Signal);
% difvec(yyy,2) = length(Blocks.Features.Diff(2).Blocks(yyy).Zero_cross_index);
% difvec(yyy,3) = length(Blocks.Features.Diff(3).Blocks(yyy).Zero_cross_index);
%      vec = [vec Blocks.Features.Diff(3).Blocks(yyy).Zero_cross_index(3)];


     t = [t Blocks.QC.Blocks(yyy).PainTime];
     end
     for xxx=1:6
         maxvec(iii,xxx) = min(difvec(:,xxx));
     end
%      maxvec(iii,1) = min(difvec(:,1))
%      maxvec(iii,2) = min(difvec(:,2))
%      maxvec(iii,3) = min(difvec(:,3))
%% normalize amplitude
% lim = find([Blocks.Blocks(:).PainTime] > Blocks.PhaseTime.WarmWater.Start)
lim = find([Blocks.Blocks(:).PainTime] > 120)
lim = lim(1)
for  yyy =1:lim
    Sample_matrix(yyy,:,1) = Blocks.Normalized.QC.Blocks(yyy).Signal(:);
    for xxx =1:6
        Sample_matrix(yyy,:,xxx+1) = Blocks.Normalized.QC.Diff(xxx).Blocks(yyy).Signal(:);
    end
end

for yyy =1:7
Norm_value_t(yyy,:) = mean(Sample_matrix(:,:,yyy));
Norm_value(yyy) = max(abs(Norm_value_t(yyy,:))); 
end

for  yyy =1:length(Blocks.Normalized.QC.Blocks)
% for  yyy =400:800
    
    Blocks.Normalized.QC.Blocks(yyy).Signal = Blocks.Normalized.QC.Blocks(yyy).Signal/Norm_value(1);
    for xxx =1:6
        Blocks.Normalized.QC.Diff(xxx).Blocks(yyy).Signal = Blocks.Normalized.QC.Diff(xxx).Blocks(yyy).Signal/Norm_value(1+xxx);
    end
%     if yyy == 779 || yyy  == 2
%     figure(100+yyy)
%     subplot(2,1,1)
%     
%     plot(Blocks.Normalized.QC.Blocks(yyy).Signal,'LineWidth',2)
%     hold on
%     plot([0 500],[0 0],'--')
%     stem(Blocks.Features.Diff(1).Blocks(yyy).Zero_cross_index(1),Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(1).Blocks(yyy).Zero_cross_index(1)),'black')
%     title('PPG')
%     ylabel('Amplitude')
% %     xticks('')
% set(gca,'Xticklabel',[])
%     box off
%     subplot(2,1,2)
%     
%     plot(Blocks.Normalized.QC.Diff(1).Blocks(yyy).Signal,'LineWidth',2)
%     hold on
%     plot([0 500],[0 0],'--')
%     stem(Blocks.Features.Diff(2).Blocks(yyy).Zero_cross_index(1:4),ones(1,4).*(Blocks.Normalized.QC.Diff(1).Blocks(yyy).Signal(Blocks.Features.Diff(2).Blocks(yyy).Zero_cross_index(1:4))),'black')
%     title('VPG')
%     ylabel('Amplitude')
%     box off
%     xlabel('Time, Unified datapoints')
%     subplot(6,1,3)
% o    
%     plot(Blocks.Normalized.QC.Diff(2).Blocks(yyy).Signal)
%     hold on
%     plot([0 500],[0 0],'--')
%     stem(Blocks.Features.Diff(3).Blocks(yyy).Zero_cross_index(1:4),ones(1,4).*(Blocks.Normalized.QC.Diff(2).Blocks(yyy).Signal(Blocks.Features.Diff(3).Blocks(yyy).Zero_cross_index(1:4))),'black')
%     title('APG')
%     ylabel('Amplitude')
%     subplot(6,1,4)
%     
%     plot(Blocks.Normalized.QC.Diff(3).Blocks(yyy).Signal)
%     hold on
%     plot([0 500],[0 0],'--')
%     stem(Blocks.Features.Diff(4).Blocks(yyy).Zero_cross_index(1:6),ones(1,6).*(Blocks.Normalized.QC.Diff(3).Blocks(yyy).Signal(Blocks.Features.Diff(4).Blocks(yyy).Zero_cross_index(1:6))),'black')
%     title('JPG')
%     ylabel('Amplitude')
%     subplot(6,1,5)
%     
%     plot(Blocks.Normalized.QC.Diff(4).Blocks(yyy).Signal)
%     hold on
%     plot([0 500],[0 0],'--')
%     
% %     stem(Blocks.Features.Diff(5).Blocks(yyy).Zero_cross_index(1:6),ones(1,6).*(Blocks.Normalized.QC.Diff(4).Blocks(yyy).Signal(Blocks.Features.Diff(5).Blocks(yyy).Zero_cross_index(1:6))),'black')
%     title('SPG')
%     ylabel('Amplitude')
%     subplot(6,1,6)
%     
%     hold on
%     
%     plot(Blocks.Normalized.QC.Diff(5).Blocks(yyy).Signal)
%     plot([0 500],[0 0],'--')
%     title('CPG')
%     ylabel('Amplitude')
%     xlabel('Time, Unified datapoints')
%     box on
%     
%     iii
%    stem(Blocks.Features.Diff(6).Blocks(yyy).Zero_cross_index(1:6),ones(1,6).*(Blocks.Normalized.QC.Diff(5).Blocks(yyy).Signal(Blocks.Features.Diff(6).Blocks(yyy).Zero_cross_index(1:6))))
    
%     subplot(7,1,7)
%     plot(Blocks.Normalized.QC.Diff(6).Blocks(yyy).Signal)
%     hold on
    
%     stem(Blocks.Features.Diff(6).Blocks(yyy).Zero_cross_index(1:6),ones(1,6).*(Blocks.Normalized.QC.Diff(6).Blocks(yyy).Signal(Blocks.Features.Diff(6).Blocks(yyy).Zero_cross_index(1:6))))
    
    end
    
    
end

     %% Feature extraction
     % zero cross minimum detection 1     4     4     8    52   144

     for  yyy =1:length(Blocks.Normalized.QC.Blocks)
         %% signal assigment to dataset
         Dataset(iii).Signal(yyy,:) = [Blocks.Normalized.QC.Blocks(yyy).Signal];
         Dataset(iii).CombinedSignal(yyy,:) = [Blocks.Normalized.QC.Blocks(yyy).Signal Blocks.Normalized.QC.Diff(1).Blocks(yyy).Signal Blocks.Normalized.QC.Diff(2).Blocks(yyy).Signal Blocks.Normalized.QC.Diff(3).Blocks(yyy).Signal Blocks.Normalized.QC.Diff(4).Blocks(yyy).Signal Blocks.Normalized.QC.Diff(5).Blocks(yyy).Signal ]
         %% normal signal
     Blocks.Features.Area(1,yyy,1) = sum(Blocks.Normalized.QC.Blocks(yyy).Signal(1:Blocks.Features.Diff(1).Blocks(yyy).Zero_cross_index(1)));
     Blocks.Features.Area(2,yyy,1) = sum(Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(1).Blocks(yyy).Zero_cross_index(1):end));

     Blocks.Features.Amplitude(1,yyy,1) = Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(1).Blocks(yyy).Zero_cross_index(1));
     
     Blocks.Features.Angle(1,yyy,1) =  Blocks.Features.Amplitude(1,yyy,1) / Blocks.Features.Diff(1).Blocks(yyy).Zero_cross_index(1);
     Blocks.Features.Angle(2,yyy,1) = Blocks.Features.Amplitude(1,yyy,1) / (500 - Blocks.Features.Diff(1).Blocks(yyy).Zero_cross_index(1));
     %% diff 1
      n = 2;
     out = 4;
     Blocks.Features.Area(1,yyy,n) = sum(Blocks.Normalized.QC.Blocks(yyy).Signal(1:Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(1)) - min(Blocks.Normalized.QC.Blocks(yyy).Signal(1:Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(1))));
     for xxx =1:out-1
         Blocks.Features.Area(xxx+1,yyy,n) = sum(Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx):Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx+1))-min(Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx):Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx+1))));
     end
     Blocks.Features.Area(out+1,yyy,n) = sum(Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(out):end)- min(Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(out):end)));
     
     for xxx=1:out
     Blocks.Features.Amplitude(xxx,yyy,n) = Blocks.Normalized.QC.Diff(n-1).Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx));
     end
     
     
     Blocks.Features.Angle(1,yyy,n) =  Blocks.Features.Amplitude(1,yyy,n) / Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(1);
     for xxx =2:out
         Blocks.Features.Angle(xxx,yyy,n) = (Blocks.Features.Amplitude(xxx,yyy,n)- Blocks.Features.Amplitude(xxx-1,yyy,n))/(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx)-Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx-1));
     end
     Blocks.Features.Angle(out+1,yyy,n) = Blocks.Features.Amplitude(out,yyy,n) / (500 - Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(out));

     
     
     %% diff 2
      n = 3;
     out = 4;
     Blocks.Features.Area(1,yyy,n) = sum(Blocks.Normalized.QC.Blocks(yyy).Signal(1:Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(1)) - min(Blocks.Normalized.QC.Blocks(yyy).Signal(1:Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(1))));
     for xxx =1:out-1
         Blocks.Features.Area(xxx+1,yyy,n) = sum(Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx):Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx+1))-min(Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx):Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx+1))));
     end
     Blocks.Features.Area(out+1,yyy,n) = sum(Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(out):end)- min(Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(out):end)));
     
     for xxx=1:out
     Blocks.Features.Amplitude(xxx,yyy,n) = Blocks.Normalized.QC.Diff(n-1).Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx));
     end
     
     
    Blocks.Features.Angle(1,yyy,n) =  Blocks.Features.Amplitude(1,yyy,n) / Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(1);
     for xxx =2:out
         Blocks.Features.Angle(xxx,yyy,n) = (Blocks.Features.Amplitude(xxx,yyy,n)- Blocks.Features.Amplitude(xxx-1,yyy,n))/(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx)-Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx-1));
     end
     Blocks.Features.Angle(out+1,yyy,n) = Blocks.Features.Amplitude(out,yyy,n) / (500 - Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(out));

     %% diff 3
     n = 4;
     out = 6;
     Blocks.Features.Area(1,yyy,n) = sum(Blocks.Normalized.QC.Blocks(yyy).Signal(1:Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(1)) - min(Blocks.Normalized.QC.Blocks(yyy).Signal(1:Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(1))));
     for xxx =1:out-1
         Blocks.Features.Area(xxx+1,yyy,n) = sum(Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx):Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx+1))-min(Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx):Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx+1))));
     end
     Blocks.Features.Area(out+1,yyy,n) = sum(Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(out):end)- min(Blocks.Normalized.QC.Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(out):end)));
     
     for xxx=1:out
     Blocks.Features.Amplitude(xxx,yyy,n) = Blocks.Normalized.QC.Diff(n-1).Blocks(yyy).Signal(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx));
     end
     
     
     Blocks.Features.Angle(1,yyy,n) =  Blocks.Features.Amplitude(1,yyy,n) / Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(1);
     for xxx =2:out
         Blocks.Features.Angle(xxx,yyy,n) = (Blocks.Features.Amplitude(xxx,yyy,n)- Blocks.Features.Amplitude(xxx-1,yyy,n))/(Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx)-Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(xxx-1));
     end
     Blocks.Features.Angle(out+1,yyy,n) = Blocks.Features.Amplitude(out,yyy,n) / (500 - Blocks.Features.Diff(n).Blocks(yyy).Zero_cross_index(out));

     

     amplitude_feature_vector(yyy,:,iii) = [ Blocks.Features.Area(:,yyy,1)' Blocks.Features.Area(:,yyy,2)' Blocks.Features.Area(:,yyy,3)' Blocks.Features.Area(:,yyy,4)' Blocks.Features.Angle(:,yyy,1)' Blocks.Features.Angle(:,yyy,2)' Blocks.Features.Angle(:,yyy,3)' Blocks.Features.Angle(:,yyy,4)' Blocks.Features.Amplitude(:,yyy,1)' Blocks.Features.Amplitude(:,yyy,2)' Blocks.Features.Amplitude(:,yyy,3)' Blocks.Features.Amplitude(:,yyy,4)'];
     time_feature_vector(yyy,:,iii) = [Blocks.Features.Diff(1).Blocks(yyy).Zero_cross_index(1) Blocks.Features.Diff(2).Blocks(yyy).Zero_cross_index(1:4) Blocks.Features.Diff(3).Blocks(yyy).Zero_cross_index(1:4) Blocks.Features.Diff(4).Blocks(yyy).Zero_cross_index(1:6)];
     feature_vector(yyy,:,iii) = [amplitude_feature_vector(yyy,:,iii) time_feature_vector(yyy,:,iii)/500];
% feature_vector(yyy,:,iii) = [amplitude_feature_vector(yyy,:,iii) ];
     end
     
    Dataset(iii).Label(:) = [Blocks.QC.Blocks(:).Pain];
    Dataset(iii).Time(:) = [Blocks.QC.Blocks(:).PainTime];
    
     end
end
if ismember(qqq,blacklist)
     else
     feature_vector(:,73:74,:) = [];
     feature_vector(:,67:68,:) = [];
     feature_vector(:,58:62,:) = [];
     feature_vector(:,48:49,:) = [];
     feature_vector(:,41:42,:) = [];
     feature_vector(:,31:35,:) = [];
     feature_vector(:,20:21,:) = [];
     feature_vector(:,13:14,:) = [];
     feature_vector(:,3:7,:) = [];
end

for iii = s: limn
   
     if ismember(iii,blacklist)
     else
%      max_vect = max(abs(feature_vector(:,:,iii)));

% lim = find([Blocks.Blocks(:).PainTime] > Blocks.PhaseTime.WarmWater.Start)
lim = find([Blocks.QC.Blocks(:).PainTime] > 120);
lim = lim(1);
     
     for yyy = 1 : 68
%          feature_vector(:,yyy,iii) = sign(feature_vector(:,yyy,iii)) .* feature_vector(:,yyy,iii);
%          
%          max_vect(yyy) = median(feature_vector(1:lim,yyy,iii))
%          std_vect(yyy) = std(feature_vector(1:lim,yyy,iii))
         
         maxi = max(feature_vector(1:lim,yyy,iii));
         mini = min(feature_vector(1:lim,yyy,iii));
          if abs(mini) > maxi
              max_vect(yyy) = mini;
          else 
              max_vect(yyy) = maxi;
          end
     end
     
     Blocks.Features.Feature_vector = feature_vector(:,:,iii);
     
     for yyy=1:length(feature_vector)
            feature_vector(yyy,:,iii) =  feature_vector(yyy,:,iii)./max_vect;
            feature_vector(yyy,:,iii) = sign(feature_vector(yyy,:,iii)) .* feature_vector(yyy,:,iii);

     end
     
     Blocks.Features.Feature_vector_normalized = feature_vector(:,:,iii);
     
     
     %%outlier removal
%      feature_vector(54,:,iii) = [Blocks.QC.Blocks(:).PainTime]'
%      vol(iii).feature_vector_v2(:,:) = rmoutliers(feature_vector(:,:,iii))
vol(iii).feature_vector_v2(:,:) = feature_vector(:,:,iii);

lime =length(vol(iii).feature_vector_v2);
rmv = [];
for yyy =1:lime
     
    if yyy <= lime
        if max(vol(iii).feature_vector_v2(yyy,:)) > 1.5  
            rmv = [rmv yyy];
        end
        if min(vol(iii).feature_vector_v2(yyy,:)) < -1.5
            rmv = [rmv yyy];
        end
    lime = length(vol(iii).feature_vector_v2);
    end
    
end

for yyy=1:length(feature_vector)

            vol(iii).feature_vector_v2(yyy,:) = vol(iii).feature_vector_v2(yyy,:)./4 ;
            vol(iii).feature_vector_v2(yyy,:) = vol(iii).feature_vector_v2(yyy,:)+0.5 ;
    
end
% [] to nan for visualisation
     vol(iii).feature_vector_v2(rmv,:) = []
     feature_vector(rmv,:) = []
     Dataset(iii).Label(rmv) = [];
     Dataset(iii).Time(rmv) = [] ;
     Dataset(iii).Signal(rmv,:) = [] ;
     Dataset(iii).CombinedSignal(rmv,:) = [] ;
     Dataset(iii).Features =vol(iii).feature_vector_v2(:,:);
    rmv2 = length(Dataset(iii).Label)+1:length(Dataset(iii).Features);
     Dataset(iii).Features(rmv2,:) = [];
     
%      Dataset(iii).Signals = 
     
     
     %%print
     
% figure(iii)
% image(vol(iii).feature_vector_v2(:,:))
% image('XData',1:53,'Ydata',Dataset(iii).Time,'Cdata',Dataset(iii).Features,'CDataMapping','scaled')
% colorbar

% mesh(1:53,Dataset(iii).Time,Dataset(iii).Features)
% hold on
% mesh(1:53,)
% colorbar

     end
 
end

if ismember(qqq,blacklist)
     else
DataBlock = Dataset(qqq);
% save(strcat('Feature_DataBlock_',num,'_multi_1.mat'),'DataBlock');
 feature_vector = [];
 time_feature_vector = [];
end
end

