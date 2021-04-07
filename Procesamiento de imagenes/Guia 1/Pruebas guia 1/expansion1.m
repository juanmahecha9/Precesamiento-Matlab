A=imread('cell.tif');
%Programa que recibe una matriz A y devuelve su reflejo vertical
[fil,col]=size(A);
B=zeros(fil,col);
 
for i=1:fil
    B(i,:)=A(i,:);
   end
figure,imshow(B);