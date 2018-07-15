function M = LucasKanadeAffine(It, It1)

% input - image at time t, image at t+1 
% output - M affine transformation matrix
It = double(It);
It1 = double(It1);
[m,n] = size(It);
[X,Y] = meshgrid(1:n,1:m);
X = X(:);
Y = Y(:);
[Ix,Iy] = imgradientxy(It);
difference = It1-It;
counts = 0;
p = zeros(6,1);
while(counts<100)
    counts = counts + 1;
    Ix = Ix(:);
    Iy = Iy(:);
    difference = difference(:);
    delt = [X.*Ix Y.*Ix Ix X.*Iy Y.*Iy Iy];
    H = delt'*delt;
    deltp = inv(H)*delt'*difference;
    p = p + deltp;
    M = [1+p(1),p(2),p(3);p(4),1+p(5),p(6);0,0,1];
%     warpIt = warpImgAffine(It,M);
    warpIt = medfilt2(warpH(It,M,[size(It1,1) size(It1,2)]));
    difference = It1 - warpIt;
    [Ix,Iy] = gradient(warpIt,1/n,1/m);
end
end
% function [warpImg] = warpImgAffine(img,M)
% % [m,n] = size(img);
% % [X,Y] = meshgrid(1:n,1:m);
% % X = X(:);
% % Y = Y(:);
% % X_warp = M(1,1)*X+M(1,2)*Y+M(1,3);
% % Y_warp = M(2,1)*X+M(2,2)*Y+M(2,3);
% y = (M(1,2)*M(2,2)*1+M(2,3)):(M(1,2)*M(2,2)*size(img,1)+M(2,3));
% x = (M(1,1)*M(2,1)*1+M(1,3)):(M(1,1)*M(2,1)*size(img,2)+M(1,3));
% [outX,outY] = meshgrid(x,y);
% % warpImg = interp2(X,Y,img,X_warp,Y_warp);
% warpImg = interp2(img,outX,outY);
% warpImg(isnan(warpImg)) = 0;
% end
    
    

