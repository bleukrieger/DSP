clear all; close all; clc;

N = 32;
n = -pi:2*pi/N:pi;
lambda = 0.9;
wo = pi/3;
G0 = (1-lambda)*sqrt(1+lambda^2-2*lambda*cos(2*wo));
G1 = G0/sqrt(2*(1-cos(2*wo)));
a = G1.*[1 0 -1];
b = [1 -(2*lambda*cos(wo)) lambda^2];
H = freqz(a,b);

