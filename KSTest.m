% The Karplus Strong Algorithm
fs = 44100;
N = 2048;
n = 1:N;
%x = 2*rand(1,N)-1;
x = 2*sin(2*pi.*n/(N/128));
function y = KarplusStrong(x, N, alpha)
	M = length(x);
	y = zeros(1,N);
	for ii = 1:N
		if (ii<=M)
			y(ii)=x(ii);
		elseif(ii>M)
			y(ii) = alpha.*y(ii-M);
		endif
	endfor
	y = y(1:N);
endfunction

xo = KarplusStrong(x,32*N, 0.99);

subplot(2,1,1)
stem(x)
xlabel('n')
ylabel('Input')
subplot(2,1,2)
stem(xo)
xlabel('n')
ylabel('Output')

player = audioplayer(xo,fs)
play(player)

