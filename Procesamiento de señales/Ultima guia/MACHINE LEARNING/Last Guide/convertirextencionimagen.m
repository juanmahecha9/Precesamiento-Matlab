clc
clear all
close all

clear all;  
   close all; 
   clc;
   I=imread('Lena.png');
   I=rgb2gray(I);
   figure,imshow(I)   


   w=size(I,1);     
   h=size(I,2);  
   %% LBP    
 scale = 2.^[7 6 5; 0 8 4; 1 2 3];  
 
 
    for i=2:1:w -1
        for j=2:1:h - 1  
            
            J0=I(i,j);
            
          I3(i-1,j-1)=I(i-1,j-1);  
          
          I3(i-1,j)=I(i-1,j);   
          
          I3(i-1,j+1)=I(i-1,j+1); 
          
          I3(i,j+1)=I(i,j+1);  
          
          I3(i+1,j+1)=I(i+1,j+1);  
          
          I3(i+1,j)=I(i+1,j);   
          
          I3(i+1,j-1)=I(i+1,j-1);   
          
          I3(i,j-1)=I(i,j-1); 
             
          
         LBP(i,j)=I3(i-1,j-1)+I3(i-1,j)+I3(i-1,j+1)+I3(i,j+1)+I3(i+1,j+1)+I3(i+1,j)+I3(i+1,j-1)+I3(i,j-1)/8;   
         
         
end  
   end 
    figure,imshow(LBP)      
     figure,imhist(LBP) 
% what is the issue.i am supposed to get numbers from 0 to 255 but i am not getting it. how to correct it?