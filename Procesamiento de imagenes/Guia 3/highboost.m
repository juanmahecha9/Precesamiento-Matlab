function Iout=highboost(I)
%Filtro Highboost
x=[1 1 1;1 1 1;1 1 1]./9;
f1=convolucion2d(I,x);
k=5;
u=[0 -1 0;-1 k+3 -1; 0 -1 0];
f2=convolucion2d(I,u)+f1;
Iout=f2;


