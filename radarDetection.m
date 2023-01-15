clear all; close all;clc;
L=30;
% time slot to transform
n=512;
% number of Fourier modes 2^9
t2=linspace(-L,L,n+1); t=t2(1:n); % time discretization
k=(2*pi/(2*L))*[0:(n/2-1) -n/2:-1]; % frequency components of FFT
u=sech(t);
% ideal signal in the time domain
%figure(1), subplot(3,1,1), plot(t,u,'k'), hold on

% adding noise to the signal
noise=1;
ut=fft(u);
nVal = noise*(randn(1,n)+i*randn(1,n));
utn=ut+noise*nVal;
un=ifft(utn);
%figure(1), subplot(3,1,2), plot(t,abs(un),'k'), hold on
%figure(1), subplot(3,1,3), plot(k,abs(ut),'k',k,abs(fftshift(nVal)),'m'), hold on

filter=exp(-0.1*(k).^2);
%std(filter)
%plot(k,filter)

unft=filter.*utn;
unf=ifft(unft);



