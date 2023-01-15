clear all; close all; clc;

im1 = imread('laser2.JPG'); 
R1 = im1(:,:,1);            
R1d = double(R1);

figure(1)
%subplot(2,2,1), imshow(im1), title('Laser Image 1')
subplot(2,1,1), surfl(R1d), title('Surface Plot of Intensity')

R1dx = 1:1:size(R1d,1);
FWHMmat = zeros(1,size(R1d,2));
pause('on')
%% FWHM
for ii = 1:size(R1d,2)
    data_1d = R1d(:,ii);
    FWHMmat(ii) = fwhm(R1dx, data_1d);
    %pause(.02)
    %plot(R1dx, data_1d,'-')
end

subplot(2,1,2), plot(FWHMmat,'r')
meanFWHM = mean(FWHMmat);
hold on
line([0 size(R1d,2)],[meanFWHM meanFWHM])
hold off
xlabel('Column Index')
ylabel('FWHM')
title('FWHM and Mean FWHM')




% interpolation (not needed if using fwhm.m)
%R1dxi = 1:1/100:size(R1d,1);
%R1d1 = R1d(:,1);
%R1d1i = interp1(R1dx, R1d1, R1dxi, 'spline');
%plot(R1dxi, R1d1i, 'rx'); hold on; stem(R1dx, R1d1)

%im2 = imread('laser2.JPG');
%R2 = im2(:,:,1);           
%R2d = double(R2);         
%R2dx = 1:size(R2d,1);




