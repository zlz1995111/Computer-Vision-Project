function [composite_img] = compositeH(template,img)
for i = 1:size(template,3)
    for j = 1:size(template,2)
        for k = 1:size(template,1)
            if img(k,j,i) == 0
                img(k,j,i) = template(k,j,i);
            end
        end
    end
end
composite_img = img;



end