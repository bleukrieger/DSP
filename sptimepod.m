clear all; close all; clc;

x=linspace(-10,10,100);
t=linspace(0,10,30);
[X,T]=meshgrid(x,t);
f=sech(X).*(1-0.5*cos(2*T))+(sech(X).*tanh(X)).*(1-0.5*sin(2*T));
subplot(2,2,1), waterfall(X,T,f), colormap([0 0 0])

[u,s,v]=svd(f');
for j=1:3
  ff=u(:,1:j)*s(1:j,1:j)*v(:,1:j)';
  subplot(2,2,j+1)
  waterfall(X,T,ff'), colormap([0 0 0]), set(gca,'Zlim',[-1 2])
  end
  subplot(2,2,1), text(-19,5,-1,'(a)','Fontsize',[14])
  subplot(2,2,2), text(-19,5,-1,'(b)','Fontsize',[14])
  subplot(2,2,3), text(-19,5,-1,'(c)','Fontsize',[14])
  subplot(2,2,4), text(-19,5,-1,'(d)','Fontsize',[14])

  figure(2)
  sig=diag(s);
  subplot(3,2,1), plot(sig,'ko','Linewidth',[1.5])
  axis([0 25 0 50])
  set(gca,'Fontsize',[13],'Xtick',[0 5 10 15 20 25])
  text(20,40,'(a)','Fontsize',[13])
  subplot(3,2,2), semilogy(sig,'ko','Linewidth',[1.5])
  axis([0 25 10^(-18) 10^(5)])
  set(gca,'Fontsize',[13],'Ytick',[10^(-15) 10^(-10) 10^(-5) 10^0 10^5],...
  'Xtick',[0 5 10 15 20 25]);
  text(20,10^0,'(b)','Fontsize',[13])
  energy1=sig(1)/sum(sig)
  energy2=sum(sig(1:2))/sum(sig)

  subplot(3,1,2) % spatial modes
  plot(x,u(:,1),'k',x,u(:,2),'k--','Linewidth',[2])
  set(gca,'Fontsize',[13])
  legend('mode 1','mode 2','Location','NorthWest')
  text(8,0.35,'(c)','Fontsize',[13])
  subplot(3,1,3) % time behavior
  plot(t,v(:,1),'k',t,v(:,2),'k--','Linewidth',[2])
  text(9,0.35,'(d)','Fontsize',[13])
