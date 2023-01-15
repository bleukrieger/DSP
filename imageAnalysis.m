clear all; close all; clc;

I1 = imread('JimiHendrix.jpg');
Xdim = size(I1,1);
Ydim = size(I1,2);
x = linspace(1,Xdim,Xdim);
y = linspace(1,Ydim,Ydim);
Ydim = size(I1,2);
filler=zeros(350,300);

[X Y] = meshgrid(y,x);

R = cat(3,I1(:,:,1),filler,filler);
Rp = (I1(:,:,1));
%RpMax = max(Rp);

G = cat(3,filler,I1(:,:,2),filler);
Gp = (I1(:,:,2));
B = cat(3,filler, filler, I1(:,:,3));
Bp = (I1(:,:,3));

%I=linspace(1,Xdim,Xdim);
%J=linspace(1,Ydim,Ydim);
%
%for i=1:10:Xdim
% for j=1:10:Ydim
%  F = exp(-0.0008*(X-i).^2 - 0.0008*(Y-j).^2);
%    RF1 = F.*double(Gp);
%    subplot(2,1,1), surfl(RF1), shading interp, colormap(gray),
%
%    RF1t = abs(fftshift(fft2(RF1)));
%    %subplot(2,1,2), surfl(RF1t), shading interp, colormap(gray)
%    subplot(2,1,2), pcolor(RF1t), colormap(hot), shading interp
%  drawnow
% end
%end
%
%stem(I);
%% RGB Domain Separation

figure(1)
imshow(I1)

figure(2)
surfl(double(Rp)), shading interp
%subplot(3,1,1), surfl(double(Rp)), view(-50,100), colormap(hot)
%subplot(3,1,2), surfl(Y,X,double(Gp)), view(-50,100), colormap(hot)
%subplot(3,1,3), surfl(Y,X,double(Bp)), view(-50,100), colormap(hot)

figure(3)
subplot(3,1,1), imshow(R)
subplot(3,1,2), imshow(G)
subplot(3,1,3), imshow(B)

%% Selective Filtering in RGB Domain
RiX =15; RiY=56;
RfX =128; RfY=166;
GiX=1;GiY=1;
BiX=1;BiY=1;

RpMax = Rp(RiX,RiY);
BpMax = Bp(BiX,BiY);
GpMax = Gp(GiX,GiY);

for i = RiX:RfX
  for j = RiY:RfY
    if (Rp(i,j) > RpMax)
      RpMax=Rp(i,j);
    end
    if (Gp(i,j) > GpMax)
      GpMax=Gp(i,j);
    end
    if (Bp(i,j) > BpMax)
      BpMax=Bp(i,j);
    end
   end
end

RpTH = 0.8*RpMax;
BpTH = 0.9*BpMax;
GpTH = 1*GpMax;

for i = RiX:RfX
  for j = RiY:RfY
    if (Rp(i,j) > RpTH)
      Rp(i,j)=0.8*RpTH;
    end
    if (Bp(i,j) > BpTH)
      Bp(i,j)=0.8*BpTH;
    end
    if (Gp(i,j) > GpTH)
      Gp(i,j)=0.8*GpTH;
    end
   end
end

ImMod = cat(3,Rp,Gp,Bp);


figure(4)
imshow(ImMod)

