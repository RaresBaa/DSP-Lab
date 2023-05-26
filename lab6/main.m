clc;
clear;
close all;

F1 = 1000;
F2 = 3500;
Fs = 20000;
N = 64;
M1 = 2;
M2 = 4;
Nfft = 256;

f1 = F1/Fs;
f2 = F2/Fs;
n = 0:N-1;
xn = sin(2*pi*f1*n) + sin(2*pi*f2*n);
xd1 = xn(1:M1:N);
xd2 = xn(1:M2:N);

XN = fft(xn, Nfft);
XD1 = fft(xd1, Nfft);
XD2 = fft(xd2, Nfft);

k = 0: Nfft - 1;

figure(1);
subplot(3,1,1);
stem(k, fftshift(abs(XN)));
subplot(3,1,2);
stem(k, fftshift(abs(XD1)));
subplot(3,1,3);
stem(k, fftshift(abs(XD2)));

Rs = 30;
Rp = 1;
ord = 5;

[bd1, ad1] = ellip(ord, Rp, Rs, 1/M1);
[bd2, ad2] = ellip(ord, Rp, Rs, 1/M2);

xf1 = filter(bd1, ad1, xn);
xf2 = filter(bd2, ad2, xn);

xfd1 = xf1(1:M1:N);
xfd2 = xf2(1:M2:N);

XF1 = fft(xfd1, Nfft);
XF2 = fft(xfd2, Nfft);

figure(2);
subplot(3,1,1);
stem(k, fftshift(abs(XN)));
subplot(3,1,2);
stem(k, fftshift(abs(XF1)));
subplot(3,1,3);
stem(k, fftshift(abs(XF2)));

%% Exercise 2
clc;
clear;
close all;

N = 64;
n = 0:N - 1;
xn = sin(0.4 * pi * n);
L = 3;

xe = zeros(1, L*N);
xe(1:L:L*N) = xn;

figure(1);
subplot(2,1,1);
stem(0:10, xn(1:11));
subplot(2,1,2);
stem(0:L*10, xe(1:L*10+1));

Nfft = 256;

XN = fft(xn, Nfft);
XE = fft(xe, Nfft);
k = 0: Nfft-1;

figure(2);
subplot(2,1,1);
stem(k, fftshift(abs(XE)));
subplot(2,1,2);
stem(k, fftshift(abs(XN)));

ord = 30;

h = fir1(30, 1/L);
xi = filter(h, 1, xn);

XI = fft(xi, Nfft);

figure(3);
stem(k, fftshift(abs(XI)));