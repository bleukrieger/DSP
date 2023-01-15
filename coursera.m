clear all; close all; clc;

T=30;
n=512;

t2 = linspace(-T/2,T/2,n+1);
t=t2(1:n);

k=(2*pi*T)*[0:n/2-1 -n/2:-1];
ks = fftshift(k);

slice=[0:0.5:10];
[T,S] = meshgrid(t,slice);
[K,S] = meshgrid(k,slice);

U = sech(T-10*sin(S)).*exp(i*10*T);
subplot(2,1,1)
waterfall(T,S,abs(U)), colormap([0 0 0]), view(-15,70)
noise = 220;
for j=1:length(slice)
    UT(j,:)=((fft(U(j,:))+noise*(randn(1,n)+i*randn(1,n))));
    UN(j,:)=ifft(UT(j,:));
end
%subplot(2,1,2)
%waterfall(fftshift(K),S,abs(fftshift(UT))), view(-15,70)
%subplot(2,1,1)
%waterfall(T,S,abs(UN)),view(-15,70)
   

%ut=fft(u);
%
%noise = 20;
%
%%subplot(2,1,1), plot(t,u,'r', t,abs(un),'k');
%%subplot(2,1,2), plot(ks, abs(fftshift(ut))/max(fftshift(ut)),'r', ks, abs(fftshift(utn))/max(fftshift(utn)),'b')
%

[T,FS]=meshgrid(0,slice);
%FT=zeros(T)

rel = 100;
for j=1:rel
    %UTNL(j,:)=ut+noise*(randn(1,n)+i*randn(1,n));
    %UTNI(j,:)=ifft(utn);
    FS(j,:)=FS(j,:)+UT();
end

