function newx=ecuhistogram(x);
clc
newx=[];
% x es un vector o matriz formado por enteros
[m n]=size(x);
x=double(x);
mayor=max(max(x));
menor=min(min(x));

if menor>=0

histograma=zeros(1,mayor);

for i=1:m
    for j=1:n
       for k=1:length(histograma)
           if k==x(i,j)
        histograma(k)=histograma(k)+1;
           end;        
        end;   
    end;
end;

else
   mayor2=0-menor+1; 
   histograma=zeros(1,mayor2+mayor); 
   
for i=1:m
    for j=1:n
        for k=menor:mayor
            if k==x(i,j)
             histograma(k+mayor2)=histograma(k+mayor2)+1;
            end;
        end;   
    end;
end;
      
end;

histograma=histograma/(n*m);
%Normalized histogram

ecu=zeros(1,length(histograma));

for i=1:length(histograma)
    for j=1:i
        ecu(i)=ecu(i)+histograma(j);
        %ecu has the acumulative histogram
    end;
end;


if menor>=0

for i=1:m
    for j=1:n
        if x(i,j)~=0
       newx(i,j)=ecu(x(i,j))*(mayor-menor)+menor;
        else
        newx(i,j)=ecu(x(i,j)+1)*(mayor-menor)+menor;    
        end;
    end;
end;

else
    
for i=1:m
    for j=1:n
       newx(i,j)=ecu(x(i,j)+mayor2)*(mayor-menor)+menor;
    end;
end;
    
    
end;
newx=round(newx);

figure(1)
subplot(1,2,1)
imshow(uint8(x));
title('original image')
subplot(1,2,2)
imshow(uint8(newx));
title('image after histogram equalization')