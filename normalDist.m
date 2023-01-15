% clear all variables and figures
% define the computational domain [-L/2,L/2]
% define the number of Fourier modes 2^n
clear all; close all;
L=20;
n=128;

x2=linspace(-L/2,L/2,n+1); % define the domain discretization
x=x2(1:n);
% consider only the first n points: periodicity
u=exp(-x.*x);
% function to take a derivative of
ut=fft(u);
% FFT the function
utshift=fftshift(ut); % shift FFT
figure(1), plot(x,u)
% plot initial gaussian
figure(2)
subplot(2,1,1), plot(x,ut)
subplot(2,1,2), plot(x,abs(ut))
% plot unshifted transform
figure(3)
subplot(2,1,1), plot(x,utshift) % plot shifted transform
subplot(2,1,2), plot(x,abs(utshift))
