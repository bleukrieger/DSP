clear all; close all; clc;

t = 1:0.1:100;

x = sin(2*pi*t/50)+0.5*sin(2*pi*t/20);
xn = 0.07*normrnd(0,1,1,length(t));
xnoisy = x+xn;
subplot(2,1,1)
plot(xnoisy)
%hold on
xlabel('Time(s)');
ylabel('Signal(V)');
title('Noisy signal')

% IIR
M=3;
%lambda = (M-1)/M;
lambda=0.5;
y=[];
y(1)=[0];
for ii = 2:length(xnoisy)
       y(ii)=lambda*y(ii-1)+(1-lambda)*xnoisy(ii);
end       

%FIR
N=2;
y2=[];
for ii=N:length(xnoisy)
	y2 = [y2 xnoisy(ii)+xnoisy(ii-N+1)+xnoisy(ii-N+2)];
end
y2=y2/N;

subplot(2,1,2)
plot(y)
hold on
plot(y2)
hold off
legend('IIR','FIR')
xlabel('Time(s)');
ylabel('Signal(V)');
title('Filtered signal')
