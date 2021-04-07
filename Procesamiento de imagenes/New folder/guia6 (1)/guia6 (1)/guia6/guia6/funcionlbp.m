function [VCK,x,y]=funcionlbp(I)

[f,c]=size(I);
Pesos=[1 2 4 ; 128 1 8 ; 64 32 16];
I1=zeros(3,3);
x=[1;2;4;8;16;32;64;128];
y=zeros(1,8);
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
     
    end
end



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
[f,c]=size(G);

for l=1:1:f
    for k=1:1:c
        m=G(l,k);
        if m==1
           n=1+n;
           y(1,1)=n;
        end
        if m==2
           p=1+p;
           y(1,2)=p;
        end
        if m==4
           q=1+q;
           y(1,3)=q;
        end
        if m==8
           r=1+r;
           y(1,4)=r;
        end
        if m==16
           s=1+s;
           y(1,5)=s;
        end
        if m==32
           t=1+t;
           y(1,6)=t;
        end
        if m==64
           u=1+u;
           y(1,7)=u;
        end
        if m==128
           v=1+v;
           y(1,8)=v;
        end
    end
end
     
     
    end
    

    
end




end