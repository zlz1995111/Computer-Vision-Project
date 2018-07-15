% Q4.2:
% Integrating everything together.
% Loads necessary files from ../data/ and visualizes 3D reconstruction
% using scatter3
load('../data/templeCoords.mat')
ptsv1 = [x1 y1];
ptsv2 = zeros(size(ptsv1));
I1 = imread('../data/im1.png');
I2 = imread('../data/im2.png');
im1 = rgb2gray(I1);
im2 = rgb2gray(I2);
for i = 1:288    
    [ ptsv2(i,1), ptsv2(i,2) ] = epipolarCorrespondence( im1, im2, F, ptsv1(i,1), ptsv1(i,2) );
end
[Ptemple, errtemple] = triangulate(C1,ptsv1,C2,ptsv2);
xtemple = Ptemple(:,1)';
ytemple = Ptemple(:,2)';
ztemple = Ptemple(:,3)';
scatter3(xtemple,ytemple,ztemple)


