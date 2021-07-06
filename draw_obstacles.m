function mat = draw_obstacles(mat,y1,y2,y3,y4,obs_1,obs_12,obs_2,obs_22,obs_3,obs_32,obs_4,obs_42)
%This function takes the parameters needed to draw the obstcales(the y
%postion of each line, and the two x positions of the obstcales in that
%line). it draw the obstcales by making the targeted pixels = 255 which is
%white colored, the function only draw obscales when the y positions of
%the obstcales are between 6 and 388 (i.e: the Ys of the obstcales are
%inside the matrix's size). the function return the matrix after drawing.
    if y1>=6 && y1<=338
        mat(y1-5:y1+5,obs_1-17:obs_1+17)=255; mat(y1-5:y1+5,obs_12-17:obs_12+17)=255; 
    end
    if y2>=6 && y2<=338
        mat(y2-5:y2+5,obs_2-17:obs_2+17)=255; mat(y2-5:y2+5,obs_22-17:obs_22+17)=255;
    end
    if y3>=6 && y3<=338
        mat(y3-5:y3+5,obs_3-17:obs_3+17)=255; mat(y3-5:y3+5,obs_32-17:obs_32+17)=255;
    end
    if y4>=6 && y4<=338
        mat(y4-5:y4+5,obs_4-17:obs_4+17)=255; mat(y4-5:y4+5,obs_42-17:obs_42+17)=255;
    end
end
    
    

