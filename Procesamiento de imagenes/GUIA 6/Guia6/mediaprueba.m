clc
clear all
close all


f1=CC(1,1:8);
f11=mean(f1);
f2=CC(2,1:8);
f12=mean(f2);
f3=CC(3,1:8);
f13=mean(f3);
f4=CC(4,1:8);
f14=mean(f4);
f5=CC(5,1:8);
f15=mean(f5);
f6=CC(6,1:8);
f16=mean(f6);
f7=CC(7,1:8);
f17=mean(f7);
f8=CC(8,1:8);
f18=mean(f8);
FT=(f11+f12+f13+f14+f15+f16+f17+f18)/8;

c1=CC(1:4,1);
c11=sum(c1)/4;
c2=CC(1:4,2);
c22=sum(c2)/4;
c3=CC(1:4,3);
c33=sum(c3)/4;
c4=CC(1:4,4);
c44=sum(c4)/4;
c5=CC(1:4,5);
c55=sum(c5)/4;
c6=CC(1:4,6);
c66=sum(c6)/4;
c7=CC(1:4,7);
c77=sum(c7)/4;
c8=CC(1:4,8);
c88=sum(c8)/4;
CT=(c11+c22+c33+c44+c55+c66+c77+c88)/8;