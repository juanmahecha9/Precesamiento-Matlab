 function [LBP,m] = LBPJD(I)

[H,W] = size(I);

vc=zeros(H,W); % Imagen de salida
m=zeros(1,8);  % Especie de histograma a 8 bits
Id=zeros(H+3,W+3); % Imagen que genera el boundary
Id(2:H+1,2:W+1)=I(1:H,1:W); % establecer dimenciones del boundary
Boundary=zeros(H,W); % Imagen que genera el boundary

for j=2:1:W+1
for i=2:1:H+1
s=0; % Pesos de la imagen 

% Boundary
a=Id(i-1,j-1);
b=Id(i-1,j);
c=Id(i-1,j+1);
d=Id(i,j-1);
e=Id(i+1,j-1);
f=Id(i+1,j);
g=Id(i+1,j+1);
h=Id(i,j+1);

% Pixel central
p=Id(i,j);

% Condicionales de evalucion para el LBP
if a>p
  Boundary(i-1,j-1)=1; 
  s=s+1;
  m(1)=m(1)+1; % Pesos para el histograma
end
if b>p
  Boundary(i-1,j)=1;   
  s=s+2;
  m(2)=m(2)+1; % Pesos para el histograma
end    
if c>p
  Boundary(i-1,j+1)=1;   
  s=s+4;
  m(3)=m(3)+1; % Pesos para el histograma
end
if d>p
  Boundary(i,j-1)=1;   
  s=s+128;
  m(4)=m(4)+1;
end
if e>p
  Boundary(i+1,j-1)=1;   
  s=s+64;
  m(5)=m(5)+1; % Pesos para el histograma
end
if f>p
  Boundary(i+1,j)=1;   
  s=s+32;
  m(6)=m(6)+1; % Pesos para el histograma
if g>p
  Boundary(i+1,j+1)=1;   
  s=s+16;
  m(7)=m(7)+1;  % Pesos para el histograma
end
if h>p
  Boundary(i,j+1)=1;   
  s=s+8;
  m(8)=m(8)+1; % Pesos para el histograma
end
vc(i,j)=s; % Imagen de salida segun la matriz de pesos
end
end
end
LBP = uint8(vc);


return