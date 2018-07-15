function [points] = getHarrisPoints(I, alpha, k)
% Finds the corner points in an image using the Harris Corner detection algorithm
% Input:
%   I:                      grayscale image
%   alpha:                  number of points
%   k:                      Harris parameter
% Output:
%   points:                    point locations
%
    % -----fill in your implementation here --------
% Gx = [1,0,-1;2,0,-2;1,0,-1];
% Gy = Gx';
% Ix = imfilter(I,Gx);
% Iy = imfilter(I,Gy);
[Ix,Iy] = imgradientxy(I,'sobel');
Ix2 = Ix.*Ix;
Iy2 = Iy.*Iy;
Ixy = Ix.*Iy;
boxfilter = [1,1,1;1,1,1;1,1,1];
Ix2_sum = double(imfilter(Ix2,boxfilter));
Iy2_sum = double(imfilter(Iy2,boxfilter));
Ixy_sum = double(imfilter(Ixy,boxfilter));
[row,col] = size(I);
R = zeros(row,col);
for i= 1:row
    for j = 1:col
%         H(1,1)=Ix2_sum(i,j);
%         H(1,2) = Ixy_sum(i,j);
%         H(2,1) = Ixy_sum(i,j);
%         H(2,2) = Iy2_sum(i,j);
        H = [Ix2_sum(i,j),Ixy_sum(i,j);Ixy_sum(i,j),Iy2_sum(i,j)];
        R(i,j) = det(H)-k*trace(H);
    end
end
sortR = sort(R(:));
maxValues = sortR(end-alpha+1:end);
maxIndex = ismember(R,maxValues);
idx = find(maxIndex);
[yi xi] = ind2sub(size(R),idx);
points = [xi,yi];

        



    

    % ------------------------------------------

end
