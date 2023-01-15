clear all; close all; clc;

function fm = fmin(f1, f2, f3)
	fm = 0;
	if (f1<f2 && f1<f3)
		fm = f1;
	endif

	if(f2<f1 && f2<f3)
		fm = f2;
	endif

	if(f3<f1 && f3<f2)
		fm = f3;
	endif
endfunction

A = 1*rand(1);
a1 = 1*rand(1);
a2 = 1*rand(1);
a3 = 1*rand(1);
f1 = 20+20E3*rand(1);
f2 = 20+20E3*rand(1);
f3 = 20+20E3*rand(1);
t1 = 2*pi*rand(1);
t2 = 2*pi*rand(1);
t3 = 2*pi*rand(1);


fm = fmin(f1,f2,f3);
tm = 1/(2*fm);
N = 2;
t = 0:0.01:N;
y = zeros(1,N);
tim_x = zeros(1,N);
NN = size(t,2);
for i = 1:NN
	y(i) = A + a1*sin(2*pi*f1*t(i)+t1)+a2*sin(2*pi*f2*t(i)+t2)+a3*sin(2*pi*f3*t(i)+t3);
	tim_x(i)=i;
end
%plot(y)
out1 = transpose(y);
save data1.csv out1


