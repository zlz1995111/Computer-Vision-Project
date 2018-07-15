function [H2to1] = computeH(p1, p2)
% inputs:
% p1 and p2 should be 2 x N matrices of corresponding (x, y)' coordinates between two images
%
% outputs:
% H2to1 - a 3 x 3 matrix encoding the homography that best matches the linear equation

%%%

n = size(p1, 2);
x = p2(1, :); y = p2(2,:); X = p1(1,:); Y = p1(2,:);
rows0 = zeros(3, n);
rowsXY = -[X; Y; ones(1,n)];
hx = [rowsXY; rows0; x.*X; x.*Y; x];
hy = [rows0; rowsXY; y.*X; y.*Y; y];
h = [hx hy];
[U, ~, ~] = svd(h, 'econ');
H2to1 = (reshape(U(:,9), 3, 3)).';
end