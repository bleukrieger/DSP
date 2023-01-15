clear all; close all; clc;

t= 1:0.1:100;

for ii = 1:length(t);
	y1 = normpdf(t,ii,1);
	plot(y1);
	pause(0.5);
end
