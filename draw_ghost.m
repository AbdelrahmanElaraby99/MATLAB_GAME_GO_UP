function mat = draw_ghost(mat,ghost_x,ghost_y)    
%This function takes the parameters needed to draw the ghost(the x and y 
%positions of the ghost). it draw the ghost by making the targeted 
%pixels = 255 which is white colored. After drawing, the function sets 
%delta x and delta y to zero until they are set to -1 or 1 again when the 
%arrow are pressed. the function return the matrix after drawing. 
    global dx;
    global dy;
    
    mat(ghost_y:ghost_y+24,ghost_x-15:ghost_x+15)=255;
    mat(ghost_y+5:ghost_y+10,ghost_x-10:ghost_x-5)=0;
    mat(ghost_y+5:ghost_y+10,ghost_x+5:ghost_x+10)=0;
    mat(ghost_y+16:ghost_y+18,ghost_x-3:ghost_x+3)=0;
    dx=0;
    dy=0;
end