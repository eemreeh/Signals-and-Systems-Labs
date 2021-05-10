clear all; clc; close all;


%% 1

sequence1 = randn(1,20);
sequence2 = randn(1,20);

result1 = Emre_Hepsag_conv(sequence1,sequence2);
result2 = conv(sequence1, sequence2);

figure;
plot(result1,result2);
xlabel('My Convolution');
ylabel('Matlab Convolution');

%% 2.a

time = -10:0.5:10;

h1 = or((time-1) == 0 , (time+1) == 0);
h2 = ((time>=0)-((time-4)>=0));
h3 = (time-1)==0;

figure;
subplot(311);
stem(time,h1);
ylabel('Amlplitude');
xlabel('Time');
title('h1(n)');
subplot(312);
stem(time,h2);
ylabel('Amlplitude');
xlabel('Time');
title('h2(n)');
subplot(313);
stem(time,h3);
ylabel('Amlplitude');
xlabel('Time');
title('h3(n)');

%% 2.b

X = cos(pi*time).*(time>=0).*(-(time-6)>0);

%plot(time,X);

Y1 = conv(X,h1);
%plot(Y1);
Y2 = conv(X,h2);
%plot(Y2);
Y3 = (Y1 + Y2);
%plot(Y3);
Y = conv(Y3,h3);

figure;
subplot(411);
plot(-10:0.5:30,Y1);
title('X(n)*h1(n)');
ylabel('Amlplitude');
xlabel('Time');
subplot(412);
plot(-10:0.5:30,Y2);
title('X(n)*h2(n)');
ylabel('Amlplitude');
xlabel('Time');
subplot(413);
plot(-10:0.5:30,Y3);
title('X(n)*h1(n)+X(n)*h2(n)');
ylabel('Amlplitude');
xlabel('Time');
subplot(414);
plot(-10:0.5:50,Y);
title('Y(n) = (X(n)*h1(n)+X(n)*h2(n))*h3(n)');
ylabel('Amlplitude');
xlabel('Time');


