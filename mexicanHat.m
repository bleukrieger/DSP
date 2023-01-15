% Visualizing the Time and Frequency domain shapes of the Mexican Hat WaveletT
clear all; close all; clc;

L=50;
N=1024;
T=linspace(-L/2,L/2,N+1);
t=T(1:N);

syms w x;

X = (1-x^2)*exp(-(x^2)/2); %time domain

a=0.5; b=8;
X2 = (1/sqrt(a))*(1-((x-b)/a)^2)*exp(-(((x-b)/a)^2)/2)
Y = sqrt(2*pi)*(w^2)*(exp(-(w^2)/2)); %frequency Domain
%y=subs(Y,w,t);
psi=subs(X2,x,t);

plot(t,psi,'m');
