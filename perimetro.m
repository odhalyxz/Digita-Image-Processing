function [C4,tamCont] = perimetro(Img,tipoC)
  C4 = contorno(Img,tipoC);
  %figure;imshow(C4,[]);title("C4");
  [g,h] = size(C4);
  %Obitne el tamaño del contorno
  tamCont = 0;
  for i=1:g
    for j=1:h
        if(C4(i,j)== 1)
          tamCont++;
          
        end
    end     
  end