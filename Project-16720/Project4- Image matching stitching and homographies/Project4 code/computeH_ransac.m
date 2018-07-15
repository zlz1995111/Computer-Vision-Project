function [ bestH2to1, inliers] = computeH_ransac( locs1, locs2)
%COMPUTEH_RANSAC A method to compute the best fitting homography given a
%list of matching points.

%Q2.2.3

%%%
N = size(locs1,2);
inliers = zeros(1,N);
position = 1:N;
comb = nchoosek(position,5);
for i = 1:size(comb,1)
    locs11 = [locs1(1,comb(i,1)),locs1(1,comb(i,2)),locs1(1,comb(i,3)),locs1(1,comb(i,4)),locs1(1,comb(i,5));locs1(2,comb(i,1)),locs1(2,comb(i,2)),locs1(2,comb(i,3)),locs1(2,comb(i,4)),locs1(2,comb(i,5))];
    locs22 = [locs2(1,comb(i,1)),locs2(1,comb(i,2)),locs2(1,comb(i,3)),locs2(1,comb(i,4)),locs2(1,comb(i,5));locs2(2,comb(i,1)),locs2(2,comb(i,2)),locs2(2,comb(i,3)),locs2(2,comb(i,4)),locs2(2,comb(i,5))];
    h = computeH_norm(locs11,locs22);
    correspondence = h*[locs2;ones(1,N)];
    for j = 1:N
        if (locs1(1,j)-correspondence(1,j))^2+(locs1(2,j)-correspondence(2,j))^2<1225
            inliers(1,j) = 1;
        else 
            inliers(1,j) = 0;
        end
    end
    if sum(inliers(:)==1)>15
        bestH2to1 = h;
        break
    end

end
        
end

