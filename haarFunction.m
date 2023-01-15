clear all; close all; clc;

L=4;
n=256;

m=0.5;

x = linspace(-L/2,L/2,n+1);  
t = x(1:n);

k = linspace(-pi/L*n/2,pi/L*n/2,n);

haar=zeros(n); 
for i=1:n
    if t(i)>=0 && t(i)<(1/(2*m))
        haar(i)=m;
    elseif t(i)>=(1/(2*m)) && t(i)<(1/m)
        haar(i)=-m;
    else
      haar(i)=0;
    end
end
subplot(2,1,1), plot(t,haar)
axis([-1 2 -2 2])
haart=fft(haar);
subplot(2,1,2), plot(k,abs(fftshift(haart)))

