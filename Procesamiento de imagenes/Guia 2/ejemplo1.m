clc
clear all
close all
img=imread('cell.tif');

mean_val   = mean(img);                       %calcula la media
max_val    = max(img);                        %calcula el m�ximo
min_val    = min(img);                        %m�nimo
range_val  = max_val-min_val;               %rango
med_val    = median(img);                     %mediana


%Calcular la distribuci�n de probabilidad de brillo.
%Campana gaussiana
%%

%Calcule la funci�n de probabilidad de densidad de brillo.
%%
