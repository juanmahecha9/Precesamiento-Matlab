clc
clear all
close all


choice = menu('Choose a unit','Low pass filter','High pass filter','High pass ideal filter type Butterworth','Low pass ideal filter type Butterworth');

switch choice
      case 'Low pass filter'
          I=imread('magao.png');
I=rgb2gray(I);

          disp('Low Pass Filter');
           lowpass(I,60);
      case 'High pass filter'
I=imread('magao.png');
I=rgb2gray(I);

          disp('High pass Filter');
         highpass(I,20);
      case 'High pass ideal filter type Butterworth'
I=imread('magao.png');
I=rgb2gray(I);

          disp('High pass ideal filter type Butterworth ');
           Butterworthalto(I,20);
      case 'Low pass ideal filter type Butterworth'
I=imread('magao.png');
I=rgb2gray(I);

          disp('Low pass ideal filter type Butterworth ');
         Butterworthbajo(I,40);
     
end

