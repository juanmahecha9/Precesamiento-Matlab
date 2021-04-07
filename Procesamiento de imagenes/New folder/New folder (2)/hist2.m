function histograma = hist2(x)

% x es un vector o matriz formado por enteros

[m n]=size(x);

mayor=max(max(x));
menor=min(min(x));

if menor>0

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

plot(histograma);