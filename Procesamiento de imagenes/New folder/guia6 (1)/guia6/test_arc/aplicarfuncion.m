clear all
close all
clc
pad=('C:\Users\kimberly\Documents\octavo\PDI\guia6\test_arc'); %direction of the folder that contains the images.
cd(pad);
load('test_arc.mat');
v=funcionlbp(Ib);
imshow(v,[]);