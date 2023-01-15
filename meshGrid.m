clear all; close all; clc
L=30; % time slot
n=512; % Fourier modes
t2=linspace(-L,L,n+1); t=t2(1:n);
k=(2*pi/(2*L))*[0:(n/2-1) -n/2:-1]; ks=fftshift(k);
noise=20;

slice=[0:0.5:10];
[T,S]=meshgrid(t,slice);
[K,S]=meshgrid(k,slice);
U=sech(T-10*sin(S)).*exp(i*0*T);
rel = 100;
ave = zeros(length(slice),length(t));
avefft = zeros(length(slice),length(t));
for j=1:length(slice)
  Ut(j,:)=fft(U(j,:)); % FFT of U
  Kp(j,:)=fftshift(K(j,:)); % Shifted FFT of K
  Utp(j,:)=fftshift(Ut(j,:)); % Shifted FFT of U
  Utn(j,:)=Ut(j,:)+noise*(randn(1,n)+i*randn(1,n)); % Utp + noise
  Utnp(j,:)=fftshift(Utn(j,:))/max(abs(Utn(j,:))); % normalized noise+Utp
  Un(j,:)=ifft(Utn(j,:)); % inverse FFT of Utn
    ave(j,:) = ave(j,:)+Un(j,:);
    avefft(j,:) = abs(fftshift(ave(j,:)));
    avefftn(j,:) = avefft(j,:)/max(avefft(j,:));
end
%figure(3)
subplot(2,1,1)
waterfall(T,S,Un), colormap([0 0 0]), view(-15,70)
set(gca,'Fontsize',[15],'Xlim',[-30 30],'Zlim',[0 2])
xlabel('time (t)'), ylabel('realizations'), zlabel('|u|')
%subplot(2,1,2)
%waterfall(Kp,S,abs(Utnp)), colormap([0 0 0]), view(-15,70)
%set(gca,'Fontsize',[15],'Xlim',[-28 28])
%xlabel('frequency (k)'), ylabel('realizations'), zlabel('|fft(u)|')
%


%rel = 100;
%ave = zeros(length(slice),length(t));
%avefft = zeros(length(slice),length(t));
%%for i=1:rel
%  for j=1:length(slice)
%    ave(j,:) = ave(j,:)+Un(j,:);
%    avefft(j,:) = abs(fftshift(ave(j,:)));
%    avefftn(j,:) = avefft(j,:)/max(avefft(j,:));
%    %aveIfft=ifft(ave(j,:));
%  end
%end
%
avefftn = avefftn/rel;
%avefft = fft(ave);
%avefft2 = abs(fftshift(avefft))/max(abs(fftshift(avefft)))

subplot(2,1,2)
waterfall(Kp,S,avefftn), colormap([0 0 0]), view(-15,70)
set(gca,'Fontsize',[15],'Xlim',[-30 30],'Zlim',[0 2])
xlabel('time (t)'), ylabel('realizations'), zlabel('|u|')


