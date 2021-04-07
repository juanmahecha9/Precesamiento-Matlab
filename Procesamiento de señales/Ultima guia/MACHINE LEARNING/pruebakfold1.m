clear;
for nc = 1 : 36  % nc number of users
            % Load data into MATLAB
    data{nc} = load( sprintf('J:\PDI\Ultima guia\MACHINE LEARNING\imagenes', nc) );  
             % assign data into Matrix
      Feat_Vec1{nc} = data{nc}.Acc_TD_Feat_Vec(:,:);   
 end