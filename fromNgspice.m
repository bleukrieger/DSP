clear all; close all; clc;

[time1 ,Vin1, time2, Vout1] = textread ('plots1.txt');

figure(1)
subplot(2,1,1)
plot(time1,Vin1,'--');
hold on
plot(time2,Vout1);
hold off
title('Reading data from NgSPICE')
legend('Vin','Vout');
xlabel('Time(s)');
ylabel('Voltage Out(V)');
grid on


