clear;
clc;
close all;

[x1, n] = impuls(-10, 10, 0);
figure(1), stem(n, x1), grid
%%
clear;
clc;
close all;

[x2, n] = impuls(-10, 10, 3);
figure(1), stem(n,0.5*x2),grid
%%
clear;
clc;
close all;

[y1,n]=treapta(-5,10,0);
stem(n,y1),grid

%%
clear;
clc;
close all;

[y21,n]=treapta(-5,10,-3);
[y22,n]=treapta(-5,10,3);
y2=0.7*(y21-y22);
stem(n,y2),grid
%% ex1.4
clear;
clc;
close all;

[x11, n] = impuls(-10,20, 1);
[x12, n] = treapta(-10,20, 5);
[x13, n] = impuls(-10,20, -2);
[x14, n] = impuls(-10,20, 9);

x4 = x11 + x12 + x13 - 2*x14;
figure(1), stem(n, x4), grid
%% ex1.6
clear;
clc;
close all;

n = -20:1:20;
x2 = log(abs(cos(n*pi/15) - sin(n*pi/15)));
figure(1), plot(n, x2, '-*'), grid
%% ex1.7
clear;
clc; 
close all;

n = 0:1:10;
x1 = (-1).^n.* cos(n*pi/15);
figure(1), stem(n, x1), grid
%%
clear;
clc; 
close all;

F0 = 300; Fs = 4000;
Tmax = 10^(-2); % signal duration of 10 ms
N = Tmax*Fs; % number of samples N=10ms*4kHz
w0 = 2*pi*F0/Fs; % normalized angular frequency
n = 0:N-1;
x = 2*sin(w0*n);
figure(1), stem(n,x), grid

%%
clear;
clc; 
close all;

F0 = 300; Fs = 4000;
Tmax = 10^(-2); % signal duration 10 ms
Ts = 1/Fs;
t = 0:Ts:Tmax-Ts;
xa = 2*sin(2*pi*F0*t);
figure(2), plot(t,xa,'-o'), xlabel('t[ms]'), grid
%%
clear;
clc; 
close all;

x1=treapta(0,10,0)-treapta(0,10,5);
n=0:20;
x2=0.9.^n;
x=conv(x1,x2);
subplot(2,2,1),stem(0:10,x1),title('x1'),grid
subplot(2,2,2),stem(n,x2),title('x2'),grid
subplot(2,1,2),stem(0:length(x)-1,x),title('x'),grid
%%
clear;
clc; 
close all;

x1=treapta(0,20,0)-treapta(0,20,10);
X=fft(x1);
figure(1),plot(X)
figure(2),plot(abs(X))
X1=fft(x1,512);
figure(3),plot(abs(X1)),grid
w=-pi:2*pi/512:pi-2*pi/512;
figure(4),plot(w,fftshift(abs(X1))),grid
figure(5),plot(w,fftshift(angle(X1))),grid
figure(6)
subplot(2,1,1),plot(w,fftshift(real(X1))),grid
subplot(2,1,2),plot(w,fftshift(imag(X1))),grid
%%
clear;
clc; 
close all;

Fs = 8000; F0 = 500; t_max = 0.04;
t = 0:1/Fs:t_max-1/Fs;
s = sin(2*pi*F0*t);
No_samples = length(s); % or: No_samples = t_max*Fs

N_fft = 256;
S = fft(s,N_fft);
k = 0:N_fft-1;
figure(1),plot(k,abs(S))

w = -pi: 2*pi/N_fft :pi-2*pi/N_fft;
figure(2),plot(w,fftshift(abs(S))),grid

f = -0.5: 1/N_fft :0.5-1/N_fft; % sau: f = w/(2*pi)
figure(3),plot(f,fftshift(abs(S))),grid

F = -Fs/2: Fs/N_fft :Fs/2-Fs/N_fft; %sau:F=w/(2*pi)*Fs
figure(4),plot(F,fftshift(abs(S))),grid

figure(5),subplot(211),plot(f,fftshift(abs(S))),grid
subplot(212),plot(f,fftshift(angle(S))),grid

figure(6),subplot(211),plot(f,fftshift(real(S))),grid
subplot(212),plot(f,fftshift(imag(S))),grid
%% E3
clear;
clc; 
close all;

Fs = 8000; F0 = 500; t_max = 0.04;
t = 0:1/Fs:t_max-1/Fs;
s = sin(2*pi*F0*t);
N_fft = 1024;
S = fft(s,N_fft);
k = 0:N_fft-1;
w = -pi: 2*pi/N_fft :pi-2*pi/N_fft; % [-pi, pi)

figure(1), stem(w/(2*pi)*Fs, fftshift(abs(S))), grid