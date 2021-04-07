function A = prepro(I)

I=imresize(I,[128 128]);
[H W]=size(I);
%e1scala de grises
if size(I, 3) == 3
    I1 = rgb2gray(I);
else
    I1 = I;
end
Ia = histeq(I1);
Is=Ia;
Is1= adapthisteq(Is);
A=Is1;


