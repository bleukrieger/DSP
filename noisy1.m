clear all; close all; clc;

t = 1:0.1:100;

x = sin(2*pi*t/50)+0.5*sin(2*pi*t/20);
xn = 0.07*normrnd(0,1,1,length(t));
xnoisy = x+xn;
subplot(2,1,1)
plot(xnoisy)
xlabel('Time(s)');
ylabel('Signal(V)');
title('Noisy signal')

N=3;
y=[];
for ii = N:length(xnoisy)
	y = [y xnoisy(ii)+xnoisy(ii-N+1)+xnoisy(ii-N+2)];
end
y = y/N;

subplot(2,1,2)
plot(y)
xlabel('Time(s)');
ylabel('Signal(V)');
title('Filtered signal')
