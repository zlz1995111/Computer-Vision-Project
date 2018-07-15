% your code here
load('../data/sylvbases.mat');
load('../data/sylvseq.mat');
rects = zeros(size(frames,3),4);
I = [102,62,156,108];
rects(1,:) = I;
width = abs(I(1)-I(3));
height = abs(I(2)-I(4));
for i = 2:size(frames,3)
    curr = rects(i-1,:);
    img = frames(:,:,i-1);
    imshow(img);
    hold on;
    rectangle('Position',[curr(1),curr(2),width,height],'LineWidth',2,'EdgeColor','r')
    hold off;
    pause(0.01);
    [u,v] = LucasKanadeBasis(frames(:,:,i-1),frames(:,:,i),curr,bases);
    rects(i,:) = [curr(1)+u,curr(2)+v,curr(3)+u,curr(4)+v];
    rects(i,:) = round(rects(i,:));
end
save('sylvseqrects.mat','rects')
