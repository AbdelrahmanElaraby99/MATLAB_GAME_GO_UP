%This mini game is a project for the CSCI 101 course in zewail city for science and technology.
%The game was made by:
%Abdelrahman Alaa Elaraby
%Asmaa Maghraby
%For more info contact: s-abdelrahman_elaraby@zewailcity.edu.eg

global dx; %initialize a global variable which is the change in the x position of the ghost.
global dy; %initialize a global variable which is the change in the y position of the ghost.
global ex; %initialize a global variable which makes the program close if set to 1.

%reads the images that will be used later in the code.
icon      = imread('ICON.jpg');
lvl_one   = imread('level 1.jpg');
lvl_two   = imread('level 2.jpg');
lvl_three = imread('level 3.jpg');
%cange the images to gray scale and double instead of UINT8
lvl_one   = rgb2gray(lvl_one);
lvl_two   = rgb2gray(lvl_two);
lvl_three = rgb2gray(lvl_three);
lvl_one = im2double(lvl_one);
lvl_two = im2double(lvl_two);
lvl_three = im2double(lvl_three);
%load the sounds that will be used later in the code.
[game_over, Fs] = audioread('game over.mp3');
[level_up, Fs2] = audioread('level up.mp3');
[track, Fs3] = audioread('track.mp3');

%creating a matrix of zeros its size is 344x223, the matrix in the images
%domnain is read as a black image of size 344x223, this matrix/image is the
%screen of the game. by changing the value of each element/pixel of the
%matrix we can draw shapes(0 is black, 255 is white, between them is gray scale)
mat = zeros(344,223);

%creating a figure, its handle named ff, and it has a callback KeyPressFcn
%that returns some information when a key is pressed to the function arrows.
ff=figure('KeyPressFcn',@arrows);
%displaying/creating an image with handle inside the created figure.
handle = imshow(mat);

%creating variables that will be used later
time=0.03;%the time delay for each frame in the game.
counter=0;%counter for how many itteration of the main loop happend.
flag1=0;%flag set to zero telling us that level 1 didn't start.
flag2=0;%flag set to zero telling us that level 2 didn't start.
flag3=0;%flag set to zero telling us that level 3 didn't start.
score = 0;%setting the score to zero.


dx=0;%setting the required change in x to be zero
dy=0;%setting the required change in y to be zero
ex=0;%setting the exit to be zero to start the game

ghost_x=112;%setting the initial x position of the ghost
ghost_y=300;%setting the initial y position of the ghost

%generatong random numbers for the x positions of the obstcales
[obs_1,obs_12]= Random(0);
[obs_2,obs_22]= Random(0);
[obs_3,obs_32]= Random(0);
[obs_4,obs_42]= Random(0);

%setting the initial y positions/spacing of the lines of obstacles, the
%negative numbers of the 2nd,3rd and 4th lines are in order to make the 
%first line appear in the screen and the others no till they reach y=6 by
%the loop.
y1=6;
y2=-80;
y3=-166;
y4=-251;

%start the background music
sound(track,Fs3);

%The main loop of the game, the loop exit if the exit button pressed(ex = 1)

while ex==0
    %The next three if conditions are to check whether the counter of the loop
    %passed certain numbers of iteration or not thus knowing the level, and then
    %display the level up screen and the level up music.
    if flag1==0
        intro(handle);
        clear sound;
        sound(level_up,Fs2);
        draw_level(handle,lvl_one);
        pause(2);
        sound(track,Fs3);
        y1=6; y2=-80; y3=-166; y4=-251;
        flag1=1;
    end
    if flag2==0 && counter==(300*2)
        clear sound;
        sound(level_up,Fs2);
        draw_level(handle,lvl_two);
        pause(2);
        sound(track,Fs3);
        y1=6; y2=-80; y3=-166; y4=-251;
        ghost_x=112;
        ghost_y=300;
        time=0.01;
        flag2=1;
    end
    if flag3==0 && counter==(300*5)
        clear sound;
        sound(level_up,Fs2);
        draw_level(handle,lvl_three);
        pause(2);
        sound(track,Fs3);
        y1=6; y2=-80; y3=-166; y4=-251;
        ghost_x=112;
        ghost_y=300;
        time=0.007;
        flag3=1;
    end
    %add one to the score each 50 iterations of the loop
    if rem(counter,50)==0
        score=score+1;
    end
    
    %in this part the x & y positions of the ghost are updated and the if
    %conditions are to make the object remain inside the size of matrix.
    ghost_x=ghost_x+(6*dx);
    ghost_y=ghost_y+(6*dy);
    if ghost_x>(223-15)
        ghost_x=223-15;
    end
    if ghost_x<16
        ghost_x=16;
    end
    if ghost_y>(344-24)
        ghost_y=344-24;
    end
    if ghost_y<1
        ghost_y=2;
    end
    
    %in this part the ghost is drawn(i.e: the pixels around the x and y
    %positions are set to 255) and the values of the main matrix are saved
    %to another matrix 'ghost_mat' that will hold the shape/postion of 
    %ghost in the current frame/iteration,then we set the main matrix to zero.
    mat = draw_ghost(mat,ghost_x,ghost_y);
    ghost_mat = mat;
    mat = zeros(344,223);
    
    %in this part the obstcales are drawn(i.e: the pixels around the
    %entered parameters are set to 255) and the values of the main matrix 
    %are saved to another matrix 'obstcale_mat', this matrix holds the 
    %shape/position of obstacles in the current frame/iteration.
    mat = draw_obstacles(mat,y1,y2,y3,y4,obs_1,obs_12,obs_2,obs_22,obs_3,obs_32,obs_4,obs_42);
    obstacle_mat = mat;
    
    %re-drawing the obstacle again but with the presence of the obstcales
    %to obtain the full current frame of the game.
	mat = draw_ghost(mat,ghost_x,ghost_y);
    
    %displaying the main matrix 'mat' that contain the full frame(obstcales
    %and ghost)
    set(handle, 'CData', mat);
    
    %a matrix subtraction is did here, between the full frame/matrix and the
    %ghost matrix, and the result is compared to the obstcale matrix, the
    %compared matrices should be equal if the ghost didn't hit the
    %obstcales, if they aren't equal this means that the player lost and
    %the game will end displaying the result of the player and the highest
    %score.
    if isequal(mat - ghost_mat,obstacle_mat)==0
        clear sound;
        sound(game_over,Fs);
        write_score(score);
        highest_score = read_scores;
        msgbox({'GAME OVER!';sprintf('Your Score: %d',score);sprintf('Highest Score is: %d',highest_score)},'Ghost Game','custom',icon);
        close(ff);
        break;
    end
    
    %pause the frame with certain time dependeing in the level, the smaller
    %the time the faster the frame rate.
    pause(time);
    %setting the main matrix/image to zeros/black to update it with the new
    %illuminated pixels the next iteration.
    mat = zeros(344,223);
    
    %update the postions of the obstcale through this function.
    [y1,y2,y3,y4,obs_1,obs_12,obs_2,obs_22,obs_3,obs_32,obs_4,obs_42] = update_obstacles(y1,y2,y3,y4,obs_1,obs_12,obs_2,obs_22,obs_3,obs_32,obs_4,obs_42);
    
    %this counter keeps track of how many itteration were done.
    counter=counter+1;
end

%if the exit button is pressed then turn off the background music and close
%the game window.
if ex == 1
    clear sound;
    close(ff);
end