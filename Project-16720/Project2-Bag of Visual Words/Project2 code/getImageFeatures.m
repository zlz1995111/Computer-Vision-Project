function [h] = getImageFeatures(wordMap, dictionarySize)
% Convert an wordMap to its feature vector. In this case, it is a histogram
% of the visual words
% Input:
%   wordMap:            an H * W matrix with integer values between 1 and K
%   dictionarySize:     the total number of words in the dictionary, K
% Outputs:
%   h:                  the feature vector for this image


	% -----fill in your implementation here --------
    h = zeros(dictionarySize,1);
    [H,W] = size(wordMap);
    for i = 1:H
        for j = 1:W
            h(wordMap(i,j),1) = h(wordMap(i,j),1) +1;
        end
    end
    h = h/sum(h);

    

    % ------------------------------------------

end
