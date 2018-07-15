function [ x2, y2 ] = epipolarCorrespondence( im1, im2, F, x1, y1 )
% epipolarCorrespondence:
%       im1 - Image 1
%       im2 - Image 2
%       F - Fundamental Matrix between im1 and im2
%       x1 - x coord in image 1
%       y1 - y coord in image 1

% Q4.1:
%           Implement a method to compute (x2,y2) given (x1,y1)
%           Use F to only scan along the epipolar line
%           Experiment with different window sizes or weighting schemes
%           Save F, pts1, and pts2 used to generate view to q4_1.mat
%
%           Explain your methods and optimization in your writeup
l1 = F*[x1,y1,1]';
similarity = [];
points = [];
% gaussian = [1/16,1/8,1/16;1/8,1/4,1/8;1/16,1/8,1/16];
gaussian = [1,4,7,4,1;4,16,26,16,4;7,26,41,26,7;4,16,26,16,4;1,4,7,4,1];
sim = zeros(5,5);
im1matr = im1(round(y1)-2:round(y1)+2,round(x1)-2:round(x1)+2);
for i = 3:638
    j = round((-l1(3)-l1(1)*i)/l1(2));
    if j>2 && j<479
        im2matr = im2((j-2):(j+2),(i-2):(i+2));
        for k = 1:5
            for z = 1:5
                sim(k,z) = (im1matr(k,z)-im2matr(k,z))^2;
            end
        end
        simla = sum(sum(sim.*gaussian));
        similarity = [similarity;simla];
        points = [points;[i,j]];
    end
end

        
% for i = 1:640
%     for j = 1:480        
%         if abs([i,j,1]*l1) < 20
%             im1matr = im1(y1-1:y1+1,x1-1:x1+1);
%             im2matr = im2(j-1:j+1,i-1:i+1);
%             for k = 1:3
%                 for z = 1:3
%                     sim(k,z) = (im1matr(k,z)-im2matr(k,z))^2;
%                 end
%             end
%             simla = sum(sum(sim.*gaussian));
%             similarity = [similarity;simla];
%             points = [points;[i,j]];
%         end
%     end
% end
N = find(similarity==min(similarity(:)));
N = N(1);
x2 = points(N,1);
y2 = points(N,2);

end

