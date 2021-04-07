function umbralOptimo = otsu(Imagen)
Imagen = double(Imagen); %Transformar imagen en double
[f,c]=size(Imagen);%tamaño de la imagen
% Calculo de la distribucion de probabilidad de los niveles de gris
P=zeros(1,256);
for i=1:f*c
 P(Imagen(i)+1) = P(Imagen(i)+1) + 1; %histograma
end
P = P / (f*c); %funcion de probabilidad de la imagen

% Calculo del momento acumulado de orden cero y del de primer orden
    %GENERALIZAR LA IDEA DE LA MEDIA (n-SIMA PONTENCIA DE LOS VALORES VARIABLES)
omega = zeros(1,256); %nuevo vector
omega(1) = P(1);
mu = zeros(1,256); %nuevo vector

for i=2:256
 omega(i)=omega(i-1)+P(i);
 mu(i)=mu(i-1)+(i-1)*P(i);
end

% Calculo del umbral optimo segun Otsu
sigmaB2max = 0;
sigmaB2 = 0;
mut = mu(256); % Intensidad media total de la imagen
umbralOptimo = 0;
for t=2:256
 omega1 = omega(t);
 omega2 = 1 - omega1;
 if omega1~=0 & omega2~=0
 mu1 = mu(t) / omega1;
 mu2 = (mut-mu(t)) / omega2;
 sigmaB2 = omega1 * (mu1-mut)^2 + omega2 * (mu2 - mut)^2;
 if sigmaB2 > sigmaB2max
 sigmaB2max = sigmaB2;
 umbralOptimo = t;
 end
 end
end