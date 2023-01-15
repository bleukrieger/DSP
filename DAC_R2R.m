clear all; close all; clc;

[t, V] = textread("DAC_R2R.txt",1);

plot(V,t);
