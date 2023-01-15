clear all; close all; clc;

mo = 9.1e-31;
eV = 1.6e-19;
hbar = 1.05459e-34;
Lw = 100e-10;
kt = linspace(-1E9,1E9);

hTitle  = title ('E vs k');
hYLabel = ylabel('Energy (eV)');
hXLabel = xlabel('Lattice constant (A)');

set( gca,'FontName', 'Helvetica');
set([hTitle, hXLabel, hYLabel],'FontName', 'AvantGarde');

c=['r','g','b'];

for k=1:3
    E(k,:) =(hbar^2/(2*mo))*(kt.^2+(k*pi/Lw)^2);
    E(k,:) = E(k,:)/eV;
    plot(kt,E(k,:),c(k));
    hold on
end
    hold off


