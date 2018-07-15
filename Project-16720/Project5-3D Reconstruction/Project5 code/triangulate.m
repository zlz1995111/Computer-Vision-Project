function [ P, err ] = triangulate( C1, p1, C2, p2 )
% triangulate:
%       C1 - 3x4 Camera Matrix 1
%       p1 - Nx2 set of points
%       C2 - 3x4 Camera Matrix 2
%       p2 - Nx2 set of points

%       P - Nx3 matrix of 3D coordinates
%       err - scalar of the reprojection error

% Q4.2:
%       Implement a triangulation algorithm to compute the 3d locations
%
P = zeros(size(p1,1),3);
for i = 1:size(p1,1)
    A = [p1(i,2)*C1(3,:)-C1(2,:);C1(1,:)-p1(i,1)*C1(3,:);p2(i,2)*C2(3,:)-C2(2,:);C2(1,:)-p2(i,1)*C2(3,:)];
    [~,~,V] = svd(A);
    X = V(:,end)';
    X = X/X(1,4);
    P(i,:)=X(1:3);
end
one = ones(size(p1,1),1);
Pcheck = [P one];
p1check = (C1*Pcheck')';
p2check = (C2*Pcheck')';
%normalize the 2D points
p1check = p1check./p1check(:,end);
p2check = p2check./p2check(:,end);
err = 0;
for i = 1:size(p1,1)
    err = err + (p1check(i,1)-p1(i,1))^2 + (p1check(i,2)-p1(i,2))^2 + (p2check(i,1)-p2(i,1))^2 + (p2check(i,2)-p2(i,2))^2;
end
    


end
