function contorno = VectorArea(C4,tamCont)
[g,h] = size(C4);
contorno = zeros(tamCont,2);
o=1;
for i=1:g
  for j=1:h
      if(C4(i,j)== 1)
        contorno(o,1) = i;
        contorno(o,2) = j;
        o++;
      end
  end     
end