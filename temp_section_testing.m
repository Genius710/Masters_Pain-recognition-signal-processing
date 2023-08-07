 clear all
close all
clc
  for sss = 1:51
s = sss
n = sss

blacklist = [3 21 ]
men = [10 12 16 19 22 30 37 38 13 18 20 31 41 48 5 8 17 24 27 40 50 1 14 32 51]
women = [6 7 11 21 23 29 34 39 49 4 25 28 36 44 45 2 3 15 26 33 35 42 46 47]
blacklist = [blacklist ]

for iii = s:n
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
if ismember(iii,blacklist)
    else

load(strcat('Feature_DataBlock_',num,'_multi_1.mat'));
A(iii).Features = DataBlock.Features;
A(iii).NPRST = DataBlock.Time;
A(iii).NPRS = DataBlock.Label;


% for xxx =1: length(A(iii).NPRS())
%     if A(iii).NPRS(xxx) >=1 && A(iii).NPRS(xxx) <=40
%         A(iii).NPRS(xxx) = 1;
%     end
%     if A(iii).NPRS(xxx) >=41
%         A(iii).NPRS(xxx) = 2;
%     end
% 
% end

for xxx =1: length(A(iii).NPRS())
    if  A(iii).NPRS(xxx) <=9
        A(iii).NPRS(xxx) = 0;
    elseif A(iii).NPRS(xxx) >=10 && A(iii).NPRS(xxx) <=49
        A(iii).NPRS(xxx) = 1;
    elseif A(iii).NPRS(xxx) >=50 && A(iii).NPRS(xxx) <=69
        A(iii).NPRS(xxx) = 2;
    
    elseif A(iii).NPRS(xxx) >=70
        A(iii).NPRS(xxx) = 3;
    end

end

end
end



count1 =1
count2 =1
count3 = 1
count4 =1
% countf =1
for iii =s : n
    
    if ismember(iii,blacklist)
    else
        
        for yyy =1:length(A(iii).NPRST)

%             for xxx = 1:74
                if A(iii).NPRS(yyy) == 0
                    Feature(1).Block(count1,:) = A(iii).Features(yyy,:);
                    count1 = count1+1;
                elseif A(iii).NPRS(yyy) == 1
                    Feature(2).Block(count2,:) = A(iii).Features(yyy,:); 
                    count2 = count2+1;
                elseif A(iii).NPRS(yyy) == 2
                    Feature(3).Block(count3,:) = A(iii).Features(yyy,:);
                    count3 = count3+1;
                elseif A(iii).NPRS(yyy) == 3
                    Feature(4).Block(count4,:) = A(iii).Features(yyy,:);
                    count4 = count4+1;
                end
%             end

        end
        
    
    end
    
end

figure(sss)
hold on
le = length(Feature)
for vvv =1:le
histogram(Feature(vvv).Block(:,62));
hold on
end
% histogram(Feature(2).Block(:,62));
% histogram(Feature(3).Block(:,62));
% histogram(Feature(4).Block(:,62));
legend({'Pain Class 0','Pain Class 1','Pain Class 2','Pain Class 3'})
Feature = []
  end
