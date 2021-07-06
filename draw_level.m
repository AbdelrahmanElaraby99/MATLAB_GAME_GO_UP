function draw_level(handle,img) 
%This function take the level image and the handle of the opened figure as
%an input and make the level image blink in the screen.
    mat=img;
    set(handle, 'CData', mat);
    pause(0.7);
    mat = zeros(344,223);
    set(handle, 'CData', mat);
    pause(0.5);
    mat=img;
    set(handle, 'CData', mat);
    pause(0.5);
    mat = zeros(344,223);
    set(handle, 'CData', mat);
    pause(0.5);
    mat=img;
    set(handle, 'CData', mat);
    pause(0.5);
    mat = zeros(344,223);
end