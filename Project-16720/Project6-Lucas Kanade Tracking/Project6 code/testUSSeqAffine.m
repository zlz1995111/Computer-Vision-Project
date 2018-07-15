% your code here
load('../data/usseq.mat');
mask5 = SubtractDominantMotion(frames(:,:,4), frames(:,:,5));
im5 = imfuse(mask5,frames(:,:,5));
mask25 = SubtractDominantMotion(frames(:,:,24), frames(:,:,25));
im25 = imfuse(mask25,frames(:,:,25));
mask50 = SubtractDominantMotion(frames(:,:,49), frames(:,:,50));
im50 = imfuse(mask50,frames(:,:,50));
mask75 = SubtractDominantMotion(frames(:,:,74), frames(:,:,75));
im75 = imfuse(mask75,frames(:,:,75));
mask100 = SubtractDominantMotion(frames(:,:,99), frames(:,:,100));
im100 = imfuse(mask100,frames(:,:,100));
imshow(im100);