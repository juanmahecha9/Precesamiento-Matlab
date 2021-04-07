clc
clear all
close all
warning off

I=imread('21.jpg');

if size(I, 3) == 3
    I = rgb2gray(I);
end
[M N] = size(I);
if  ((-1)^M) == 1 & ((-1)^N) == 1
    I=I;
elseif ((-1)^M) == 1 & ((-1)^N) == -1
    I = imresize(I,[M,N+1]);
elseif ((-1)^M) == -1 & ((-1)^N) == 1
    I = imresize(I,[M+1,N]);
elseif ((-1)^M) == -1 & ((-1)^N) == -1
    I = imresize(I,[M+1,N+1]);
end
figure,imshow(I)

aH=histeq(I);
figure,imshow(aH)

g = log(2+double(I));
g1 = mat2gray(g);
g2 = im2uint8(g1);
g2 = uint8(g2);
figure,imshow(g2)

aH1=adapthisteq(g2);
figure,imshow(aH1)

fsp = fspecial('gaussian', [3 3] ,0.5);
er = imfilter(aH1,fsp);
figure,imshow(er)

gh=medfilt2(er,[3 3]);
figure,imshow(gh);

Ifil = Butterworthalto(gh,1.2);
figure,imshow(Ifil);

ajus = imadjust(Ifil,stretchlim(I,[.02 .80]),[]);
s = imadjust(ajus,stretchlim(ajus),[]);
figure,imshow(s)