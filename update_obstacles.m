function [y1,y2,y3,y4,obs_1,obs_12,obs_2,obs_22,obs_3,obs_32,obs_4,obs_42] = update_obstacles(y1,y2,y3,y4,obs_1,obs_12,obs_2,obs_22,obs_3,obs_32,obs_4,obs_42)
%this function takes the parameters of the obstacles(the y postion of each
%line of obstacles and the x position of each obstacle in that line) and
%update them by incrementing the y position of each line by 1(so each line
%of obstacles will appear falling from above) and checks if the line
%hits the bottom of the screen, if it hits then it's y postion is set to 6
%again and the two x positions of it's obstcales are re-generated randomly.
    y1 = y1+1;
    y2 = y2+1;
    y3 = y3+1;
    y4 = y4+1;
    if y1==338
        y1=6;
        [obs_1,obs_12]= Random(obs_4);
    end
    if y2==338
        y2=6;
        [obs_2,obs_22]= Random(obs_1);
    end
    if y3==338
        y3=6;
        [obs_3,obs_32]= Random(obs_2);
    end
    if y4==338
        y4=6;
        [obs_4,obs_42]= Random(obs_1);
    end
end