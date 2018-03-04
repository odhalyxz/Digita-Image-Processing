function [Conl] = contorno(l, vec)
 [fils, cols] = size(l);
 Conl = zeros(fils, cols);
 for i = 1:fils
       for j = 1:cols
           if (l(i,j) == 1)
               flagC = false;
               k = 0;
               if( vec == 4)
                   indexi = [-1 0 0 1];
                   indexj = [0 -1 1 0];
               else
                   indexi = [-1 -1 -1 0 0 1 1 1];
                   indexj = [-1 0 1 -1 1 -1 0 1];
               end 
               k = 1;
               while ( flagC == false && k <= vec)
                   if(rango(i+indexi(k),j+indexj(k),fils,cols)) %pixel caiga dentro de la imagen
                       if(l(i+indexi(k),j+indexj(k)) == 0)  %checando su intensidad
                           flagC = true;
                       end
                   else
                       flagC = true;
                   end
                   k = k +1;
               end
               if(flagC)
                   Conl(i,j)=1;
               end
           end
       end
 end
 function [flag] = rango(rx,ry,nr,nc)
     flag = false;
     if( rx >0 && rx <= nr && ry>0 && ry <= nc)
         flag = true;
     end
         