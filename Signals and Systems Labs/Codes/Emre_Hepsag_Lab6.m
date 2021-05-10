clear all; clc; close all;

%% Preliminary
% 
% %init
% 
% Fs = 50000;
% dt = 1/Fs;
% time = 0:dt:0.01;
% 
% 
% signal1 = sin(2*pi*8000*time);
% signal2 = sin(2*pi*24000*time);
% 
% x = signal1 + signal2;
% 
% %Low Pass Filter
% 
% freqs = [0 0.4 0.45 1];
% amps = [1 1 0 0];
% b = firpm(100,freqs,amps);
% y = filter(b,1,x);
% plot(time,y);

%% Filtering Labwork

%***a***

Fs = 1000;
dt = 1/Fs;
time = 0:dt:0.5-dt;
FVec = linspace(-Fs/2,Fs/2,500);

%***b***

x = sin(200*pi*time) + 2*sin(400*pi*time) + 0.5*sin(600*pi*time);
%plot(time,x);

%***c***

%LowPass Filter
freqslp = [0 0.250 0.300 1];
ampslp = [1 1 0 0];
blp = firpm(100,freqslp,ampslp);
ylp = filter(blp,1,x);
clp = conv(blp,x);
% figure
% plot(time,ylp,time,clp(51:(end-50)));


%HighPass Filter
freqshp = [0 0.500 0.550 1];
ampshp = [0 0 1 1];
bhp = firpm(100,freqshp,ampshp);
yhp = filter(bhp,1,x);
chp = conv(bhp,x);
% figure
% plot(time,yhp,time,chp(51:(end-50)));

%Bandpass Filter
freqsbp = [0 0.300 0.350 0.450 0.500 1]; 
ampsbp = [0 0 1 1 0 0];
bbp = firpm(100,freqsbp,ampsbp);
ybp = filter(bbp,1,x);
cbp = conv(bbp,x);
% figure
% plot(time,ybp,time,cbp(51:(end-50)));



%***d***

% fvtool(blp,1);
% fvtool(bhp,1);
% fvtool(bbp,1);
figure
freqz(blp,1);
title('Lowpass Filter');
figure
freqz(bhp,1);
title('Highpass Filter');
figure
freqz(bbp,1);
title('Bandpass Filter');


%***e***

figure
subplot(421);
plot(time,x);
title('x(t)');
ylabel('Amplitude');
xlabel('Time');
subplot(423);
plot(time,ylp);
title('Lowpass');
ylabel('Amplitude');
xlabel('Time');
subplot(425);
plot(time,yhp);
title('Highpass');
ylabel('Amplitude');
xlabel('Time');
subplot(427);
plot(time,ybp);
title('Bandpass');
ylabel('Amplitude');
xlabel('Time');
subplot(422);
plot(FVec,fftshift(abs(fft(x,500))./500));
title('X(f) Furier Transform of x(t)');
ylabel('Amplitude');
xlabel('Frequency');
subplot(424);
plot(FVec,fftshift(abs(fft(ylp,500))./500));
title('Lowpass in Frequency Domain');
ylabel('Amplitude');
xlabel('Frequency');
subplot(426);
plot(FVec,fftshift(abs(fft(yhp,500))./500));
title('Highpass in Frequency Domain');
ylabel('Amplitude');
xlabel('Frequency');
subplot(428);
plot(FVec,fftshift(abs(fft(ybp,500))./500));
title('Bandpass in Frequency Domain');
ylabel('Amplitude');
xlabel('Frequency');

%***f***

ilp = zeros(1,500);
ihp = zeros(1,500);
ibp = zeros(1,500);

ilp(abs(FVec)<125)=1;
ihp(abs(FVec)>275)=1;
ibp(abs(FVec)>175 & abs(FVec)<225)=1;

figure
subplot(311);
% plot(freqslp,ampslp);
plot(FVec,ilp);
title('Ideal Lowpass');
ylabel('Amplitude');
xlabel('Frequency');
subplot(312);
% plot(freqshp,ampshp);
plot(FVec,ihp);
title('Ideal Highpass');
ylabel('Amplitude');
xlabel('Frequency');
subplot(313);
% plot(freqsbp,ampsbp);
plot(FVec,ibp);
title('Ideal Bandpass');
ylabel('Amplitude');
xlabel('Frequency');

