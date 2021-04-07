clear all
close all
clc
I = imread('97.png');
level = graythresh(I);
b=im2bw(I,level);
figure, imshow(b)
k=[1 1 1; 1 1 1; 1 1 1];
e=imerode(b,k);
figure, imshow(e)
d=imdilate(e,k);
figure, imshow(d)
d=double(d);
I=double(I);
f=d.*I;
figure, imshow(uint8(f))

y1=imfinfo('97.png');
x=y1.Width;
t=y1.Height;
net = fitnet(10);
net = train(net,x,t);
view(net)
y = net(x);
perf = perform(net,y,t);