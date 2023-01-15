clear all; close all; clc;

L=20;
n=128;

x2 = linspace(-L/2,L/2,n+1);
x=x2(1:n);

k = (2*pi/L)*[0:n/2-1 -n/2:-1]

u= exp(-x.^2);
ut = fft(u);

u= sech(x);
ud = -sech(x).*tanh(x);
u2d = sech(x)-2*sech(x).^3;
ut = fft(u);

uds = ifft((i*k).*ut);
ud2s = ifft((i*k)^2.*ut);

ks = fftshift(k);
plot(ks,abs(fftshift(ut)),x,ud,'r',x,uds,'mo')

plot(abs(fftshift(ut)));
plot(x,u)
