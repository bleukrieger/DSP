clear all; close all; clc;

% Function for shifting DFT outputs
function [fx, dft] = dft_shift(a)
	N = length(a) 	% length of the signal
	if(mod(N,2)==0)	% is the length a multiple of 2?
		disp('Even');
		dft = [a((N/2):N) a(1:(N/2))]; % <--
		fx = [-1*(int16(N/2)):int16(N/2)]; % <--
	else		% if the length is not a multiple of 2
		disp('Odd');
		dft =  [a((int16(N)/2)+1:N) a(1:int16(N/2))]; 
		fx = [-1*int16(N/2)+1:int16(N/2)-1]; 
	endif
	endfunction

% Function to map the DFT values
% This function calls the dft_shift() function
% The shift flag in the argument is for the shifting operation
function [Fso, Y] = dft_map(Fs, X, shift)
	N = length(X);
	res = double(Fs)/length(X);
	if(true(shift))
		[Fso, Y] = dft_shift(X);
	else
		Y = X;
		n = 1:length(Y);
	 	Fso = n*res;
	endif
	endfunction

% First the signal
x = (0:0.02:1.0)-0.5;
stem(x)

% FFT of the signal
X= fft(x);
stem(abs(X))	% Stem plot the absolute values

% Next, the shifted version of the DFT
[Xfx Xdft] = dft_shift(X); 
stem(Xfx,abs(Xdft))

% Load a wav file and find the sample rate (Fs)
[y, fs] = audioread('piano.wav', 'SampleRate');
ty = y(1:32768);
Y = fft(ty);	% FFT of the sound signal
[Fy, Yy] = dft_map(fs,Y, 1); % produce the DFT map of the signal with shifts
plot(Fy, Yy);
