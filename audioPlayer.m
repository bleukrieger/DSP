clear all; close all; clc;

[y, fs]=audioread('Music_1.wav','SampleRate');
sampleTime = length(y);
time = zeros(1, length(y));
time(1)=0;
timeStep = 1/fs;

for ii = 1:sampleTime-1
	time(ii+1)=timeStep*ii;
end
out1 = [transpose(time), y(:,1)];
plot(out1(:,1),out1(:,2))
csvwrite('Music_1.csv',out1)
