function [ F ] = ransacF( pts1, pts2, M )
% ransacF:
%   pts1 - Nx2 matrix of (x,y) coordinates
%   pts2 - Nx2 matrix of (x,y) coordinates
%   M    - max (imwidth, imheight)

% Q5.1:
%     Implement RANSAC
%     Generate a matrix F from some '../data/some_corresp_noisy.mat'
%          - using eightpoint
%          - using ransac

%     In your writeup, describe your algorithm, how you determined which
%     points are inliers, and any other optimizations you made
N = size(pts1,1);
one = ones(N,1);
pts1one = [pts1 one];
pts2one = [pts2 one];
position = 1:N;
comb = nchoosek(position,8);
for i = 1:size(comb,1)
    inlier = 0;
    pts11 = [pts1(comb(i,1),1),pts1(comb(i,1),2);pts1(comb(i,2),1),pts1(comb(i,2),2);pts1(comb(i,3),1),pts1(comb(i,3),2);pts1(comb(i,4),1),pts1(comb(i,4),2);pts1(comb(i,5),1),pts1(comb(i,5),2);pts1(comb(i,6),1),pts1(comb(i,6),2);pts1(comb(i,7),1),pts1(comb(i,7),2);pts1(comb(i,8),1),pts1(comb(i,8),2);];
    pts22 = [pts2(comb(i,1),1),pts2(comb(i,1),2);pts2(comb(i,2),1),pts2(comb(i,2),2);pts2(comb(i,3),1),pts2(comb(i,3),2);pts2(comb(i,4),1),pts2(comb(i,4),2);pts2(comb(i,5),1),pts2(comb(i,5),2);pts2(comb(i,6),1),pts2(comb(i,6),2);pts2(comb(i,7),1),pts2(comb(i,7),2);pts2(comb(i,8),1),pts2(comb(i,8),2);];
    [ F ] = eightpoint( pts11, pts22, M );
    for j = 1:N
        if pts2one(j,:)*F*pts1one(j,:)'<15
            inlier = inlier+1;
        end
    end
    if inlier/N>0.7
        break
    end
end
        
        
        
end

