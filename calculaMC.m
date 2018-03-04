function [ASM0,ASM45,ASM90,ASM135,Promedio4] = calculaMC(muestra)
  
    MCC1 = matrizCocurrencias(muestra,1,0);
    p0 = MCC1 / sum(sum(MCC1));
    ASM0 = sum(sum(p0**2));
    
    MCC2 = matrizCocurrencias(muestra,1,45);
    p45 = MCC2 / sum(sum(MCC2));
    ASM45 = sum(sum(p0**2));
    
    MCC3 = matrizCocurrencias(muestra,1,90);
    p90 = MCC2 / sum(sum(MCC3));
    ASM90 = sum(sum(p90**2));
    
    MCC4 = matrizCocurrencias(muestra,1,90);
    p135 = MCC2 / sum(sum(MCC4));
    ASM135 = sum(sum(p135**2));
    
    
    Promedio4 = (ASM0 +ASM45 + ASM90 + ASM135)/4 ;
    
    
    
    
  