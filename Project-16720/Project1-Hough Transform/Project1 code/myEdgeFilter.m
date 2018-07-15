function [Im Io Ix Iy] = myEdgeFilter(img, sigma)
%Your implemention
    hsize = 2*ceil(3*sigma)+1;
    h = fspecial('gaussian',hsize,sigma);
    img2 = myImageFilter(img,h);
%     sx = [1 0 -1;2 0 -2;1 0 -1];
      sx = [-1 0 1;-2 0 2;-1 0 1];
      sy = sx';
%     sy = [1 2 1;0 0 0;-1 -2 -1];
    Ix = myImageFilter(img2,sx);
    Iy = myImageFilter(img2,sy);
    Io = 180*atan(Iy./Ix)/pi;
    Im = sqrt(Ix.^2+Iy.^2);
    [m,n] = size(Im);
    Imcopy = Im;
    for i = 2:m-1
        for j = 2:n-1
            if Imcopy(i,j)~=0
                angle = Io(i,j);
                if (angle>=340||angle<=22.5||(angle>=157.5&&angle<=202.5))
                    if (Imcopy(i,j)<Imcopy(i,j-1))||(Imcopy(i,j)<Imcopy(i,j+1))
                        Im(i,j)=0;
                    end
                else if ((angle>22.5&&angle<=67.5)||angle>202.5&&angle<=247.5)
                        if (Imcopy(i,j)<Imcopy(i-1,j+1)||Imcopy(i,j)<Imcopy(i+1,j-1))
                            Im(i,j)=0;
                        end
                else if ((angle>67.5&&angle<=112.5)||(angle>247.5&&angle<=292.5))
                        if (Imcopy(i,j)<Imcopy(i+1,j)||Imcopy(i,j)<Imcopy(i-1,j))
                            Im(i,j)=0;
                        end
                else 
                    if (Imcopy(i,j)<Imcopy(i+1,j+1)||Imcopy(i,j)<Imcopy(i-1,j-1))
                        Im(i,j)=0;
                    end
                    end
                    end
                end
            end
        end
    end
end
    
                
        
        
