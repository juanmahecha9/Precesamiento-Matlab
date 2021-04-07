function SO=dectsobel(I)
I=double(I);
[H W]=size(I);
%%
%Sobel
% Gradiente Horizontal o fila
S1=[-1 0 1
    -2 0 2
    -1 0 1]; 
%Gradiente Vertical o columna
S2=[-1 -2 -1
    0 0 0
    1 2 1];

S3=conv2(I,S1);
S3=double(S3);
S4=conv2(I,S2);
S4=double(S4);

for i=1:1:H
    for j=1:1:W
        SO(i,j)=sqrt((S3(i,j).^2)+(S4(i,j).^2));
    end
end
SO=uint8(SO);
