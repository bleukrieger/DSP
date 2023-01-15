clear all; close all; clc;

%N=8;
%w = -pi:2*pi/N:pi;

%H = (1/N)*(sin(w*N/2)/sin(w/2))*exp(-i*(N-1)*w/2);

%plot(w,(H))

lambda=0.9;
w = -pi:2*pi/10:pi;

H = (1-lambda)./(1-lambda*exp(-i.*w));
ph = atan(-(lambda*sin(w))./(1-lambda*cos(w)));
grd = (lambda*cos(w)-lambda^2)./(1+lambda^2-2*lambda*cos(w))

subplot(2,1,1)
plot(w,abs(H))
xlabel('Frequency (rad/s)');
ylabel('Amplitude (V)');
title('Magnitude Response')

subplot(2,1,2)
plot(w,ph)
hold on
plot(w,grd)
hold off
xlabel('Frequency (rad/s)');
ylabel('Amplitude (V)');
legend('phase','group delay');
title('Phase and Group Delay');
