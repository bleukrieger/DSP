clear all; close all; clc

x = [0 0 0 0 0 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0];
y = nan(1,length(x));


for ii = 1:length(x)
	if (ii == 1) 
		y(ii) = 0;
	else
		y(ii)=x(ii) - x(ii-1);
	end
end

subplot(2,1,1); stem(x)
subplot(2,1,2); stem(y)
