function intro(handle)
%This function imports the needed images to make the intro of the game and 
%display them one after the other with a pause between each frame.
    intro1 = imread('intro 1.jpg');
    intro1_2 = imread('intro 1_2.jpg');
    intro1_3 = imread('intro 1_3.jpg');
    intro1_4 = imread('intro 1_4.jpg');
    intro1_5 = imread('intro 1_5.jpg');
    intro1_6 = imread('intro 1_6.jpg');
    intro1_7 = imread('intro 1_7.jpg');
    intro1_8 = imread('intro 1_8.jpg');
    intro1_9 = imread('intro 1_9.jpg');
    intro1_10 = imread('intro 1_10.jpg');
    intro2 = imread('intro 2.jpg');
    intro3 = imread('intro 3.jpg');
    intro4 = imread('intro 4.jpg');
    intro5 = imread('intro 5.jpg');
    
    mat = zeros(344,223);
    set(handle, 'CData', mat);
    pause(1);
    set(handle, 'CData', intro1);
    pause(0.3);
    set(handle, 'CData', intro1_2);
    pause(0.3);
    set(handle, 'CData', intro1_3);
    pause(0.3);
    set(handle, 'CData', intro1_4);
    pause(0.3);
    set(handle, 'CData', intro1_5);
    pause(0.3);
    set(handle, 'CData', intro1_6);
    pause(0.3);
    set(handle, 'CData', intro1_7);
    pause(0.3);
    set(handle, 'CData', intro1_8);
    pause(0.3);
    set(handle, 'CData', intro1_9);
    pause(0.3);
    set(handle, 'CData', intro1_10);
    pause(0.3);
    
    
    set(handle, 'CData', intro2);
    pause(2);
    set(handle, 'CData', intro3);
    pause(2);
    set(handle, 'CData', intro4);
    pause(1);
    set(handle, 'CData', intro5);
    pause(1);
    set(handle, 'CData', intro4);
    pause(1);
    set(handle, 'CData', intro5);
    pause(1);
    set(handle, 'CData', intro4);
    pause(1);
end