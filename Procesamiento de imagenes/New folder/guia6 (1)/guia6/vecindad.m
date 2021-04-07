clear all
clc

I=imread('rice.png');
[f,c]=size(I);
Pesos=[1 2 4 ; 128 1 8 ; 64 32 16];
I1=zeros(3,3);

o=zeros(8,1);
n=0; p=0; q=0; r=0; s=0; t=0; u=0; v=0; 
for i=2:1:f-1
    for j=2:1:c-1
     
     if I(i-1,j-1)>=I(i,j)
        I1(1,1)=1;
        else 
        I1(1,1)=0;
     end
     if I(i-1,j)>=I(i,j)
        I1(1,2)=1; 
     else 
        I1(1,2)=0;
     end
     
     if I(i-1,j+1)>=I(i,j)
        I1(1,3)=1; 
     else 
        I1(1,3)=0;
     end
     
     if I(i,j-1)>=I(i,j)
        I1(2,1)=1; 
     else 
        I1(2,1)=0;
     end
     
     if I(i,j)==I(i,j)
        I1(2,2)=0; 
     end
     
     if I(i,j+1)>=I(i,j)
        I1(2,3)=1; 
     else 
        I1(2,3)=0;
     end
     
     if I(i+1,j-1)>=I(i,j)
        I1(3,1)=1; 
     else 
        I1(3,1)=0;
     end
     
     if I(i+1,j)>=I(i,j)
        I1(3,2)=1; 
     else 
        I1(3,2)=0;
     end
     
     if I(i+1,j+1)>=I(i,j)
        I1(3,3)=1; 
     else 
        I1(3,3)=0;
     end
     
     G=I1.*Pesos;
     H=sum(sum(G));
     
     VCK(i-1,j-1)=H;  
     
   
[f,c]=size(G);

for l=1:1:f
    for k=1:1:c
        m=G(l,k);
        if m==1
           n=1+n;
           o(1,1)=n;
        end
        if m==2
           p=1+p;
           o(2,1)=p;
        end
        if m==4
           q=1+q;
           o(3,1)=q;
        end
        if m==8
           r=1+r;
           o(4,1)=r;
        end
        if m==16
           s=1+s;
           o(5,1)=s;
        end
        if m==32
           t=1+t;
           o(6,1)=t;
        end
        if m==64
           u=1+u;
           o(7,1)=u;
        end
        if m==128
           v=1+v;
           o(8,1)=v;
        end
    end
end
     
     
    end
    

    
end

