Image = imread('cell.tif');
figure(1), imshow(ImageOriginal), title('original image');
k=2;
for i=0:1:H
	for j=0:1:W
		NXA=(i*k);
	NYA=(j*k);
	if(NXA>=0 && NXA<H && NYA>=0 && NYA <W);
	ImagenE((NXA*H)+NXA,(NYA*H)+NYA)=Imagen(i,j);
end
    end
figure(2),imshow(ImagenE)