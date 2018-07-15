function [H2to1] = computeH_norm(p1, p2)
% inputs:
% p1 and p2 should be 2 x N matrices of corresponding (x, y)' coordinates between two images
%
% outputs:
% H2to1 - a 3 x 3 matrix encoding the homography that best matches the linear equation

%%%
p1meanx = mean(p1(1,:));
p1meany = mean(p1(2,:));
p2meanx = mean(p2(1,:));
p2meany = mean(p2(2,:));
p1meanmatrix = [p1meanx,p1meany];
p2meanmatrix = [p2meanx,p2meany];
distance1 = pdist2(p1meanmatrix,p1');
distance2 = pdist2(p2meanmatrix,p2');
maxdistance1 = max(distance1(:));
maxdistance2 = max(distance2(:));
a1 = sqrt(2)/maxdistance1;
a2 = sqrt(2)/maxdistance2;
tx1 = -a1*p1meanx;
ty1 = -a1*p1meany;
tx2 = -a2*p2meanx;
ty2 = -a2*p2meany;
H1 = [a1,0,tx1;0,a1,ty1;0,0,1];
H2 = [a2,0,tx2;0,a2,ty2;0,0,1];
normp1 = [a1*(p1(1,:)-p1meanx);a1*(p1(2,:)-p1meany)];
normp2 = [a2*(p2(1,:)-p2meanx);a2*(p2(2,:)-p2meany)];
H = computeH(normp1,normp2);
H2to1 = inv(H2)*H*H1;
end