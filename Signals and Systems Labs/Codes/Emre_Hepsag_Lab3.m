clear all; clc; close all;

%% Step 1
T = 10;
dt = 0.001;
f = 0.2;
theta = 6*dt;

t1 = 0:dt:5;
t2 = (5+dt):dt:10;

X1 = -exp(-t1);
X2 = -sin(2*pi*f*t2 + theta);

X = cat(2,X1,X2);
time = cat(2,t1,t2);


%% Step 2

x_cal = zeros(1,length(time));

for i = 1:10000
    x_cal(1,i) = (X(i+1)-X(i))/dt;
end
    x_cal(1,end) = (X(10001)-X(10000))/dt;


%% Step 3

figure;
plot(time,X);
ylabel('Amlplitude');
xlabel('Time(t)');
title('Step 3');
hold on;
plot(time,x_cal);
legend('integral of the x(t)','x(t)');


    
%% Step 4

rhs = 0;

for i = 1:10000
    rhs = rhs + x_cal(1,i).^2 * dt;
end
rhs = rhs/10;

disp(rhs);

%% Step 5
ck = zeros(1,10001);

for k = 1:length(-5000:5000)
    ck(1,k) = sum(x_cal.*exp(-1i*(k-5001)*(2*pi/T)*time)*dt);
    ck(1,k) = ck(1,k)/T;
end

    
%% Step 6

lhs = 0;

for i = 1:length(-5000:5000)
    lhs = lhs + abs(ck(1,i)).^2;
end

disp(lhs);



%% Step 7


figure;
% subplot(211);
stem(lhs,'r','LineWidth',3);
% subplot(212);
hold on;
stem(rhs,'g:','LineWidth',2);
legend('Left Hand Side','Right Hand Side');


