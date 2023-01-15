clear all; close all; clc;

[y,fs] = wavread('morphine1.wav');
yt = abs(fftshift(fft(y)));
t1 = length(y);
ytck=y';
ytck1=ytck(1,:);

t=1:t1;
ks = (2*pi/t1).*[0:(t1/2) (-t1/2):-1];
k=fftshift(ks);

%plot(k,yt/max(yt)); 
slide =0:1000:t1;
hold on
for i=1:length(slide)
    g=exp(-(t-slide(i)).^2); % Gabor
    Sg=g.*ytck1; Sgt=fft(Sg);
    %mra = exp(-10*(t-slide(i)).^2);
subplot(3,1,1) 
plot(t,ytck1,'k',t,g,'m')
axis([0 100000 -1 1])
    hold off
    %fg=mra*y;
%    
    fgt=abs(fftshift(fft(Sg)));
    subplot(3,1,2), plot(t,Sg)
    axis([0 100000 -1 1])

    subplot(3,1,3),plot(k,fgt/max(fgt))


    drawnow
end
