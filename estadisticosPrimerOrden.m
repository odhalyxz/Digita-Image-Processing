function [media,R,U,E] = estadisticosPrimerOrden(original,objeto)
  %Media de los niveles de intensidad
    PPixelesT = find(objeto==1);
    media = mean(original(PPixelesT));
  %Desviacion 
    desviacionObjeto = std(PPixelesT);
    R = 1 - (1/(1+desviacionObjeto**2));
    
    
  %Uniformidad
    intesidades = 0:1:255;
    frecT = hist(PPixelesT,intesidades);
    tamT = numel(PPixelesT);
    pt = frecT / tamT;
    U = sum(pt);
    
  %Entropia
    probat = find(pt!=0);
    E = sum(probat*log2(probat));
    
   
    
    
    
  