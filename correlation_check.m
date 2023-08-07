 clear all
close all
clc
n=51
blacklist = []
for iii = 1:n
    if iii< 10
        num = strcat('0',string(iii));
    else
    num = string(iii);
    end
A(iii) = load(strcat('Data/Aurimod',num,'PPGBlockECG1.mat'));

end

sample = A(1).Input(1,1:100);
plot(sample)

for iii =1 : n
    for yyy =1: length(A(iii).Input)
%         A(iii).Correlation(yyy) = sum(sample.*A(iii).Input(yyy,1:100))/100
A(iii).Correlation(yyy) = sum((sample-A(iii).Input(yyy,1:100)).^2);

    end
end

data= A(1).Correlation;
group = zeros(1,length(A(1).Correlation));

for iii =2:n
data= [data,A(iii).Correlation];
group = [group ones(1,length(A(iii).Correlation))*iii];
end
figure
boxplot(data,group)
ylim([0 20])
for iii = 1:n
    
    for yyy=1: length(A(iii).Correlation)
        if A(iii).Correlation(yyy) > 40.0 |A(iii).Input(yyy,103) < 0|A(iii).Input(yyy,104) < 0
           A(iii).Quality(yyy) = 0;
           figure(3)
           plot(A(iii).Input(yyy,:))
           
        else
            A(iii).Quality(yyy) = 1;
            
        end
    end
end

for iii =1: n
    yyy =1
    xxx =1
    ttt =1
    
    while ttt
        if A(iii).Quality(xxx)
            B(iii).Input(yyy,:) = A(iii).Input(xxx,:);
            B(iii).Label(yyy,:) = A(iii).Label(xxx,:);
            B(iii).NPRS(yyy) = A(iii).NPRS(xxx);
            B(iii).NPRST(yyy) = A(iii).NPRST(xxx);
            B(iii).Correlation(yyy) = A(iii).Correlation(xxx);
            xxx = xxx+1;
            yyy = yyy+1;
        else
            xxx = xxx+1;
        end
        if xxx >= length(A(iii).Quality)
        ttt = 0
        end
    end
    
end
clear data
clear group
data= B(1).Correlation;
group = ones(1,length(B(1).Correlation));

for iii =2:n
data= [data,B(iii).Correlation];
group = [group ones(1,length(B(iii).Correlation))*iii];
end
figure(4)
boxplot(data,group)

for iii = 1:n
    if iii< 10
        num = strcat('0',string(iii))
    else
    num = string(iii)
    end
    Input = B(iii).Input;
    Label = B(iii).Label;
    NPRS = B(iii).NPRS;
    NPRST = B(iii).NPRST;
    
% save(strcat('D:\OneDrive - Kaunas University of Technology\MAGISTRINIS\Data\Aurimod',num,'PPGBlockECGXC1.mat'),'Input', 'Label','NPRS','NPRST');
         clear Input;
         clear Label;
         clear NPRS;
         clear NPRST;
end




