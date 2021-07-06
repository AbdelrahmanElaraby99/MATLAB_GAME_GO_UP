function max_score = read_scores 
%This function reads the history of scores from the file named 'scores' and
%it returns the highest score in that file.
    fid = fopen('scores.txt');
    i = 1;
    score_int = [];
    score_string = fgetl(fid);
    if ischar(score_string) 
        score_int(i) = str2num(score_string);
    end

    while ischar(score_string)
        i = i+1;
        score_string = fgetl(fid);
        if ischar(score_string) ~= 1
            break;
        end
        score_int(i) = str2num(score_string);
    end
    fclose(fid);
    
    max_score = -inf;
    for j=1:length(score_int)
        if score_int(j)>= max_score
            max_score = score_int(j);
        end
    end
end

