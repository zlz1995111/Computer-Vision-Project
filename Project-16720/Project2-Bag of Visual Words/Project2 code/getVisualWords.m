function [wordMap] = getVisualWords(I, dictionary, filterBank)
% Convert an RGB or grayscale image to a visual words representation, with each
% pixel converted to a single integer label.   
% Inputs:
%   I:              RGB or grayscale image of size H * W * C
%   filterBank:     cell array of matrix filters used to make the visual words.
%                   generated from getFilterBankAndDictionary.m
%   dictionary:     matrix of size 3*length(filterBank) * K representing the
%                   visual words computed by getFilterBankAndDictionary.m
% Outputs:
%   wordMap:        a matrix of size H * W with integer entries between
%                   1 and K

    % -----fill in your implementation here --------
%     H = size(I,1);
%     W = size(I,2);
    [filterResponses] = extractFilterResponses(I, filterBank);
    distance = pdist2(filterResponses,dictionary);
    [~, N] = min(distance');
    wordMap = reshape(N, size(I, 1), size(I, 2));
%     for i = 1:H*W
%         [~,N] = min(distance(i,:));
%         if rem(i,W)~=0
%             row = idivide(int64(i),int64(W))+1;
%             col = rem(i,W);
%         else
%             row = i/W;
%             col = W;
%         end
%         wordMap(row,col) = N;
end
        
            

    

    % ------------------------------------------

