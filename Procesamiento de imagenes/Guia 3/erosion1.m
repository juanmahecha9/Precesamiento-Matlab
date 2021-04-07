clc 
close all
clear all
I1=imread('Otsu.png');
[H W]=size(I1);
for i=1:1:H
    for j=1:1:W
        if I1(i,j)==255
            I(i,j)=1;
        else 
            I(i,j)=0;
        end
    end
end
In=I;

I1=I.*0; %imagen resultante de la erosion
for i=2:1:H-1
for j=2:1:W-1
 %I1(i,j)=I(i,j);
 if (In(i,j)==1 && (In(i,j-1)==0 || In(i-1,j)==0 || In(i,j+1)==0 || In(i+1,j)==0))
 Is(i,j)=0;
 else
     Is(i,j)=1;
 end
end
end

