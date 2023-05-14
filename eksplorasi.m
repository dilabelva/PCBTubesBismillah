clear;clc;close all;

x = imread("drishtiGS_098_CupAvgBoundary_OC_img.png");
BW = logical(x);
rp = regionprops(BW, 'all');
central = cat(1,rp.Centroid);
area = cat(1,rp.Area);
bb = cat(1,rp.BoundingBox);
bbsize = bb(:,3) * bb(:,4);
left = bb(:,1); 
top = bb(:,2);
right = bb(:,1) + bb(:,3); % menunjukkan titik (kolom) paling kanan dari objek
buttom = bb(:,2) + bb(:,4); % menunjukkan titik (baris) paling bawah dari objek
buttomright = [right buttom];
horizontal = bb(:,3);
vertikal = bb(:,4);

display(area);
display(left);
display(top);
display(right);
display(buttom);
display(horizontal);
display(vertikal);
display(bbsize);
display(central);

% show image with central point and rectangle of bounding box
% imshow(x);
% hold on;
% plot(central(:,1),central(:,2),'b*');
% rectangle('Position', bb, 'EdgeColor', 'r', 'LineWidth', 2);
% hold off;


