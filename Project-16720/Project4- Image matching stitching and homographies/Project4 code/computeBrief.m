function [locs, desc] = computeBrief(im, locs, compareX, compareY)
% Compute the BRIEF descriptor for detected keypoints.
% im is 1 channel image, 
% locs are locations
% compareX and compareY are idx in patchWidth^2
% Return:
% locs: m x 2 vector which contains the coordinates of the keypoints
% desc: m x nbits vector which contains the BRIEF descriptor for each
%   keypoint.
validlocs = [];
[imrow,imcol] = size(im);
for i = 1:size(locs,1)
    if locs(i,1)<=(imcol-4)&&locs(i,2)<=(imrow-4)&&locs(i,1)>4&&locs(i,2)>4
        validlocs = [validlocs;locs(i,:)];
    end
end
locs = validlocs;
desc = zeros(size(locs,1),length(compareX));
for i = 1:size(locs,1)
    for j = 1:length(compareX)        
        plusxx = 5-rem(compareX(j),9);
        plusxy = 5-fix(compareX(j)/9)-1;
        plusyx = 5-rem(compareY(j),9);
        plusyy = 5-fix(compareY(j)/9)-1;
        xrowcordinate = locs(i,2)+plusxx;
        xcolcordinate = locs(i,1)+plusxy;
        yrowcordinate = locs(i,2)+plusyx;
        ycolcordinate = locs(i,1)+plusyy;
        if im(yrowcordinate,ycolcordinate)>im(xrowcordinate,xcolcordinate)
            desc(i,j) = 1;
        end
    end
end
        
        
%%%
end