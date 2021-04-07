name='cameraman.tif';
I=(name);
figure,imshow(I);

info=imfinfo(name);
H=info.Height;
W=info.Width;
bit=info.BitDepth
x=0:1:255;
x=x;
m=1;
b=(-2).^bit;
Is=I*0; %imagen de las mismas dimensiones pero en ceros

for i=1:1:H
    for j=1:1:W
        [s pos]=find(X==I(i,j));
        Is(i,j)=Y(pos);
    end
end
    
    if pos <= 200
    Image1(i,j) = 0;
else pos > 200
    Image1(i,j) = 0
end

for i=1:1:W; j=1:1:H
        if(I(i,j)>200);
            Is(i,j)=255;
        else
            Is(i,j)=0;
    end
end


figure, imshow(Is);