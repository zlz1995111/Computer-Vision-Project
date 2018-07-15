% your code here
load('../data/aerialseq.mat')
mask30 = SubtractDominantMotion(frames(:,:,29), frames(:,:,30));
im30 = imfuse(mask30,frames(:,:,30));
mask60 = SubtractDominantMotion(frames(:,:,59), frames(:,:,60));
im60 = imfuse(mask60,frames(:,:,60));
mask90 = SubtractDominantMotion(frames(:,:,89), frames(:,:,90));
im90 = imfuse(mask90,frames(:,:,90));
mask120 = SubtractDominantMotion(frames(:,:,119), frames(:,:,120));
im120 = imfuse(mask120,frames(:,:,120));
imshow(im120);