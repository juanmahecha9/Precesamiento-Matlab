function mahalanobisout=mahalanobis(I,Hdma);
% I es la observacion A es la categoria
Har=HaralickTF(I);
CC=graycomatrix(I);
for i=1:1:length(Hdma)
    maha(i)=Har(i)-Hdma(i);
end
   
maha1=pinv(CC);
mahal=maha1.*maha';

MA=mahal*maha;

mahalanobisout=sqrt(MA);