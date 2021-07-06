function write_score(score)
%This function takes the score of the player as an input and add it to the file of scores. 
    fid = fopen('scores.txt','at');
    fprintf(fid,'%d\n',score);
    fclose(fid);
end