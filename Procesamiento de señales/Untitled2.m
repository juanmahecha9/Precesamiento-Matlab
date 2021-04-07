%el dominio anal�gico tenemos 2 opciones:
%la instrucci�n para generar un filtro del grado que el usuario desee, as�
%como la manipulaci�n de la frecuencia de corte
%el comando para que a partir del grado, tipo y amortiguamiento, se obtenga
%los polos u ceros y ganancia que puede tener el filtro
%dise�o de un filtro pasa banda de 4 Hz a 60Hz y el resultado de ingresar
%una se�al y pasarla por el filtro
%DEFINIMOS CARACTER�STICAS DE LA Se�al Y EN FILTRO EN TIEMPO FRECUENCIA DE
%ATENUACI�N
%DEFINIMOS EL PERIODO DE LA SE�AL EN UN VALOR DE 0.01SEG
pas=0.01;
t=0:pas:10;
%DEFINIMOS LA FRECUENCIA DE MUESTREO QUE ES EL INVERSO DEL PERIODO DE LA
%SE�AL ADEMAS DE LA FRECUENCIA DE CORTE QUE ES EL INVERSO DE LA FRECUENCIA
%DE MUESTREO LA CUAL VA A SER UTILIZADA EN NUESTRO FILTRO Y RESULTA EL
%INVERSO DEL PERIODO DE LA SE�AL
fm=1000;
fs=fm/2;

%DEFINIMOS LA BANDA DE PASO Y DE CORTE DE NUESTRO FILTRO
wp=[100 250]/fs;
ws=[10 300]/fs;

%establecemos los valores rp (valor de la tolerancia de nuestro filtro) y de
%rs (valor de la atenuaci�n de la banda eliminada)

rp=3;
rs=30;

%definimos la se�al la cual vamos a utilizar para pasar por el filtro de
%butterworth que es la se�al ECG que previamente guardamos
%senal=sin(10*pi*t)+cos(15*t+t.^2);
senal = load('v1.dat');
%graficamos la se�al de muestra
%definimos el eje de tiempo
ejet=[0:pas:(length(senal)-1).*pas];
subplot(4,1,1);
plot(ejet,senal);
axis([min(ejet) max(ejet) min(senal) max(senal)]);
xlabel('t(s)');
ylabel('Input(s)')
title('Grafico de la Senal 0')
%graficamos el espectro de la amplitud de la se�al de muestra
subplot(4,1,2);
dim=length(senal).*pas;

%definimos el eje de frecuencia para la gr�fica del espectro se�al

ejefrec=[0:1/dim:(length(senal)-1)/dim];
spectr=abs(fft(senal));

%obtenemos la amplitud del espectro de la se�al
spectr=spectr/max(spectr);
plot(ejefrec,spectr);
axis([0 10 0 max(spectr)]);
xlabel('frecuencia(Hz)');
title('Espectro de amplitud de la senal')

%obtenemos el orden del filtro de butterworty la frecuencia normalizada con
%la ayuda del comando buttord 
[n,wn]=buttord(wp,ws,rp,rs);

%con los datos anteriores y con la ayuda del comando butter obtenemos los
%coeficientes de la funci�n de trasferencia para el filtro de butterworth

[b,a]=butter(n,wn);
[h,f]=freqz(b,a,[],fm);
subplot(4,1,3);
plot(f,abs(h));
axis([0 10 0 max(spectr)]);
xlabel('freciencia(Hz)');
ylabel('I H(z)I');
title('Filtro')

%para poder observar el resultado de filtrar nuestra se�al de muestra la
%convulsionamos con el filtro con la ayuda del comando filter y
%on=btenemos el resultado de la se�al filtrada 
ysig=filter(b,a,senal);
subplot(4,1,4);
plot(ejefrec,abs(fft(ysig)));
axis([0 10 0 500]);
xlabel('Frecuencia (Hz)');
ylabel('Senal Filtrada(Hz)');
title('Senal Filtrada');