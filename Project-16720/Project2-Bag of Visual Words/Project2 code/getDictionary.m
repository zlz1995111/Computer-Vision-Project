function [dictionary] = getDictionary(imgPaths, alpha, K, method)
% Generate the filter bank and the dictionary of visual words
% Inputs:
%   imgPaths:        array of strings that repesent paths to the images
%   alpha:          num of points
%   K:              K means parameters
%   method:         string 'random' or 'harris'
% Outputs:
%   dictionary:         a length(imgPaths) * K matrix where each column
%                       represents a single visual word
    % -----fill in your implementation here --------
    [filterBank] = createFilterBank();
    [~,T] = size(imgPaths);
    n = size(filterBank,1);
    pixelResponses = zeros(alpha*T,3*n);
    if method == 'harris'
        for i = 1:T
            str = ['../data/',imgPaths{1,i}];
            realPath = join(str);
            I = imread(realPath);
            W = size(I,2);
            [filterResponses] = extractFilterResponses(I, filterBank);
            if size(I,3) == 3
                I = rgb2gray(I);
            end
            [points] = getHarrisPoints(I,alpha,0.05);
            for j = 1:alpha   
                pixelResponses(alpha*(i-1)+j,:) = filterResponses((points(j,2)-1)*W+points(j,1),:);
            end
        end
        [~,dictionary] = kmeans(pixelResponses,K,'EmptyAction','drop');
        
    else
            for i = 1:T
                str = ['../data/',imgPaths{1,i}];
                realPath = join(str);
                I = imread(realPath);
                W = size(I,2);
                [filterResponses] = extractFilterResponses(I, filterBank);
                if size(I,3) == 3
                    I = rgb2gray(I);
                end
                [points] = getRandomPoints(I,alpha);
                for j = 1:alpha
                    pixelResponses(alpha*(i-1)+j,:) = filterResponses((points(j,2)-1)*W+points(j,1),:);
                end
            end
            [~,dictionary] = kmeans(pixelResponses,K,'EmptyAction','drop');
    end
         
            
    
    
        
        
    

    % ------------------------------------------
    
end

