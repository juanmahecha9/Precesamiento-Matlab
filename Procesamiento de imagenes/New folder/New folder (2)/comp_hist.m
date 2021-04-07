

A=imread('mri.tif');
histogramaA = hist2(A);

x=ecuhistogram(A);
histogramax= hist2(x);

figure(1)
subplot(1,2,1)
imshow(uint8(A))
title('original image')
subplot(1,2,2)
plot(histogramaA)
title('Histograma')

figure(2)
subplot(1,2,1)
imshow(uint8(x))
title('image after histogram ecualization')
subplot(1,2,2)
plot(histogramax)
title('Histograma')