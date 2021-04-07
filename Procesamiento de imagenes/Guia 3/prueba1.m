clc
clear all
close all
RGB = imread('hestain.png');
figure; imshow(RGB);

I = rgb2gray(RGB);
threshold = graythresh(I);bw = im2bw(I,threshold);
figure; imshow(bw)

bw = bwareaopen(bw,30);
se = strel('disk',2);
bw = imclose(bw,se);
bw = imfill(bw,'holes');
Be=double(bw);
figure; imshow(Be)

labels = bwlabel(bw);
features = regionprops(labels,'Area','Perimeter','Centroid');
figure; imshow(label2rgb(labels));hold on;
for i=1:numel(features)
 if(4*pi*features(i).Area/(features(i).Perimeter)^2 > .8)
 plot(features(i).Centroid(1),features(i).Centroid(2),'ko');
 else
 plot(features(i).Centroid(1),features(i).Centroid(2),'k+');
 end
end
hold off;