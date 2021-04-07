clear all
clc

G=[1 2 4 ; 128 1 8 ; 64 32 16];
[f,c]=size(G); 
o=zeros(8,1);
n=0; p=0; q=0; r=0; s=0; t=0; u=0; v=0; 
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
