clc
clear all
close all 

%Image load
ImageOriginal = imread('rice.png');
ImageB=zeros(257,257);

%Propery of the image
property=imfinfo('rice.png');
W=property.Width; % Width
H=property.Height; % Heigth
B=property.BitDepth; % Bits
tic
% Copy of the Original Image
%recorrido punto a punto
for i=1:1:H
    for j=1:1:W
        Image(i,j)=ImageOriginal(i,j);
    end
end
figure(1), imshow(Image), title('Copy of original image');

%bit planes
for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),1)==1
           IBP1 (i,j)=255;
       end
   end
end

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),2)==1
           IBP2 (i,j)=255;
       end
   end
end

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),3)==1
           IBP3 (i,j)=255;
       end
   end
end 

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),4)==1
           IBP4 (i,j)=255;
       end
   end
end

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),5)==1
           IBP5 (i,j)=255;
       end
   end
end

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),6)==1
           IBP6 (i,j)=255;
       end
   end
end

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),7)==1
           IBP7 (i,j)=255;
       end
   end
end

for i=1:1:H
   for j=1:1:W
       if bitget(Image(i,j),8)==1
           IBP8 (i,j)=255;
       end
   end
end

figure(6), 
subplot(2,4,1),imshow(IBP1), title('Bit plane 1')
subplot(2,4,2),imshow(IBP2), title('Bit plane 2')
subplot(2,4,3),imshow(IBP3), title('Bit plane 3')
subplot(2,4,4),imshow(IBP4), title('Bit plane 4')
subplot(2,4,5),imshow(IBP5), title('Bit plane 5')
subplot(2,4,6),imshow(IBP6), title('Bit plane 6')
subplot(2,4,7),imshow(IBP7), title('Bit plane 7')
subplot(2,4,8),imshow(IBP8),title('Bit plane 8')
toc