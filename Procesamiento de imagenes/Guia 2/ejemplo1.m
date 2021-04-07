clc
clear all
close all
img=imread('cell.tif');

mean_val   = mean(img);                       %calcula la media
max_val    = max(img);                        %calcula el máximo
min_val    = min(img);                        %mínimo
range_val  = max_val-min_val;               %rango
med_val    = median(img);                     %mediana


%Calcular la distribución de probabilidad de brillo.
%Campana gaussiana
%%

%Calcule la función de probabilidad de densidad de brillo.
%%
