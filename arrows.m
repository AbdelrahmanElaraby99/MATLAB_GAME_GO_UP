function my_callback(hobject,event)
%This is a callback function when a key is pressed, when a key is pressed
%the function changes the values of global variables depending on the
%pressed key, these variable are used to move the ghost.
    global dx;
    global dy;
    global ex;
        switch event.Character
            case 'q'
                    ex=1;
            case 30             
                    dy = -1;                %down
            case 31
                    dy = 1;              %up 
            case 29
                    dx = 1;              %right 
            case 28   
                    dx = -1;              %left      
        end
    end