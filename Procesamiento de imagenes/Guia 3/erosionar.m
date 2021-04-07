function convolucion=erosionar(Ih,Iw,I)

Id=zeros(Ih+3,Iw+3);
Id(2:Ih+1,2:Iw+1)=I(1:Ih,1:Iw);

for j=2:1:Iw+1
for i=2:1:Ih+1
a=Id(i-1,j-1);
b=Id(i-1,j);
c=Id(i-1,j+1);
d=Id(i,j-1);
e=Id(i+1,j-1);
f=Id(i+1,j);
g=Id(i+1,j+1);
h=Id(i,j+1);
p=Id(i,j);
if ((p==1) && (b==0||d==0||e==0||g==0))
    p=0;
end
 convolucion(i,j)=p;    
end
end
return 