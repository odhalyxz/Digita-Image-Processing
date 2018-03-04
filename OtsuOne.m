function k = OtsuOne(imagen)
  [F,C] = size(imagen);
  %Obtener histograma
  #imhist(imagen);
  % histograma normalizado
  #[h,r] =imhist(imagen);
  #p = h/(F*C);
  imNueva = reshape(imagen,F*C,1);
  r= 0:1:255;
  h = hist(imNueva,r);
  p = h/(F*C);
  %probabilidad acumulada
  pk =zeros(1,256);
  me =zeros(1,256);
  vari =zeros(1,256);
  t = zeros(1,256);
  t = r .* p;
  for i=1:255
    pk(i) = sum(p(1:i));
    me(i) = sum(t(1:i));
  end
  %Global
  Mg = me(255);
  %varianza entre las clases
  for i=1:255
    if pk(i)!= 1 && pk(i)!=0
      vari(i) = ((Mg * pk(i) - me(i))**2)/(pk(i)*(1-pk(i)));
    else
      vari(i)=0;
    end 
  end
  %valor del umbral
  [vmax, posmax]= max(vari);
  disp(posmax);
  k = zeros(F,C);
  for i=1:F
    for j=1:C
      if imagen(i,j) > posmax
        k(i,j)=1;
      end
    end
  end