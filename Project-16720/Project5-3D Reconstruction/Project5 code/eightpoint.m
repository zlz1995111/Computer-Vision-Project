function [ F ] = eightpoint( pts1, pts2, M )
% eightpoint:
%   pts1 - Nx2 matrix of (x,y) coordinates
%   pts2 - Nx2 matrix of (x,y) coordinates
%   M    - max (imwidth, imheight)

% Q2.1:
%     Implement the eightpoint algorithm
%     Generate a matrix F from some '../data/some_corresp.mat'
%     Save F, M, pts1, pts2 to q2_1.mat

%     Write F and display the output of displayEpipolarF in your writeup
one = ones(size(pts1,1),1);
pts1 = [pts1 one];
pts2 = [pts2 one];
T = diag([1./M,1]);
pts1 = (T*pts1')';
pts2 = (T*pts2')';
A = [];
for i = 1:size(pts1,1)
    x = pts1(i,1);
    y = pts1(i,2);
    x1 = pts2(i,1);
    y1 = pts2(i,2);
    A = [A;[x*x1,x*y1,x,y*x1,y*y1,y,x1,y1,1]];
end
[U,S,V] = svd(A);
F = reshape(V(:,end),[3,3]);
[U1,S1,V1] = svd(F);
S1(3,3) = 0;
F = U1*S1*V1';
F = T'*F*T;
end

