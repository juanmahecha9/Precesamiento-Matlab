function Iout=pasoaltob(I)
[H W]=size(I);
M1=[-1 -1 -1;2 2 2;-1 -1 -1]; %Horizontal
S3=convolucion2d(I,M1);
S3=double(S3);

M2=[-1 2 -1;-1 2 -1;-1 2 -1]; %Vertical
S4=convolucion2d(I,M2);
S4=double(S4);

for i=1:1:H
    for j=1:1:W
        SO(i,j)=sqrt((S3(i,j).^2)+(S4(i,j).^2));
    end
end
SO=uint8(SO);
Iout=SO;