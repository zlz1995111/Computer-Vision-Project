cv_cover = imread('../data/cv_cover.jpg');
cv_desk = imread('../data/cv_desk.png');
hp_cover = imread('../data/hp_cover.jpg');
cv_coverbin = im2double(cv_cover);
cv_deskbin = im2double(rgb2gray(cv_desk));
[locs3,desc3] = briefLite(cv_coverbin);
[locs4,desc4] = briefLite(cv_deskbin);
ratio = 0.91;
[matches1] = briefMatch(desc3, desc4, ratio);
locs31 = [];
locs41 = [];
for i = 1:size(matches1,1)
    locs31 = [locs31;locs3(matches1(i,1),:)];
end
for i = 1:size(matches1,1)
    locs41 = [locs41;locs4(matches1(i,2),:)];
end
[H2to1, inliers] = computeH_ransac( locs31', locs41');
hp_covereshape = zeros(440,350,3);
for i = 1:3
    hp_covereshape(:,:,i) = imresize(hp_cover(:,:,i),size(cv_cover));
end
input = uint8(hp_covereshape);
warp_im = warpH(input, H2to1, [size(cv_desk,1),size(cv_desk,2)], 0);
[composite_img] = compositeH(cv_desk,warp_im);
imshow(composite_img);