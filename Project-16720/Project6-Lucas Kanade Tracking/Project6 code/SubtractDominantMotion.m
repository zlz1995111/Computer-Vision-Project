function mask = SubtractDominantMotion(image1, image2)

% input - image1 and image2 form the input image pair
% output - mask is a binary image of the same size
M = LucasKanadeAffine(image1, image2);
% warpIt = warpImgAffine(image1,M);
warpIt = medfilt2(warpH(image1,M,[size(image2,1) size(image2,2)]));
difference = image2 - warpIt;
for i = 1:size(difference,1)
    for j = 1:size(difference,2)
        if difference(i,j)<10
            difference(i,j) = 0;
        end
    end
end
se = strel('disk',10);
mask = imdilate(difference,se);
mask = imerode(mask,se);
mask = medfilt2(mask);
mask = double(mask);
end
% function [warpImg] = warpImgAffine(img,M)
% y = (M(1,2)*M(2,2)*rect(2)+M(2,3)):(M(1,2)*M(2,2)*rect(4)+M(2,3));
% x = (M(1,1)*M(2,1)*rect(1)+M(1,3)):(M(1,1)*M(2,1)*rect(3)+M(1,3));
% [outX,outY] = meshgrid(x,y);
% warpImg = interp2(img,outX,outY);
% end
