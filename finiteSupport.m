clc; clear all; close all;

x = nan(1,81);
y = nan(1,17);
for ii=1:length(y)
	if(ii<10)
		y(ii)=ii;
	else
		y(ii)=y(ii-1)-1;
	end
end

xs = zeros(1,length(x));

for ii = 1:length(xs)
	if(mod(ii,20) == 0)
		xs(ii)=1;
	end
end
