function [img1] = myImageFilter(img0, h)
    [rowh,colh] = size(h);
    img2 = padarray(img0,[rowh-1 colh-1],'replicate','both');
    [row0,col0] = size(img0);
    img1 =zeros(row0,col0);
    for i = 1:row0
        for j = 1:col0
            img1(i,j) = sum(sum(img2(i:(i+rowh-1),j:(j+colh-1)).*h));
        end
    end
end
