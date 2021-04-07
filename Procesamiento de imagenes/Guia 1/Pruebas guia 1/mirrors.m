% %Mirror
% % for i=1:1:H
% %     for j=1:1:W
% %         Image8(j,i)=Image(i,j); %reflexion con la diagonal
% %     end
% % end
% % 
% % for i=1:1:H
% %     for j=1:1:W
% %         Image9(H-i+1,j)=Image(i,j); %reflexion sobre la horizontal
% %     end
% % end
% for i=1:1:H
%     for j=1:1:W
%         Image10(H-i,W-j+1)=Image(i,j); %reflexion con la vertical
%     end
% end
% 
% % for i=1:1:H
% %     for j=1:1:W
% %         Image11(i,j)=((2).^B)-Image(i,j); %negativo de la imagen
% %     end
% % end
% % 
% % 
% % for i=1:1:H-1
% %     for j=1:1:W-1
% %         Image12(i,j)=Image(i+1,j+1)-Image(i,j); %filtro pasa altos (detector de alta frecuencia)
% %     end
% % end
% 
% % figure, imshow(Image8), title('Reflexion con la Diagonal');
% % figure, imshow(Image9), title('Reflexion con la Horizontal');
% figure, imshow(Image10), title('Reflexion con la Vertical');
% % figure, imshow(Image11), title('Negativo ');
% % figure, imshow(Image12), title('Filtro pasa altos Detector de alta frecuencia');
