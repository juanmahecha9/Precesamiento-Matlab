function mahalanobisout=mahalanobis(I,Hdma);
% I es la observacion A es la categoria
Har=HaralickTF(I);

for i=1:1:14
    maha(i)=Har(i)-Hdma(i);
end
   
maha1=pinv(maha);
mahal=maha1.*maha';

mahalanobisout=sqrt(mahal');