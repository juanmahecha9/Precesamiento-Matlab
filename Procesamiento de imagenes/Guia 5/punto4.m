close all
clc
clear all
warning off

% if  ((-1)^M) == 1 & ((-1)^N) == 1
%     I=A;
% elseif ((-1)^M) == 1 & ((-1)^N) == -1
%     I = imresize(A,[M,N+1]);
% elseif ((-1)^M) == -1 & ((-1)^N) == 1
%     I = imresize(A,[M+1,N]);
% elseif ((-1)^M) == -1 & ((-1)^N) == -1
%     I = imresize(A,[M+1,N+1]);
% end

%recordar cargar los ruiodos y filtrarlos con las 4 funciones
        
disp('Menu of Filters');
disp(' 1. OIDO DERECHO');
disp(' 2. OIDO IZQUIERDO');
disp(' 3. AMBOS OIDOS');


n = input('Enter a number: ');
switch n
    case 1
        disp('OIDO DERECHO');
        sound(xD,fs)

    case 2
        disp('OIDO IZQUIERDO');
        sound(xI,fs)
    case 3
        disp('AMBOS OIDOS');
        sound(s,fs)
end
    