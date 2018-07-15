% Your code here.
image1 = imread('../images/01_list.jpg');
image2 = imread('../images/02_letters.jpg');
image3 = imread('../images/03_haiku.jpg');
image4 = imread('../images/04_deep.jpg');
bw1 = 1-im2bw(image1);
    CC1 = bwconncomp(bw1,26);
    S1 = regionprops(CC1,'BoundingBox');
    BoundingBox1 = cat(1,S1.BoundingBox);
    imshow(image1)
    hold on 
    for i  = 1:size(BoundingBox1,1)
        rectangle('Position',[BoundingBox1(i,1),BoundingBox1(i,2),BoundingBox1(i,3),BoundingBox1(i,4)],'EdgeColor','r','LineWidth',3)
    end
    hold off
figure,
bw2 = 1-im2bw(image2);
    CC2 = bwconncomp(bw2,26);
    S2 = regionprops(CC2,'BoundingBox');
    BoundingBox2 = cat(1,S2.BoundingBox);
    imshow(image2)
    hold on 
    for i  = 1:size(BoundingBox2,1)
        rectangle('Position',[BoundingBox2(i,1),BoundingBox2(i,2),BoundingBox2(i,3),BoundingBox2(i,4)],'EdgeColor','r','LineWidth',3)
    end
    hold off
figure,
bw3 = 1-im2bw(image3);
    CC3 = bwconncomp(bw3,26);
    S3 = regionprops(CC3,'BoundingBox');
    BoundingBox3 = cat(1,S3.BoundingBox);
    imshow(image3)
    hold on 
    for i  = 1:size(BoundingBox3,1)
        rectangle('Position',[BoundingBox3(i,1),BoundingBox3(i,2),BoundingBox3(i,3),BoundingBox3(i,4)],'EdgeColor','r','LineWidth',3)
    end
    hold off
figure,
bw4 = 1-im2bw(image4);
    CC4 = bwconncomp(bw4,26);
    S4 = regionprops(CC4,'BoundingBox');
    BoundingBox4 = cat(1,S4.BoundingBox);
    imshow(image4)
    hold on 
    for i  = 1:size(BoundingBox4,1)
        rectangle('Position',[BoundingBox4(i,1),BoundingBox4(i,2),BoundingBox4(i,3),BoundingBox4(i,4)],'EdgeColor','r','LineWidth',3)
    end
    hold off