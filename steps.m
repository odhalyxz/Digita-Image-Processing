clear all;
close all;
pkg load image;
im1=imread('C:\Users\Alumnos\Downloads\bola.bmp');
[M,N] = size(im1);
J = double(im1);
%Preprocesamiento 
filtro = filter2(fspecial('average',3),J);

% SEGMENTACION
imagenRes = OtsuOne(filtro);

% AISLAMIENTO DE REGIONES

iLabel= bwlabel(imagenRes,4);
pelota = uint8(iLabel ==1) ;
telefono = uint8(iLabel ==4) ;
bocina = uint8(iLabel ==2) ;

% ================================================================%
figure; imshow(im1,[]);title("Original");
figure; imshow(filtro,[]);title("Mediana");
figure; imshow(imagenRes,[]);title("Otsu");
figure; imshow(iLabel,[]);title("Etiquetado");
figure; imshow(pelota,[]);title("Pelota");
figure; imshow(telefono,[]);title("Telefono");
figure; imshow(bocina,[]);title("Telefono");
% ================================================================%
# DESCRIPTORES DE TAMAÑO
 % Área
  contPelota = sum(sum(pelota)); %Este es el area de la pelota
  contTelefono = sum(sum(telefono)); % Esta es el area del telefono
  contBocina = sum(sum(bocina)); % Esta es el area de la bocina

 % Perímetro
  [C1,tamC1] = perimetro(pelota,4);
  %figure; imshow(C1,[]); title("Contorno de la pelota");
  
  [C2,tamC2] = perimetro(telefono,4);
  %figure; imshow(C2,[]); title("Contorno del telefono");

  [C3,tamC3] = perimetro(bocina,4);
  %figure; imshow(C3,[]); title("Contorno del bocina");
  
# DESCRIPTORES DE FORMA
  % Compacidad
  compacidadPelota = compacidad(contPelota,tamC1);
  compacidadTelefono = compacidad(contTelefono,tamC2);
  compacidadBocina = compacidad(contBocina,tamC2);
  
  % Centro de Masa
  
  vecC1 = VectorContorno(C1,tamC1); 
  [xc1,yc1] = centroMasa(vecC1);
  
  vecC2 = VectorContorno(C2,tamC2); 
  [xc2,yc2] = centroMasa(vecC2);
  
  vecC3 = VectorContorno(C3,tamC3); 
  [xc3,yc3] = centroMasa(vecC3);
  
  % Calcular la drn para cada region
  
  drnC1 = DRN(vecC1,xc1,xc1);
  drnC2 = DRN(vecC2,xc2,xc2);
  drnC3 = DRN(vecC3,xc3,xc3);
  
  
  %Calcula los estadistiocos de la distancia radial normal
    %MediaDRN
    %desviacionEstandar
    %CrucesXCero
    %Indice de Área
    %Índice de Rugocidad
  
  [mediadrnC1,desvEstandarC1,crucesX0C1,AC1,RC1] = estadisticosDRN(drnC1);
  [mediadrnC2,desvEstandarC2,crucesX0C2,AC2,RC2] = estadisticosDRN(drnC2);
  [mediadrnC3,desvEstandarC2,crucesX0C3,AC3,RC3] = estadisticosDRN(drnC3);
  
# DESCRIPTORES DE TEXTURA
  
  
  % Descriptores de Primer Orden
  [mediaPOC1,desvEstandarPOC1,UC1,EC1]=estadisticosPrimerOrden(im1,pelota);
  [mediaPOC2,desvEstandarPOC2,UC2,EC2]=estadisticosPrimerOrden(im1,telefono);
  [mediaPOC3,desvEstandarPOC3,UC3,EC3]=estadisticosPrimerOrden(im1,bocina);
  
  % Descriptores de Segundo  Orden
  
  #Pelota
    posiXC1 = xc1-8;
    posiYC1 = yc1-8;
    muestraC1 = im1(posiXC1:posiXC1+16,posiYC1:posiYC1+16);
    %figure; imshow(muestraC1 ,[]);title("Muestras en C1:Bocina");
  #Telefono
    posiXC2 = xc2-8;
    posiYC2 = yc2-8;
    muestraC2 = im1(posiXC2:posiXC2+16,posiYC2:posiYC2+16);
    %figure; imshow(muestraC2 ,[]);title("Muestras en C2:Telefono");
  #Bocina
  
    posiXC3 = xc3-8;
    posiYC3 = yc3-8;
    muestraC3 = im1(posiXC3:posiXC3+16,posiYC3:posiYC3+16);
    %figure; imshow(muestraC3 ,[]);title("Muestras en C3:Bocina");
    
    
  % Descriptores de Segundo Orden 
  
    [ASM0C1,ASM45C1,ASM90C1,ASM135C1,PromedioC1] = calculaMC(muestraC1);
    [ASM0C2,ASM45C2,ASM90C2,ASM135C2,PromedioC2] = calculaMC(muestraC2);
    [ASM0C3,ASM45C3,ASM90C3,ASM135C3,PromedioC3] = calculaMC(muestraC3);
    
    
  
    
    
    
    
  
  
  
  


  

  

  



  
  
  
  
  
  
  
  
  
  

  
















