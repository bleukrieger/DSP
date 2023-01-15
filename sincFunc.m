clear all; close all; clc;

N=32;
n=-pi:2*pi/N:pi;

for ii = -pi:2*pi/N:pi
	x = sinc(n*2-ii);
	xf = fftshift(fft(x));
	subplot(2,1,1)
	stem(n,x);
	title('Sinc Function');
	xlabel('n');
	ylabel('x');
	subplot(2,1,2)
	stem(n,abs(xf))
	title('i/DF Transform');
	xlabel('n');
	ylabel('x');
	pause(0.5)
	drawnow;
end
