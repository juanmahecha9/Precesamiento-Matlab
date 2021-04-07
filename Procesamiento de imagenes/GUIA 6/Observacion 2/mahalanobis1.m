clc
close all
clear all

C1=load('CATEGORIA1.mat');
C2=load('CATEGORIA2.mat');

I=imread('1.1.13.tiff');
I1=HaralickTF(I);

MCOV=cov(I1);