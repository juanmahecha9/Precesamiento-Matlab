function [LBP, Boundary]=LBPfunction(I)

% Si la imagen va a color, convertir en escala de grises
if size(I, 3) == 3
    I = rgb2gray(I);
end

[H,W]=size(I);
LBP = zeros(size(I));
matriz=[1 2 4; 128 0 8 ;64 32 16];
Boundary=zeros(1,8);

for i=2:W-1
    for j=2:H-1
        s=0;
        % Boundary 
    a=I(i-1,j-1);
    b=I(i-1,j);
    c=I(i-1,j+1);
    d=I(i,j-1);
    e=I(i+1,j-1);
    f=I(i+1,j);
    g=I(i+1,j+1);
    h=I(i,j+1);
        % Pixel Central
        p=I(i,j);

    if a>p
        D(i-1,j-1)=1; 
        s=s+1;
        Boundary(1)=Boundary(1)+1;
    end
    
    if b>p
        D(i-1,j)=1;   
        s=s+2;
        Boundary(2)=Boundary(2)+1;
    end    
    
    if c>p
        D(i-1,j+1)=1;   
        s=s+4;
        Boundary(3)=Boundary(3)+1;
    end
    
    if d>p
        D(i,j-1)=1;   
        s=s+128;
        Boundary(4)=Boundary(4)+1;
    end
    
    if e>p
        D(i+1,j-1)=1;   
        s=s+64;
        Boundary(5)=Boundary(5)+1;
    end
    
    if f>p
        D(i+1,j)=1;   
        s=s+32;
        Boundary(6)=Boundary(6)+1;
    end
    
    if g>p
        D(i+1,j+1)=1;   
        s=s+16;
        Boundary(7)=Boundary(7)+1; 
    end
    
    if h>p
        D(i,j+1)=1;   
        s=s+8;
        Boundary(8)=Boundary(8)+1;
    end
    
    vc(i,j)=s;
       
     % Boundary 
     B = I(i-1:i+1 , j-1:j+1);
     Y=B(2,2)<B;
     lbpmul=Y*matriz;
     Sk=sum(sum(lbpmul));
     
     LBP(i,j)=Sk;
    end
end

LBP=(LBP);
        