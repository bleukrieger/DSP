clear all; close all; clc;

T=30;
n=512;

t2 = linspace(-T/2,T/2,n+1);
t = t2(1:n);
k = (2*pi/T)*[0:n/2-1 -n/2:-1];
ks = fftshift(k);

u=sech(t);
noise = 20;
ut = fft(u);
utn = ut+noise*(randn(1,n)+i*randn(1,n));
un = ifft(utn);

filter = exp(-(k+15).^2);
utnf = filter.*utn;

unf=ifft(utnf);

%subplot(2,1,1), plot(t,u,'k', t,abs(un),'m')
%subplot(2,1,2), plot(ks, abs(fftshift(ut))/max(fftshift(ut)),'k', ks, abs(fftshift(utn))/max(fftshift(utn)),'m')
%axis([-25 25 0 1])

%break
subplot(2,1,1), plot(t,abs(unf),'g', t,0*t+0.5,'k')
axis([-15 15 0 1])
subplot(2,1,2), plot(ks, abs(fftshift(utn))/max(fftshift(utn)),'m', ks, fftshift(filter),'b', ks, abs(fftshift(utnf))/max(fftshift(utnf)),'g')
axis([-25 25 0 1])
