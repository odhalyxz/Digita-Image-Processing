function [mc]=matrizCocurrencias(mstr, d, ang)
  [F,C]=size(mstr);
  mc= zeros(256,256);
  for x=1:F
    for y=1:C
      if ang == 0
        if rango(x,y+d,F,C)
          mc( mstr(x,y), mstr(x,y+d))+=1;
        end
        if rango(x,y-d,F,C)
          mc( mstr(x,y), mstr(x,y-d))+=1;
        end
      end
      if ang == 45
        if rango(x+d,y-d,F,C)
          mc( mstr(x,y), mstr(x+d,y-d))+=1;
        end
        if rango(x-d,y+d,F,C)
          mc( mstr(x,y), mstr(x-d,y+d))+=1;
        end
      end
      if ang == 90
        if rango(x+d,y,F,C)
          mc( mstr(x,y), mstr(x+d,y))+=1;
        end
        if rango(x-d,y,F,C)
          mc( mstr(x,y), mstr(x-d,y))+=1;
        end
      end
      if ang == 135
        if rango(x+d,y+d,F,C)
          mc( mstr(x,y), mstr(x+d,y+d))+=1;
        end
        if rango(x-d,y-d,F,C)
          mc( mstr(x,y), mstr(x-d,y-d))+=1;
        end
      end
    end
  end
end
 function [flag] = rango(rx,ry,nr,nc)
     flag = false;
     if( rx >0 && rx <= nr && ry>0 && ry <= nc)
         flag = true;
     end
 end