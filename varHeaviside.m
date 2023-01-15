clear all; close all; clc;

N=32;
n=-pi:2*pi/N:pi;
minL = 2*pi/N;
for ii = 0:minL:pi
	ii
	x = heaviside(n+ii)-heaviside(n-ii);
	subplot(2,1,1)
	stem(n,x)
	pause(0.5)
	drawnow
	
	xf = fftshift(fft(x));
	subplot(2,1,2)
	stem(n,xf)

end

