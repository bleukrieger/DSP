clear all; close all; clc
L=30; % time slot
n=512; % Fourier modes
t2=linspace(-L,L,n+1); t=t2(1:n);
k=(2*pi/(2*L))*[0:(n/2-1) -n/2:-1]; ks=fftshift(k);
noise=10;

labels=['(a)';'(b)';'(c)';'(d)'];
realize=[1 2 5 100];
for jj=1:length(realize)
    u=sech(t); ave=zeros(1,n);
    ut=fft(u);
    for j=1:realize(jj)
        utn(j,:)=ut+noise*(randn(1,n)+i*randn(1,n));
        ave=ave+utn(j,:);
        dat(j,:)=abs(fftshift(utn(j,:)))/max(abs(utn(j,:)));
        un(j,:)=ifft(utn(j,:));
    end
    ave=abs(fftshift(ave))/realize(jj);
    subplot(4,1,jj)
    plot(ks,ave/max(ave),'k')
    set(gca,'Fontsize',[15])
    axis([-20 20 0 1])
    text(-18,0.7,labels(jj,:),'Fontsize',[15])
    ylabel('|fft(u)|','Fontsize',[15])
end
hold on
plot(ks,abs(fftshift(ut))/max(abs(ut)),'k:','Linewidth',[2])
set(gca,'Fontsize',[15])
xlabel('frequency (k)')

figure(2)
waterfall(ks,1:8,dat(1:8,:)), colormap([0 0 0]), view(-15,80)
set(gca,'Fontsize',[15],'Xlim',[-28 28],'Ylim',[1 8])
xlabel('frequency (k)'), ylabel('realization'),zlabel('|fft(u)|')
