function [ F ] = sevenpoint( pts1, pts2, M )
% sevenpoint:
%   pts1 - 7x2 matrix of (x,y) coordinates
%   pts2 - 7x2 matrix of (x,y) coordinates
%   M    - max (imwidth, imheight)

% Q2.2:
%     Implement the eightpoint algorithm
%     Generate a matrix F from some '../data/some_corresp.mat'
%     Save recovered F (either 1 or 3 in cell), M, pts1, pts2 to q2_2.mat

%     Write recovered F and display the output of displayEpipolarF in your writeup
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
[U,S,V] = svd(A'*A);
F1 = reshape(V(:,end),[3,3]);
F2 = reshape(V(:,end-1),[3,3]);
W = conv([F2(1,1) F1(1,1)],conv([F2(2,2) F1(2,2)],[F2(3,3) F1(3,3)]))+conv([F2(1,2) F1(1,2)],conv([F2(2,3) F1(2,3)],[F2(3,1) F1(3,1)]))+conv([F2(1,3) F1(1,3)],conv([F2(2,1) F1(2,1)],[F2(3,2) F1(3,2)]))-conv([F2(1,3) F1(1,3)],conv([F2(2,2) F1(2,2)],[F2(3,1) F1(3,1)]))-conv([F2(1,2) F1(1,2)],conv([F2(2,1) F1(2,1)],[F2(3,3) F1(3,3)]))-conv([F2(1,1) F1(1,1)],conv([F2(2,3) F1(2,3)],[F2(3,2) F1(3,2)]));
lambda = roots(W);
F{1} = T'*(F1+lambda(1)*F2)*T;
F{2} = T'*(F1+lambda(2)*F2)*T;
F{3} = T'*(F1+lambda(3)*F2)*T;
end

