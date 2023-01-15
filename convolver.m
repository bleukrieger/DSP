clear all; close all; clc;

t = -10:1:10;
x = [0 0 0 0 0 0 0 0 0 8 7 6 5 4 3 2 1 0 0 0 0];
zero1 = zeros(1,length(x));
yfp = [];
for ii = 1:length(t)
	yfp = [yfp x((length(x)+1)-ii)];
end


h = [0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 0 0];
y = zeros(1,length(x));

%for ii = length(t):-1:1
% 	xfp = [x(ii:length(x)) x(1:ii)]
%	stem(xfp)
%	pause(0.5)
%end

%for ii = 1:length(x)
	for jj = 1:length(h)
	y = y+h(jj).*shift(x,jj+1);
	%y = y+x(jj).*shift(h,length(h)-jj)
	%y = y+x(jj).*h;
	stem(y)
	pause(0.05)
	drawnow
	endfor
%endfor

