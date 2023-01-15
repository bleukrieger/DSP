clear all; close all; clc

% Original Signal to be transmitted
[y fs]=audioread('gettysburg.wav');
%stem(y);
y = transpose(y);

% Simulate quantization of the original signal
norm = 1.0/(max(abs([min(y) max(y)])));
ya = y*100*norm;
%stem(sy)

yd = round(ya);
% Quantization Noise
stem(ya-yd);

% Calculate the Signal to Noise Ratio
function snrVal = SNRatio(noisy, original)
	errVec = noisy-original;
	err = vectorNorm(errVec);
	sig = vectorNorm(original);
	%snrVal = 1;
	snrVal = 10*log10(sig./err);
endfunction

snrVal = SNRatio(yd,ya)

% Simulate the signal passing through a repeater
function x = repeater(x,noise_amplitude,attenuation)
	%noise1 = noise_amplitude*max(abs([max(x) min(x)]))*randn(1,length(x));
	noise1 = noise_amplitude*unifrnd(-1,1,1,length(x));
	x = x.*attenuation;
	x = x+noise1;
	x = x./attenuation;
endfunction

% Simulate the analog signal passing through the entire transmission line
function x = analogTx(x, noRepeaters, noiseAmplitude, attenuation)
	for ii = 1:noRepeaters
		x = repeater(x,noiseAmplitude,attenuation);
	endfor
endfunction

% Simulate the quantized signal passing through the entire transmission line
function x = digitalTx(x, noRepeaters, noiseAmplitude, attenuation)
	for ii = 1:noRepeaters
		x = round(repeater(x,noiseAmplitude,attenuation));
	endfor
endfunction

noOfRepeaters = 70;
noiseAmplitude = 0.01;
attenuation = 0.5;

yAnalog = analogTx(ya,noOfRepeaters,noiseAmplitude,attenuation);
yDigital = digitalTx(yd,noOfRepeaters,noiseAmplitude,attenuation);

snrAnalog = SNRatio(yAnalog,ya)
snrDigital = SNRatio(yDigital,ya)
