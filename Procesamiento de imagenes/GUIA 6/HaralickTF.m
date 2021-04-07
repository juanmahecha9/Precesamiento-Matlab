
%%
%http://murphylab.web.cmu.edu/publications/boland/boland_node26.html#eqn:cho_g
%http://www.uio.no/studier/emner/matnat/ifi/INF4300/h08/undervisningsmateriale/glcm.pdf
%http://earlglynn.github.io/RNotes/package/EBImage/Haralick-Textural-Features.html
%%
function Haralick=HaralickTF(I)

% figure,imshow(I),title('Original Image');
[m n]=size(I);%Size of the image
%%
%matrix of CO-Relation
CC1= graycomatrix(I);
NormalCC=sum(sum(CC1));
CC = CC1./NormalCC;
DD=CC;
[m1 n1]=size(CC);
Lim=(2*m1);
sizecoOcMat = size(CC);
[col,row] = meshgrid(1:sizecoOcMat(1),1:sizecoOcMat(2));
%%
%Vector of Haralik
Haralick=zeros(14,1);
%%
%the 14 Haralick Texture Features
%%
% 1. Angular second moment or Energy 
ASM=0; %acumulator
I=double(I);
for i=1:1:m1
    for j=1:1:n1
        ASM=((CC(i,j).^2)+ASM);
    end
end
Haralick(1)=ASM;

%%
%2. Contrast
% 
% CONTR=0;
% for i=1:1:n1
%     for j=1:1:m1
%         CONTR=(((abs(i-j).^2).*DD(i,j))+CONTR);
%     end
% end
% CONTR=2*CONTR;
% Haralick(2)=CONTR;

for i=1:1:n1
    T1(i)=(i);
    for j=1:1:m1
        T2(j)=(j);
        T3(i,j)=T1(i)-T2(j);
        T4=(abs(T3).^2);        
    end
end
CR=0;
for i=1:1:n1
    for j=1:1:m1
        CR=CR+(T4(i,j).*DD(i,j));        
    end
end
Haralick(2)=(CR);

%%
% 3.Correlation
% forma 1
% f1=DD(1,1:8);
% f11=mean(f1);
% sf1=std(f1);
% 
% f2=DD(2,1:8);
% f12=mean(f2);
% sf2=std(f2);
% 
% f3=DD(3,1:8);
% f13=mean(f3);
% sf3=std(f3);
% 
% f4=DD(4,1:8);
% f14=mean(f4);
% sf4=std(f4);
% 
% f5=DD(5,1:8);
% f15=mean(f5);
% sf5=std(f5);
% 
% f6=DD(6,1:8);
% f16=mean(f6);
% sf6=std(f6);
% 
% f7=DD(7,1:8);
% f17=mean(f7);
% sf7=std(f7);
% 
% f8=DD(8,1:8);
% f18=mean(f8);
% sf8=std(f8);
% 
% MFT=mean([f11 f12 f13 f14 f15 f16 f17 f18]);
% SFT=std([sf1 sf2 sf3 sf4 sf5 sf6 sf7 sf8]);
% 
% 
% c1=DD(1:8,1);
% c11=mean(c1);
% sc1=std(c1);
% 
% c2=DD(1:8,2);
% c22=mean(c2);
% sc2=std(c2);
% 
% c3=DD(1:8,3);
% c33=mean(c3);
% sc3=std(c3);
% 
% c4=DD(1:8,4);
% c44=mean(c4);
% sc4=std(c4);
% 
% c5=DD(1:8,5);
% c55=mean(c5);
% sc5=std(c5);
% 
% c6=DD(1:8,6);
% c66=mean(c6);
% sc6=std(c6);
% 
% c7=DD(1:8,7);
% c77=mean(c7);
% sc7=std(c7);
% 
% c8=DD(1:8,8);
% c88=mean(c8);
% sc8=std(c8);
% 
% C1std=[sc1 sc2 sc3 sc4 sc5 sc6 sc7 sc8];
% MCT=mean([c11 c22 c33 c44 c55 c66 c77 c88]);
% SCT= std(C1std);
% 
% CORR1=0;
% for i=1:1:m1
%     for j=1:1:n1
%        IJ=i*j;
%        CORR1=((((IJ)*DD(i,j))-(MCT*MFT)))/(SCT*SFT);
%     end
% end
% CORR=CORR1;
% Haralick(3)=CORR;

%Forma 2
CCT=CC';

miux=mean(mean(CC));
miuy=mean(mean(CCT));

stdx=std(std(CC));
stdy=std(std(CCT));

CORR1=0;
for i=1:1:m1
    for j=1:1:n1
       IJ=i*j;
       CORR1=((((0.5)*DD(i,j))-(miux*miuy)))/(stdx*stdy);
    end
