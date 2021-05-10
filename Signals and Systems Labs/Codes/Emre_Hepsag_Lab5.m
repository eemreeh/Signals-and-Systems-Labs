clear all; clc; close all;

%% 5.1

%*
N = 1024;
Fs = 1000;
dt = 1/Fs;
fc = 50;
time = 0:dt:0.5;

t1 = 0:dt:0.1;

x1 = zeros(1,length(time));
x1(1,1:length(t1)) = cos(2*pi*fc*t1);

figure
plot(time,x1);
ylabel('Amplitude');
xlabel('Time');
title('x1(t)');

%*

FVec = linspace(-Fs/2,Fs/2,N);


for f = 1:1024
    X1(f) = sum(x1(1:length(time)).*exp(-1i*2*pi*FVec(f)*time)*dt);    
end

%*


X1fft = abs(fft(x1,N))./N;


%*

figure
subplot(211);
plot(FVec,abs(X1));
ylabel('Amplitude');
xlabel('Time');
title('calculated by formula X1(f)');
subplot(212);
plot(FVec,fftshift(X1fft));
ylabel('Amplitude');
xlabel('Time');
title('calculated by fft X1(f)');



%% 5.2


%x2(t) = u(x) + u(t-0.1) - 2u(t-0.2)
%y(t) = u(t) + u(t-0.1) - 2u(t-0.2) + 2u(t-0.3) + 2u(t-0.4)

x2 = (time>=0) + (time>=0.1) - 2*(time>=0.2);
y = (time>=0) + (time>=0.1) - 2*(time>=0.2) + 2*(time>=0.3) + 2*(time>=0.4);
y(end) = 0;
 
n=length(time);

X2 = fft(x2,n);
Y = fft(y,n);

H = Y./X2;
h = ifft(H,n);

figure
subplot(311);
plot(time,x2);
title('input x2(t)');
ylabel('Amplitude');
xlabel('Time');
subplot(312);
plot(time,h)
title('impulse response h(t)');
ylabel('Amplitude');
xlabel('Time');
subplot(313);
plot(time,y);
title('output y(t)');
ylabel('Amplitude');
xlabel('Time');


% plot(conv(x2,h));

