clear all; close all; clc;

A=imread('JimiHendrix','jpg'); Abw=rgb2gray(A);
Abw=double(Abw);
B=Abw+100*randn(350,300);
Bt=fft2(B); Bts=fftshift(Bt);
subplot(2,2,1), imshow(uint8(B)), colormap(gray)
subplot(2,2,2), pcolor((log(abs(Bts)))); shading interp
colormap(gray), set(gca,'Xtick',[],'Ytick',[])

kx=1:300; ky=1:350; [Kx,Ky]=meshgrid(kx,ky);
F=exp(-0.0001*(Kx-176).^2-0.0001*(Ky-151).^2);
Btsf=Bts.*F;

subplot(2,2,3), pcolor(log(abs(Btsf))); shading interp
colormap(gray), set(gca,'Xtick',[],'Ytick',[])
Btf=ifftshift(Btsf); Bf=ifft2(Btf);
subplot(2,2,4), imshow(uint8(Bf)), colormap(gray)

% Gaussian filter
fs=[0.01 0.001 0.0001 0];
for j=1:4
  F=exp(-fs(j)*(Kx-176).^2-fs(j)*(Ky-151.^2));
  Btsf=Bts.*F; Btf=ifftshift(Btsf); Bf=ifft2(Btf);
  figure(4), subplot(2,2,j), pcolor(log(abs(Btsf)))
  shading interp,colormap(gray),set(gca,'Xtick',[],'Ytick',[])
  figure(5), subplot(2,2,j), imshow(uint8(Bf)), colormap(gray)
end

width=50;
Fs=zeros(350,300);
Fs(176-width:1:176+width,151-width:1:151+width) ...
=ones(1:2*width+1,1:2*width+1);
Btsf=Bts.*Fs;

Btf=ifftshift(Btsf); Bf=ifft2(Btf);
subplot(2,2,3), pcolor(log(abs(Btsf))); shading interp
colormap(gray), set(gca,'Xtick',[],'Ytick',[])
subplot(2,2,4), imshow(uint8(Bf)), colormap(gray)

fs=[10 50 100 200];
for j=1:4
  Fs=zeros(350,300);
  Fs(176-fs(j):1:176+fs(j),151-fs(j):1:151+fs(j)) =ones(1:2*fs(j)+1,1:2*fs(j)+1);
  Btsf=Bts.*Fs; Btf=ifftshift(Btsf); Bf=ifft2(Btf);
  figure(7), subplot(2,2,j), imshow(uint8(Bf)), colormap(gray)
end
