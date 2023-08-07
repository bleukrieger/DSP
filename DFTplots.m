clear all; close all; clc;

%%
%% Function for shifting DFT outputs
%%
function [fx, dft] = dft_shift(a)
	N = length(a); 	% length of the signal
	if(mod(N,2)==0)	% is the length a multiple of 2?
		disp(["Even - " "Length: " num2str(N)]);
		dft = [a((N/2)+1:N); a(1:(N/2)+1)]; % the dft
		disp(["DFT: " num2str(length(dft))])
		fx = [-1*(int16(N/2)):int16(N/2)]; % the frequencies
		disp(["FX: " num2str(length(fx))])
	else		% if the length is not a multiple of 2
		disp(["Odd - " "Length: " num2str(N)]);
		dft =  [a((int16(N)/2)+1:N) a(1:int16(N/2))]; % the dft
		disp(["DFT: " num2str(length(dft))])
		fx = [-1*int16(N/2)+1:int16(N/2)-1]; % the frequencies
		disp(["FX: " num2str(length(fx))])
	endif
	endfunction

%%
%% Function to map the DFT values
%% This function calls the dft_shift() function
%% The shift flag in the argument is for the shifting operation
%%
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

% The signal
x = (0:0.02:1.0)-0.5;
%figure(1)
%subplot(2,1,1)
stem(x)

% FFT of the signal
X= fft(x);
%subplot(2,1,2)
stem(abs(X))	% Stem plot the absolute values

% Next, the shifted version of the DFT
[Xfx Xdft] = dft_shift(X);
%figure(2)
%subplot(2,1,1)
stem(Xfx,abs(Xdft))

% Load a wav file and find the sample rate (Fs)
[y, fs] = audioread('piano.wav', 'SampleRate');
ty = y(1:32768);
Y = fft(ty);	% FFT of the sound signal
[Fy, Yy] = dft_map(fs,Y, 1); % produce the DFT map of the signal with shifts
%subplot(2,1,2)
plot(Fy, abs(Yy));


Y = fft(ty);	% FFT of the sound signal
[Fy, Yy] = dft_map(fs,Y, 0); % produce the DFT map of the signal with shifts
%figure(3)
%subplot(2,1,1)
plot(Fy(1:2000), abs(Yy(1:2000)));

dft_res = fs/length(Yy); % calculate the dft resolution
disp(['DFT Resolution:' num2str(dft_res)]);

max_range = int32(300/dft_res);




