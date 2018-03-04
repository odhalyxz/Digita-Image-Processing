function drn = DRN(contorno,xc,yc)
  [t,u]=size(contorno);
  Dist = numel(t);
  
  % 1. Calcular la distancia ecuclidiana entre C  y losp untos del contorno
  for i=1:t
        xi=contorno(i,1);
        yi=contorno(i,2);
        Dist(i,1)= sqrt((xi-xc)*(xi-xc)+(yi-yc)*(yi-yc));
         
      
  end
  %2. Encontrar el maximo del vector de distancias
  maximo = max(Dist);

  %3. Normalizar el vector de distancias: Dividir cada elemento entre la máxima distancia
  drn = numel(t);
  drn = Dist./maximo;