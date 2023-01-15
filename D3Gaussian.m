clear all; close all; clc;

kx = 1:80; ky = 1:80;
[X Y] = meshgrid(kx,ky);

for i=1:80
  for j=1:80
    F = exp(-0.008*(X-i).^2 - 0.0080*(Y-j).^2);
    drawnow
    waterfall(X,Y,F)
   end
end



