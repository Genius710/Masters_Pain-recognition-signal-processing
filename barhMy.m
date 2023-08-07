function [outputArg1,outputArg2] = barhRight(xtrain,ytrain,baseline,direction,color,width)
hold on
for xxx = 1:length(xtrain)
%     for xxx =1: length(ytrain)
    if direction
        patch([baseline xtrain(xxx)+baseline xtrain(xxx)+baseline baseline],[ytrain(xxx)+width ytrain(xxx)+width ytrain(xxx)-width ytrain(xxx)-width],color)
        alpha(0.3);
    else
        patch([baseline baseline-xtrain(xxx) baseline-xtrain(xxx) baseline],[ytrain(xxx)+width ytrain(xxx)+width ytrain(xxx)-width ytrain(xxx)-width],color)
%         alpha(0.3);
    end
%     end
end




% patch([hw1 hw2 hw2 hw1]', [ylimm(1) ylimm(1) ylimm(2) ylimm(2) ]',[0.9805 0.8945 0.8359],'EdgeColor','none')


end

