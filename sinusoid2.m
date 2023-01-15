clear all; close all; clc;

n=0:1:63;
y=cos(pi*n/5);
yf = fft(y);
yfa = abs(yf);
ya = atan(imag(yf)./real(yf));

figure(1)
subplot(3,1,1), stem(y)
subplot(3,1,2), stem(yfa)
subplot(3,1,3), stem(ya); ylim([-3.14, 3.14])
