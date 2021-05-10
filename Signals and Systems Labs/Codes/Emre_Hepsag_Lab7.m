clear all; clc; close all;

load('LabSample.mat');
x = x';

Fn = Fs/2;
N = 2^nextpow2(length(x));
FVec = linspace(-Fs/2,Fs/2,N);

%------a------
Ts = 1/Fs;
Timex = length(x)*Ts;

%------b------
t = 0:Ts:Timex-Ts;

%------c------
T = 1;
D2 = 2*T;
D4 = 4*T;
D8 = 8*T;

%------d------
it2 = zeros(1,length(x));
it2(1:D2:end) = 1;
it4 = zeros(1,length(x));
it4(1:D4:end) = 1;
it8 = zeros(1,length(x));
it8(1:D8:end) = 1;

%------e------
ds2 = x.*it2;
ds4 = x.*it4;
ds8 = x.*it8;
% 
% figure
% subplot(221);
% plot(t,x);
% title('x time domain');
% subplot(222);
% plot(t,ds2);
% title('down sampled 2');
% subplot(223);
% plot(t,ds4);
% title('down sampled 4');
% subplot(224);
% plot(t,ds8);
% title('down sampled 8');


%------f------

figure
subplot(221);
plot(FVec,fftshift(abs(fft(x,N))./N));
title('X(f) Fourier Treansform of x(t)');
ylabel('Amplitude');
xlabel('Frequency');
subplot(222);
plot(FVec,fftshift(abs(fft(ds2,N))./N));
title('Fourier Treansform of x down sampled by 2Ts');
ylabel('Amplitude');
xlabel('Frequency');
subplot(223);
plot(FVec,fftshift(abs(fft(ds4,N))./N));
title('Fourier Treansform of x down sampled by 4Ts');
ylabel('Amplitude');
xlabel('Frequency');
subplot(224);
plot(FVec,fftshift(abs(fft(ds8,N))./N));
title('Fourier Treansform of x down sampled by 8Ts');
ylabel('Amplitude');
xlabel('Frequency');

%------g------

freqs2 = [0 10750/Fn 11000/Fn 1];
% freqs2 = [0 0.475 0.5 1];
amps2 = [2 2 0 0];
b2 = firpm(200,freqs2,amps2);

freqs4 = [0 5250/Fn 5500/Fn 1];
% freqs4 = [0 0.225 0.25 1];
amps4 = [4 4 0 0];
b4 = firpm(200,freqs4,amps4);

freqs8 = [0 2500/Fn 2750/Fn 1];
% freqs8 = [0 0.1 0.125 1];
amps8 = [8 8 0 0];
b8 = firpm(200,freqs8,amps8);


%------h------

c2 = conv(ds2,b2);
c4 = conv(ds4,b4);
c8 = conv(ds8,b8);

%------i------

c2 = c2(101:(end-100));
c4 = c4(101:(end-100));
c8 = c8(101:(end-100));

% figure
% subplot(221);
% plot(t,x);
% title('x');
% subplot(222);
% plot(t,c2);
% title('interpolation 2');
% subplot(223);
% plot(t,c4);
% title('down sampled 4');
% subplot(224);
% plot(t,c8);
% title('down sampled 8');

%------j------

MSE2 = sum((x-c2).^2)/length(x);
MSE4 = sum((x-c4).^2)/length(x);
MSE8 = sum((x-c8).^2)/length(x);


%------k------

% sound(x,Fs);
% sound(c2,Fs);
% sound(c4,Fs);
% sound(c8,Fs);

%------l------

%D2 is the best because It has the least Mean Squared Error, which means
%that with D2, we can create more original like signal.Because when we
%downsaple the signal, we lost least data in D2.





