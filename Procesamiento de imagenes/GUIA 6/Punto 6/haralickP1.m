clc
close all
clear all
warning off
A=imread('coins.png');
%[M N]=size(A);

glcm = graycomatrix(A);
