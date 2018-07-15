function [points] = getRandomPoints(I, alpha)
% Generates random points in the image
% Input:
%   I:                      grayscale image
%   alpha:                  random points
% Output:
%   points:                    point locations
%
	% -----fill in your implementation here --------
row = size(I,1);
col = size(I,2);
indices = randsample(row*col,alpha);
[yi,xi] = ind2sub([row col],indices);
points = [xi,yi];

    

    % ------------------------------------------

end

