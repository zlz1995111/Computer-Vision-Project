function [H, rhoScale, thetaScale] = myHoughTransform(Im, threshold, rhoRes, thetaRes)
%Your implementation here
%Im - grayscale image - 
%threshold - prevents low gradient magnitude points from being included
%rhoRes - resolution of rhos - scalar
%thetaRes - resolution of theta - scalar
[rownu,colnu]=size(Im);
rhoMax = 1*sqrt(rownu^2+colnu^2);
thetaMax = 2*pi;
thetaScale = 0:thetaRes:thetaMax;
rhoScale = 0:rhoRes:rhoMax;
[rowrho,colrho] = size(rhoScale);
[rowth,colth] = size(thetaScale);
H = zeros(colrho,colth);
for i =1 : rownu
    for j = 1: colnu
        if Im(i,j) >= threshold
            for a =1:colth
                rho= i*sin(thetaScale(a)) + j*cos(thetaScale(a));
                if rho>0&&rho<rhoMax
                    [dis,b] = min(abs(rhoScale-rho));
                    H(b,a) = H(b,a)+1;
                end
            end
        end
    end
end
            


end
        
        
