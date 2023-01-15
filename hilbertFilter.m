clear all; close all; clc;

N=32;
n = -pi:2*pi/N:pi;
len = length(n);
hf = [];
for ii = 1:len
	if (n(ii)<0)
		hf(ii) = i;
	else
		hf(ii) = -i;
	end
end

subplot(2,1,1)
plot(n,abs(hf));
title('Hilbert Filter Magnitude');
xlabel('Frequency (rad/s)');
ylabel('Magnitude');

subplot(2,1,2)
plot(n,angle(hf));
title('Phase');
xlabel('Frequency (rad/s)');
ylabel('Phase (rad)');

