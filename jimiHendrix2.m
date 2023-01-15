clear all; close all; clc;

A=imread('JimiHendrix','jpg');
Abw = rgb2gray(A);

Abw = double(Abw);

Abw2 = Abw(350:-1:1,:);
Abwn = Abw2+100*randn(350,300);

figure(1)
pcolor(Abwn), colormap(hot), shading interp

figure(2)
Abwt=fft2(Abwn);
pcolor(log(abs(fftshift(Abwt)))), shading interp, colormap(hot)

