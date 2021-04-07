disp(' Have you mex compiled bdil6.c and bero4.c ???  :)');

clear;
imx=1027;
imy=800;
im=logical(round(rand(imx,imy)));
repx=9;
repy=2;
im=repmat(im,repx,repy);

sex=10;
sey=10;
se=logical(round(rand(sex,sey)));
%se = strel('octagon',15);

disp('Matlab erosion logical input');
tic;y0=imerode(im,se);toc
disp('Our erosion logical input');
tic;y1=binero(im,se);toc
nnz(double(y0)-double(y1))

disp('Matlab dilation logical input');
tic;y0=imdilate(im,se);toc
disp('Our dilation logical input');
tic;y1=bindil(im,se);toc
nnz(double(y0)-double(y1))

imp=bwpack(im);
disp('Matlab erosion packed input');
tic;y0=imerode(imp,se,'ispacked',imx*repx);toc
disp('Our erosion packed input');
tic;y1=binero(imp,se,imx*repx);toc
% the third input (imx*repx) is necessary because imp is
% packed and imx*repx is the original number or raws of input
% image im
nnz(double(y0)-double(y1))

disp('Matlab dilation packed input');
tic;y0=imdilate(imp,se,'ispacked');toc
disp('Our dilation packed input');
tic;y1=bindil(imp,se);toc
nnz(double(y0)-double(y1))

