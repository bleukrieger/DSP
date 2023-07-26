clear all; close all; clc;

[y, fs] = audioread('Aminor.wav');
ch1 = y(:,1);
ch2 = y(:,2);

ch1fft = fftshift(abs(fft(ch1)));

ch1ds = downsample(ch1,10);
ch1dsfft = fftshift(abs(fft(ch1ds)));

%figure()
%subplot(2,1,1), plot(ch1fft);
%subplot(2,1,2), plot(ch1dsfft);

% basic digital filter LowPass
num = [1 100];
den = [100 1];
zh = tf(num,den,fs);

[y1, t1] = lsim(zh, ch1);
plot(t1,y1)
