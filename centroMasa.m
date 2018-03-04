function [xc,yc] = centroMasa(vec)
  [w,r]=size(vec);
  m10=sum(vec(:,1));
  m01=sum(vec(:,2));
  m00 = w;
  p=1;
  q=1;
  
  xc=fix(m10/m00);
  yc=fix(m01/m00); 