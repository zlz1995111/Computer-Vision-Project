function [rhos, thetas] = myHoughLines(H, nLines)
%Your implemention here
Hcopy = H;
[m,n] = size(H);
for i = 2:m-1
    for j = 2:n-1
        if Hcopy(i,j)~=0
            if Hcopy(i,j)~=max(Hcopy((i-1):(i+1),(j-1):(j+1)))
                H(i,j)=0;
            end
        end
    end
end
sortedValues = sort(H(:));
maxValues = sortedValues(end-nLines+1:end);
maxIndex = ismember(H,maxValues);
idx = find(maxIndex);
[rhos thetas] = ind2sub(size(H),idx);


end
        