clear all; clc; close all;

%% Step 1 

load('matrix_Double.mat');

% NewMat = matrix_Double(:)';

NewMat = reshape(matrix_Double,1,[]);

%% Step 2
dt = 1;
T = length(NewMat);
time = 1:dt:T;
w = 2*pi/T;

ck = zeros(1,4001);

for k = 1:length(-2000:2000)
    ck(1,k) = sum(NewMat.*exp(-1i*(k-2001)*(w)*time)*dt);
    ck(1,k) = ck(1,k)/T;
end



%% step 3

k100 = -100:1:100;
k500 = -500:1:500;
k1000 = -1000:1:1000;
k2000 = -2000:1:2000;

X100 = zeros(1,length(k100));
X500 = zeros(1,length(k500));
X1000 = zeros(1,length(k1000));
X2000 = zeros(1,length(k2000));


for t = 1:length(time)
        X100(t) = sum(real(ck(1,2001+k100).*exp(1i*(k100)*w*t)));
        X500(t) = sum(real(ck(1,2001+k500).*exp(1i*(k500)*w*t)));
        X1000(t) = sum(real(ck(1,2001+k1000).*exp(1i*(k1000)*w*t)));
        X2000(t) = sum(real(ck(1,2001+k2000).*exp(1i*(k2000)*w*t)));
end



%% step 4


MSE100 = sum((X100-NewMat).^2)/T;
MSE500 = sum((X500-NewMat).^2)/T;
MSE1000 = sum((X1000-NewMat).^2)/T;
MSE2000 = sum((X2000-NewMat).^2)/T;

figure
plot([100 500 1000 2000],[MSE100 MSE500 MSE1000 MSE2000],'b','MarkerSize',10,'LineWidth',1.35);
xlabel('M Values');
ylabel('Error');
title('Mean Square Error');
axis([200 2000 0 inf]);
legend('MSE/M');

%% step 5



[row, column]=size(matrix_Double);
figure
image_original=uint8(real((reshape(NewMat,[row column])))); %vector to matrix to image
imshow(image_original)

figure
image_approximated=uint8(real((reshape(X100,[row column])))); %vector to matrix to image
imshow(image_approximated)

figure
image_approximated=uint8(real((reshape(X500,[row column])))); %vector to matrix to image
imshow(image_approximated)

figure
image_approximated=uint8(real((reshape(X1000,[row column])))); %vector to matrix to image
imshow(image_approximated)

figure
image_approximated=uint8(real((reshape(X2000,[row column])))); %vector to matrix to image
imshow(image_approximated)