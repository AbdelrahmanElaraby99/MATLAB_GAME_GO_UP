function [obs,obs2] = Random(last_random)
%this function generates random x postions for the two obstacles of each line 
%of obstacles, it takes the x position of the obstacle in the line beneath the
%currnet line in order to generate the current obstacles a little away from
%the beneath obstacles.
    obs  =randi([18,120],1);
    obs2 =randi([103,206],1);
    %this loop check if the random numbers are appropriate for the
    %designed game or no, if no it will regenerate the random numbers.
    while obs2-obs < 85 || obs2-obs > 96 || abs(obs-last_random)<30
        obs  =randi([18,120],1);
        obs2 =randi([103,206],1);
    end
end