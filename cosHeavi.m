clear all; close all; clc;

N= 32;
n=-pi:2*pi/N:pi;
wo = 16*pi/N;
x = cos(wo*n).*heaviside(n,1);

subplot(2,1,1)
stem(n,x)

zero1 = [1 -cos(wo)];
pole1=[1 -2 1];
subplot(2,1,2)
zplane(zero1,pole1)
