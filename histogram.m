clear;clc;close all;

A = imread("drishtiGS_017_ODAvgBoundary_OD_img.png");
BW = logical(A);
rp = regionprops(BW, 'all');
central = cat(1,rp.Centroid);
area = cat(1,rp.Area);
bb = cat(1,rp.BoundingBox); bbsize = bb(:,3) * bb(:,4);
left = bb(:,1); top = bb(:,2);
right = bb(:,1) + bb(:,3); buttom = bb(:,2) + bb(:,4);
buttomright = [right buttom];

display(central);
% display(area);
% display(bb);
% display(bbsize);
% display(top);

%%cari titik tengah dan ukuran bounding box terkecil
B = imread('drishtiGS_017.png'); % hasil 3 dimensi
BR = B(:,:,1); % hasil 2 dimensi, ambil red dari B
A = A/255;
maskedOD = BR.*A; % masking antara citra biner dg citra asli (red)
BB_OD = imcrop(BR, rp(1).BoundingBox); % crop bounding box OD
% imshow(BR);

[OD_hist, nOD_hist] = imhist(maskedOD(maskedOD > 0)); % histogram hasil masking (blm crop)
[BB_hist, nBB_hist] = imhist(BB_OD); % histogram bounding box OD yg udah di crop
BB_hist = logical(OD_hist).*BB_hist; % histrogram masking

figure
bar(nOD_hist,OD_hist, 0.5);
xlim([0 255])
ylim([0 3500])
title('red channel OD');

figure
bar(nBB_hist,BB_hist-OD_hist, 0.5); 
xlim([0 255])
ylim([0 3500])
title('red channel')
