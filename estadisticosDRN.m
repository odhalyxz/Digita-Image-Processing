%ESTAD�STICOS DE LA DISTANCIA RADIAL NORMALIZADA
function [mediadrn,desvEstandar,crucesX0,A,R] = estadisticosDRN(drn)
  [t,u]=size(drn);
  % Media
    mediadrn = mean(drn);
  % Desviaci�n Est�ndar
    desvEstandar = std(drn);
    
  % N�mero de VEces que drn(i) > mediadrn
    crucesX0=0;
    for i=1:t
          if(drn(i) > mediadrn)
            crucesX0++;
          end
    end
  %Indice de Area
    sum = 0 ;
    for i=1:t
      sum = drn(i)-mediadrn +sum;
    end
    
    A = sum/(t*mediadrn);
  
  % �ndice de Rugocidad
  
    sum = 0 ;
    for i=1:(t-1)
      sum = drn(i)-drn(i+1)+sum;
    end
    
    R = sum/(t*mediadrn);

  