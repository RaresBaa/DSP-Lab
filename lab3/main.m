clc;
clear;
close all;

N = 31;
Fc = 5000;
Fs = 40000;

wn = 2*Fc/Fs;
h = fir1(N-1, wn, boxcar(N));
n = 0:N-1;
figure(1);
stem(n, h);
grid;

figure(2);
zplane(h);

H = fft(h, 512);
w = -pi:2*pi/512:pi - 2*pi/512;
figure(3);
plot(w, fftshift(abs(H)));
grid;

figure(4);
plot(w, 20*log10(fftshift(abs(H))));
grid;

%% 3.3.2 example
clc;
clear;
close all;

f = [0, 0.25, 0.25, 1];
m = [1, 1, 0, 0];

figure(1);
plot(f, m);
axis([0 1 -0.2 1.2]);

N = 31;
h = fir2(N-1, f, m, boxcar(N));
n = 0:N-1;
figure(2);
stem(n, h);
grid;

figure(3);
zplane(h);

H = fft(h, 512);
w = -pi:2*pi/512:pi-2*pi/512;
figure(4);
plot(w, fftshift(abs(H)));
grid;

figure(5);
plot(w, 20*log10(fftshift(abs(H))));
grid;

%% 3.3.3 example
clc;
clear;
close all;

Fs = 24000;
f = [6000, 8000];
m = [1, 0];
dev = [0.01, 0.1];

[n, fo, mo, w] = firpmord(f, m, dev, Fs);
h = firpm(n+2, fo, mo, w);
freqz(h);

%% 3.2 Exercise 3
clc;
clear;
close all;

N = 46; %type 2 or 4
N1 = 86;

Ft1 = 5000;
Ft2 = 15000;
Fs = 40000;
wn = [Ft1/(Fs/2) Ft2/(Fs/2)];

h = fir1(N-1, wn, boxcar(N));
h1 = fir1(N1-1, wn, boxcar(N1));
h2 = fir1(N-1, wn, hamming(N));

figure(1);
stem(h); %symmetric, type 2
figure(2);
zplane(h, 1);

[H, W] = freqz(h, 1);
[H1, W1] = freqz(h1, 1);
[H2, W2] = freqz(h2, 1);
figure(3);
plot(W, abs(H), 'b', W2, abs(H2), 'r');
grid;
legend('46', '86');

%%
clc;
clear;
close all;

N = 46;
Ft1 = 5000;
Ft2 = 15000;
Fs = 40000;
ft1 = Ft1/(Fs/2);
ft2 = Ft2/(Fs/2);
f = [0 ft1 ft1 ft2 ft2 1];
m = [0 0 1 1 0 0];
h = fir2(N-1, f, m);
figure(1);
freqz(h, 1);
