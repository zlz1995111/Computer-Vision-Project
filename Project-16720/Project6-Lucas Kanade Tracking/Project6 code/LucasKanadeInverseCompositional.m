function [u,v] = LucasKanadeInverseCompositional(It, It1, rect)

% input - image at time t, image at t+1, rectangle (top left, bot right coordinates)
% output - movement vector, [u, v] in the x- and y-directions.
It = double(It);
It1 = double(It1);
[Gx,Gy] = imgradientxy(It);
X = Gx(rect(2):rect(4),rect(1):rect(3));
Y = Gy(rect(2):rect(4),rect(1):rect(3));
delt = [X(:) Y(:)];
H = delt'*delt;
Tx = It(rect(2):rect(4),rect(1):rect(3));
u = 0;
v = 0;
% set a limit for iteration numbers
counts = 0;
while counts<50
    p = [u,v];
    counts = counts+1;
    warpIt = warpImg(It1,rect,p);
    difference = Tx-warpIt;
    deltp = inv(H)*delt'* difference(:);
    u = p(1)+deltp(1);
    v = p(2)+deltp(2);
end
end
function [warpImg] = warpImg(img,rect,p)
y = (rect(2)+p(2)):(rect(4)+p(2));
x = (rect(1)+p(1)):(rect(3)+p(1));
[outX,outY] = meshgrid(x,y);
warpImg = interp2(img,outX,outY);
end