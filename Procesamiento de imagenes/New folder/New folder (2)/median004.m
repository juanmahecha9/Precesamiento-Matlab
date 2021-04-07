A=imread('mamografia.png');
clc;
A2=A;
A=double(A);
[f c]=size(A);
temp=0;
H=zeros(1,9);

for i=1:3:f
    for j=1:3:c
    n=1;
        
        for k=0:2
            for l=0:2
                
                if i+k>f || j+l>c
                    break;
                else
            H(n)=A(i+k,j+l);
            n=n+1;
                end;
                
            end;
        end;
        
        %%%%%
        
        for k=1:8
            for l=k+1:9
              if H(k)<H(l)
              temp=H(k);
              H(k)=H(l);
              H(l)=temp;
              end;
            end;
        end;
        %%%%%
        
        for k=0:2
            for l=0:2
                
                if i+k>f || j+l>c
                    break;
                else
                A(i+k,j+l)=H(5);            
                end;
                
            end;
        end;
        
        %%%%%
                               
    end;
end;

figure(1)
subplot(1,2,1)
imshow(uint8(A2))
title('original image')
subplot(1,2,2)
imshow(uint8(A))
title('image after median filtering')