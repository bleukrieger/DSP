clear all; close all; clc;

% Discrete signal of length 16
x = zeros(1,16);
n = 0:1:15;
init = 0;
x(1)=init;
for ii = 2:length(x)
	if(ii<10) 
		x(ii)=x(ii-1)+1;
	else
		x(ii)=x(ii-1)-1;
	end
end

% Discrete fourier transform
nf = -pi:2*pi/length(x):pi;
xf = fft(x);
xaf = abs(xf);
xsf = fftshift(xaf);

%stem(n,x)
stem(xf)



