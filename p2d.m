clear all; close all; clc;

mo = 9.1e-31;
eV = 1.6e-19;
hbar = 1.05459e-34;
Lw = 100e-10;
E = [0 1 4 9 16];

s=0;
for i=1:5
    s = s+E(1,i)
    pd(i)=mo/(pi*hbar^2*Lw).*s;
end
stairs(E,pd)
title ('\rho_2_D(E) vs E');
ylabel('\rho (E)');
xlabel('Energy (E)');


