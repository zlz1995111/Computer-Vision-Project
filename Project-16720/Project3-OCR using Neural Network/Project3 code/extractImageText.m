function [text] = extractImageText(fname)
% [text] = extractImageText(fname) loads the image specified by the path 'fname'
% and returns the next contained in the image as a string.
    text = '';
    textlibrary = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0'};
    [lines,bw] = findLetters(fname);
    parameter = load('nist36_model.mat');
    W_36 = parameter.W;
    b_36 = parameter.b;
    for i = 1:length(lines)
        for j = 1:size(lines{i},1)
            letterimage = bw(lines{i}(j,2):lines{i}(j,2)+lines{i}(j,4),lines{i}(j,1):lines{i}(j,1)+lines{i}(j,3));
            %make it square
            [h,w] = size(letterimage);
            maxi = max(h,w);
            padsize = [round(maxi - h),round(maxi - w)];
            letterimage = padarray(letterimage,padsize,1);
            letterimage32 = imresize(letterimage,[32,32]);
            input = letterimage32(:);            
            [out,~,~]= Forward(W_36,b_36,input);
            [~,N] = max(out(:));
            letter = textlibrary{N};
            text = strcat(text,['',letter]);
        end
    end
     sprintf(text)       
end
