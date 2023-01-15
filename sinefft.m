clear all; close all; clc;

T=2;
N=1024;
t1 = linspace(-T/2,T/2,N+1);
t=t1(1:N);
%k=linspace(-pi/T*N/2,pi*T*N/2,N);
k=(2*pi/(2*N))*[0:(N/2 - 1) -N/2:-1];
ks = fftshift(k);

y=sin(2*pi*t);
yt = abs(fftshift(fft(y)));
%yt = abs(fft(y));
subplot(2,1,1), plot(t,y)
subplot(2,1,2), plot(ks,yt)


