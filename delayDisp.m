% Refer to delayDisp.png file
close all; clear all; clc;

n = 1:32;
x = sin(2*pi*n/16);

a = 2;
b = 3;
c = 4;

y = (a*b)*x + b*circshift(x,-1) - c*circshift(x,-3) - circshift(x,-4);

figure(1)
subplot(2,1,1)
stem(n,x);
hold on
stem(n,y);
hold off
xlabel('n');
ylabel('Amplitude');
title('Signal In/Out for the system shown in delayDisp.png');
legend('Input','Output');
