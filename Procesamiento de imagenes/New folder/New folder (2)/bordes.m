function Y=bordes(h,A); 

[b c d]=size(h);

if d>1
   h=h(:,:,2);
end;

b=b*c;

[f c d]=size(A);

if d>1
   A=A(:,:,2);
end;

f=f*c;

if f<b
    h0=A;
    A=h;
    h=h0;
end;
clear h0;

[f c]=size(A);
[b d]=size(h);

Y=zeros(f+b,c+d);

A=double(A);

for i=1:f
    for j=1:c
        for k=1:i
            for l=1:j
                if k>b || l>d
                    break;
                else
               Y(i,j)=Y(i,j)+h(k,l)*A(i-k+1,j-l+1); 
                end;
            end;
        end;
    end;
end;

Y=Y(1:f,1:c);
