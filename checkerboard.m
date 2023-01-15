clear all; close all; clc;

% Canonical bases generator
function e = canonical(n)
	N=5;
	M=10;
	e = zeros(N,M);
	e(mod(n,N)+1, int8(n/N)+1) = 1;
endfunction

% Haar bases in 1D
function h1D = haar1D(n, SIZE)
	if((floor(log(SIZE)/log(2))) != (log(SIZE)/log(2)))
		disp("Haar defined only for dataset of power of 2");
		h1D = 0;
		return;
	endif

	if(n>=SIZE || n<0)
		disp("Invalid Haar Index");
		h1D = 0;
		return;
	endif

	if(n==0)
		h1D = ones(1,SIZE);
		return;
	endif
	
	p= floor(log(n)/log(2));
	p2 = int64(power(2,p));
	k = SIZE/p2;
	s = (n-p2)*k;

	h = zeros(1,SIZE);
	h(int64(s)+1:int64(s+k/2)+1)=1;
	h(int64(s+k/2)+1:int64(s+k))=-1;
	h1D = h;
endfunction

% Haar bases in 2D
function h2D = haar2D(n, SIZE)
       	hr = haar1D(mod(n,SIZE),SIZE);
	hv = haar1D(floor(n/SIZE),SIZE);
 	h = hv'*hr;
	h = h./sqrt(sum(sum(h.*h)));
	h2D = h';
endfunction

% Function to ascertain the orthogonality of the Haar bases
function orthogonality
	for ii = 0:63
		for jj = 0:63
			r = sum(sum(haar2D(ii,8).*haar2D(jj,8)));
			if(abs(r)!=0)
				string1 = sprintf("%d x %d = %f",ii,jj,r);
				disp(string1)
			end
		end
	end
end


% The checkerboard image signal generator
SIZE = 4;
img = zeros(SIZE,SIZE);

for ii = 1:SIZE
	for jj = 1:SIZE
		if(xor(mod(ii,2)==0, mod(jj,2)==0))
			img(ii,jj)=255;
		endif
		endfor
		endfor

% Load the cameraman.jpg image file
cmanPre = imread('cameraman.jpg');
cman = double(cmanPre);

% Losing half of the original image file during transmission
cman1 = reshape(cman,1,[]);
txImage = reshape(cman,1,[]);
txImage(int64(length(txImage)/2):length(txImage))=0;

% Receiving the transmitted signal with half the information lost
rxImage = reshape(txImage,64,64);

% Change of Bases for signal transmission
txImage1 = zeros(1,64*64);
for ii = 1:64*64
	txImage1(ii)=sum(sum(cman.*haar2D(ii-1,64)));
end

% Receiving the transmitted image signal
rxImage1 = zeros(64,64);
for ii = 1:64*64
	rxImage1 += txImage1(ii)*haar2D(ii-1,64);
end

% Losing the second half of the encoded signal
lossyTx1 = txImage1;
lossyTx1(length(lossyTx1)/2:length(lossyTx1))=0;
rxImage2 = zeros(64,64);
for ii = 1:64*64
	rxImage2 += lossyTx1(ii)*haar2D(ii-1,64);
end

% Losing the first half of the encoded signal
lossyTx2 = txImage1;
lossyTx2(1:length(lossyTx2)/2)=0;
rxImage3 = zeros(64,64);
for ii = 1:64*64
	rxImage3 += lossyTx2(ii)*haar2D(ii-1,64);
end

