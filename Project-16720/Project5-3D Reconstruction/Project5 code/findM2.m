% Q3.3:
%       1. Load point correspondences
%       2. Obtain the correct M2
%       3. Save the correct M2, C2, p1, p2, R and P to q3_3.mat
load('../data/some_corresp.mat');
M = [640,640];
[ F ] = eightpoint( pts1, pts2, M );
load('../data/intrinsics.mat');
[ E ] = essentialMatrix( F, K1, K2 );
[M2s] = camera2(E);
C1 = K1*[1,0,0,0;0,1,0,0;0,0,1,0];
for i = 1:4
    M2 = M2s(:,:,i);
    C2 = K2*M2;
    [P,err] = triangulate(C1,pts1,C2,pts2);
    if min(P(:,end))>0
        break
    end
end
save('q3_3.mat','M2','C2','pts1','pts2','R','P');
   