end
CORR=CORR1;
Haralick(3)=CORR;

%%
% 4. Sum of square: VARIANZA
miu1=mean(mean(DD'));
V=0;
VAR=0;
for i=1:m1
    for j=1:n1
         V=(i-miu1).^2;
         VAR=VAR+(V.*DD(i,j));
    end
end
Haralick(4)=VAR;

%%
% 5. Inverse different moment (Homogeneity)
IDM=0;
for i=1:1:m1
    for j=1:1:n1
      ID1=(1+(row(i,j)-col(i,j)).^2);
      ID2=DD(i,j)./ID1;
      IDM=IDM+ID2;
    end
end
Haralick(5)=IDM;

%%
% 6. Sum average
%P(x+y)
PXY=zeros(15,1);
for k=2:1:Lim
    for i=1:m1
        for j=1:n1
            if (i+j)==k            
                PXY(k-1)=DD(i,j)+PXY(k-1);
            end
        end
    end
end

SAV=0;
for i=2:1:16
    SAV=(i*PXY(i-1))+SAV;
end
Haralick(6)=SAV;
%%
% 7. Sum Variance [sva]
PXY=zeros(15,1);
for k=2:1:16
    for i=1:m1
        for j=1:n1
            if (i+j)==k
                PXY(k-1)=DD(i,j)+PXY(k-1);
            end
        end
    end
end
Lim=(2*m1);

SVA=0;
for i=2:1:Lim
    SVA=(((i).^2)*(PXY(i-1)))+SVA;
end
Haralick(7)=SVA;

%%
% 8. Sum Entropy [sen]
SEN1=0;
for i=2:Lim-1
    SEN1=SEN1+(PXY(i-1).*log2((PXY(i))+0.000000000001));
end
SEN=-(SEN1/2);
Haralick(8)=SEN;

%%
% 9. Entropy
del=0.0000000000001;
ENTRO=0;
for i=1:m1
    for j=1:n1
        ENTRO=(DD(i,j).*log2(DD(i,j)+del))+ ENTRO;
    end
end
Haralick(9)=abs(ENTRO);

%%
% 10. Difference of variance DVA
PXYm=zeros(15,1);
for k=1:1:15
    for i=1:m1
        for j=1:n1
            if abs((i-j))==k
                PXYm(k)=DD(i,j)+PXYm(k);
            end
        end
    end
end

DVA=var(PXYm.*10);
Haralick(10)=DVA;


%%
% 11. Difference entropy DEN

DEN=0;
for i=2:1:Lim
    PIX1=(PXYm(i-1));
    DEN1=log2(PXYm(i-1)+0.0000001);
    DEN=DEN+(PIX1*DEN1);
end
DEN=-DEN;
Haralick(11)=DEN;
            
%%
%12.  Information Measures of Correlation I.
% DD=double(DD);
% px=0;
% for i=1:m1
%     for j=1:n1
%         px(j)=DD(i,j);
%     end
% end
px= sum(DD,2); %SUMA DE LAS FILAS

HX=0;
for i=1:m1
    G=px(i);
    X=log(0.00001+G);
    HX(i)=G*X;
end

% py=0;
% for i=1:m1
%     for j=1:n1
%         py(i)=DD(i,j);
%     end
% end
py = sum(DD); %SUMA DE LAS COLUMNAS
HY=0;
for i=1:m1
    G1=px(i);
    X1=log(0.00001+G1);
    HY(i)=G1*X1;
end



HXY1=0;
for i=1:m1
    for j=1:n1
        F1=DD(i,j);
        L=log((px(i)*py(j))+0.000000001);
        HXY1(i,j)=(F1*L);
    end
end
HXY1=-sum(sum(HXY1));

HXY2=0;
for i=1:m1
    for j=1:n1
        F2=DD(i,j);
        L1=log((px(i)*py(j))+0.1);
        HXY2=(px(i)*py(j)*F1*L)+HXY2;
    end
end
HXY2=-HXY2;
   
IMC1=0;
f12=abs(ENTRO)-HXY1;
f112=max([HX HY]);
IMC1=sum((f12/f112));
if IMC1== Inf
    IMC1=1;
end
Haralick(12)=2*(IMC1/(m1*n1));


%%
%13.  Information Measures of Correlation II.
IMC2=0;
f13=(-2)*(HXY2-abs(ENTRO));
f113=1-exp(f13);
IMC2=abs(f113).^(1/2);
Haralick(13)=IMC2/(m1*n1);


%%
%14. Maximal Correlation Coefficient
PT=0;
MCC=0;
for i=1:1:m1
    for j=1:1:n1
        MCC(i)=((DD(i,j))*DD(j,i))./(px(i).*py(j));
    end
end
MCC1=max(MCC);
Haralick(14)=MCC1;
        
