clear all 
close all
clc

for iii =1:51

    if iii < 10
        num = strcat('0',string(iii));
    else
        num = string(iii);
    end
    
    name = strcat('D:\OneDrive - Kaunas University of Technology\Aurimod2019_BMI\Data\GALUTINES STRUKTUROS\Aurimod',num,'.mat')
    A = load(name);
    


end


