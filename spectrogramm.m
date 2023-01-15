clear all; close all; clc;

[y, fs]=audioread('Amajor.wav', 'SampleRate');
t = 1:length(y(:,1));

subplot(2,1,1)
plot(t,y(:,1))
xlabel('Time');
ylabel('Amplitude');
yy2fs = [];
for ii = 1:10000:length(t)
	y1 = normpdf(t,ii,20000);
	%ii
	subplot(2,1,2)
	pause(0.5);
	drawnow;
	yy2=transpose(y(:,1)).*y1/max(y1);
	plot(t,y1/max(y1));
	hold on
	plot(t,yy2);
	hold off
	yy2f = abs(fftshift(fft(yy2)));
	%plot(t,yy2f)
	yy2fs = [yy2fs; yy2f];
end

	
