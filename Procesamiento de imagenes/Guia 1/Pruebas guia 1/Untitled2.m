I = imread('rice.png');
figure(1), imshow(ImageOriginal), title('original image');

%Propery of the image
property=imfinfo('rice.png');
W=property.Width; % Width
H=property.Height; % Heigth
B=property.BitDepth; % Bits
% 
% for i=1:1:H
%     for j=1:1:W
%         Image(i,j)=ImageOriginal(i,j);
%     end
% end

I1=Image(1:2:end,1:2:end,1:2:end);
   
figure(2),imshow(I1)


k=2;
for i=1:1:H % Heigth
    if mod(i,k)==0
    for j=1:1:W % Width
        if mod(j,k)==0
        %for p=0:1:K-1
         %  for y=0:1:K-18
              I2((i),(j))=I1(i,j); %matriz simetrica
          %end
        %end
        end
    end
    end
end

figure(3),imshow(I2)

