clc
close all
clear all
clc
datos=rand(20,6);
A=datos(1:10,:);
B=datos(11:20,:);
% dat_bar=Barajar(datos);
[Nf Nc]=size(datos);
vect_rand=rand(Nf,1);
[C index]=sort(vect_rand);
dat_bar=datos(index,:);
AA = cvpartition(20,'kfold',10);