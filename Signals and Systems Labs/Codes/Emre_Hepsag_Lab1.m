clear all; clc; close all;

%% Part 1 - 1 
t1 = linspace(0,1,1000);
X1 = sin(6*pi*t1)-2  ;

t2 = linspace(1,2,1000);
X2a = zeros(1,100);
X2a(1) = 1;
X2 = repmat(X2a,1,10);

t3 = linspace(2,3,1000);
X3 = cos(10*pi*t1)+2 ;

t = cat(2,t1,t2,t3);
X = cat(2,X1,X2,X3);

figure;
subplot(211);
plot(t,X,'b-','LineWidth',2);
xlabel('Time (sec.)'); 
ylabel('Amplitude'); 
title('First Figure');
grid on;


subplot(212);
plot(-t,X,'g-','LineWidth',2);
xlabel('Time (sec.)'); 
ylabel('Amplitude'); 
title('Second Figure');
grid on;

%% 3
% teo = cat(2,-fliplr(t),t);
% Xeo = cat(2,fliplr(X),X);
% 
% XEv = [Xeo+fliplr(Xeo)]/2;
% XOd = [Xeo-fliplr(Xeo)]/2;

XEv = (X+fliplr(X))/2;
XOd = (X-fliplr(X))/2;
teo = t;

figure;
subplot(211);
plot(teo,XEv,'b-','LineWidth',2);
xlabel('Time (sec.)'); 
ylabel('Amplitude'); 
title('Even');
grid on;


subplot(212);
plot(teo,XOd,'g-','LineWidth',2);
xlabel('Time (sec.)'); 
ylabel('Amplitude'); 
title('Odd');
grid on;


%% Part 2 - 1

t = linspace(0,1,250);

X1 = sin(2*pi*5*t);  
X2 = cos(2*pi*7*t);

X3 = X1 + X2;

h = [1 0 1 0 1];

Y1 = 0;
Y2 = 0;
Y3 = 0;

for i=5:-1:1
    Y1 = Y1 + h(i)*sin(2*pi*5*(t - (5-i)));
    Y2 = Y2 + h(i)*cos(2*pi*7*(t - (5-i)));
    Y3 = Y3 + h(i)*(cos(2*pi*7*(t - (5-i)))+sin(2*pi*5*(t - (5-i))));
end

figure;
plot(Y1+Y2,Y3);
title('PART-2');
xlabel('Y1+Y2'); 
ylabel('Y3'); 
