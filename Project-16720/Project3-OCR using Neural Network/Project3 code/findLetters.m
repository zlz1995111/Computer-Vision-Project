function [lines, bw] = findLetters(im)
% [lines, BW] = findLetters(im) processes the input RGB image and returns a cell
% array 'lines' of located characters in the image, as well as a binary
% representation of the input image. The cell array 'lines' should contain one
% matrix entry for each line of text that appears in the image. Each matrix entry
% should have size Lx4, where L represents the number of letters in that line.
% Each row of the matrix should contain 4 numbers [x1, y1, x2, y2] representing
% the top-left and bottom-right position of each box. The boxes in one line should
% be sorted by x1 value.
    image = imread(im);
    bw = im2bw(image);
    bwnew = 1-bw;
    CC= bwconncomp(bwnew);
    S = regionprops(CC,'BoundingBox');
    BoundingBox = cat(1,S.BoundingBox);
    number = 1;
    unit = BoundingBox(1,1);
    for i = 1:size(BoundingBox,1)
        if BoundingBox(i,1)~=unit
            number = number + 1;
            unit = BoundingBox(i,1);
        end
    end
    lines = cell(1,number);
    lo = 1;
    location = 1;
    for i = 1:size(BoundingBox,1)
        if BoundingBox(i,1)~=BoundingBox(lo,1)
            lines{location} = BoundingBox(lo:i-1,1:end);
            lo = i;
            location = location + 1;
        end
    end
            
        
%     imshow(image)
%     hold on 
%     for i  = 1:size(BoundingBox,1)
%         rectangle('Position',[BoundingBox(i,1),BoundingBox(i,2),BoundingBox(i,3),BoundingBox(i,4)],'EdgeColor','r','LineWidth',3)
%     end
%     hold off
    %     plot(centroid(:,1),centroid(:,2),'b*')

end
