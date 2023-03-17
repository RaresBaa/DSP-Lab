%example 2.1
clc;
clear;
close all;

b=[0.3,0.6,0.6];
a=[1,-0.9];
[h, t] = impz(b, a);
size(h)
size(t)

figure(1);
impz(b, a), grid
figure(2);
stem(t, h), grid

%% example 2.2
clc;
clear;
close all;

b = [1,0.5];
a=[1,1.8*cos(pi/16),0.81];
h = impz(b, a);
impz(b, a), grid

%% example 2.3.1
clc;
clear;
close all;

b=[0.3,0.6,0.6];
a=[1,-0.9];
x = treapta(0, 40, 0) - treapta(0, 40, 10);
y = filter(b, a ,x);

n= 0:40;
subplot(3,1,1),stem(n,x),grid,title('x[n]')
subplot(3,1,2),impz(b,a),grid,title('h[n]')
subplot(3,1,3),stem(n,y),grid,title('y[n]')

%% example 2.3.2
clc;
clear;
close all;

b=[1,0.5];
a=[1,-1.8*cos(pi/16),0.81];
x=treapta(0,40,0)-treapta(0,40,10);
n = 0:40;
y=filter(b,a,x);
subplot(3,1,1),stem(n,x),grid,title('x[n]')
subplot(3,1,2),impz(b,a),grid,title('h[n]')
subplot(3,1,3),stem(n,y),grid,title('y[n]')

%% example 2.4.1
clc;
clear;
close all;

b=[0.3,0.6,0.3];
a=[1,0.9];
[H,W]=freqz(b,a);

figure(1);
subplot(2,1,1),plot(W,abs(H)),grid
subplot(2,1,2),plot(W,angle(H)),grid
figure(2);
freqz(b, a)

%% example 2.4.2
clc;
clear;
close all;

b=[0.634,0,-0.634];
a=[1,0,-0.268];
[H,W]=freqz(b,a);
freqz(b,a)

%% example 2.5.1
clc;
clear;
close all;

r=1/2*exp(j*pi/3);
q=1/3*exp(j*2*pi/3);
z=[r;conj(r);1/r;1/conj(r)];
p=[q;conj(q)];

zplane(z, p)
b = poly(z)
a = poly(p)

%% example 2.5.1
clc;
clear;
close all;

b=[1,0.5];
a=[1,-1.8*cos(pi/16),0.81];
figure(1);
zplane(b,a)

b=[1,1,0.25];figure(2)
zplane(b,a)

b=[0.3,0.6,0.6];
a=[1,0.1,0,0.1,0.1];
figure(3);
zplane(b,a)

%% example 2.6 (noted 2)
clc;
clear;
close all;

b8 = [1, 0, 0, 0, 0, 0, 0, 0, 0.8];
b4 = [1 0 0 0 0.8];
a = [1];
[h4,t] = impz(b4,a);
H4 = fft(h4,512);
[h8,t] = impz(b8,a);
H8 = fft(h8,512);
w = -pi: 2*pi/512 :pi-2*pi/512;
figure(1);
plot(w,20*log10(fftshift(abs(H4))),'o-b',w,20*log10(fftshift(abs(H8))),'.-r'),grid


%% Exercise 4
clc;
clear;
close all;

b = [0.3 0.6 0.3];
a = [1 0 0.9];

[x1, n1] = impuls(0, 40, 0);
[x2, n2] = treapta(0, 40, 0);
n3 = 0:20;
x3 = n3.*(n3>=10)+ (20-n3).*(n3>=11);
x4 = sin(n3*pi/5);

y1 = filter(b, a, x1);
y2 = filter(b, a, x2);
y3 = filter(b, a, x3);
y4 = filter(b, a, x4);

[h, t] = impz(b, a);

%a subpoint
figure(1);
subplot(3,1,1), stem(n1, x1), grid, ylabel('x1(n)')
subplot(3,1,2), stem(t, h), grid, ylabel('h(n)')
subplot(3,1,3), stem(n1, y1), grid, ylabel('y1(n)')

figure(2);
subplot(3,1,1), stem(n3, x4), grid, ylabel('x4(n)')
subplot(3,1,2), stem(t, h), grid, ylabel('h(n)')
subplot(3,1,3), stem(n3, y4), grid, ylabel('y4(n)')

%b subpoint
N = 256;
X1 = fft(x1, N);
X2 = fft(x2, N);
X3 = fft(x3, N);
X4 = fft(x4, N);

Y1 = fft(y1, N);
Y2 = fft(y2, N);
Y3 = fft(y3, N);
Y4 = fft(y4, N);

H_v1 = fft(h, N);
[H_v2, W] = freqz(b, a);
f = -0.5:1/N:0.5-1/N; %f - int.baza [-0.5; 0.5)

figure(3);
subplot(4,1,1), plot(f, fftshift(abs(X1))), ylabel('|X1|'),grid
subplot(4,1,2), plot(f, fftshift(abs(H_v1))), ylabel('|H|,fft;0..2pi'),grid
subplot(4,1,3), plot(W, abs(H_v2)), ylabel('|H|,freqz,0..pi'),grid
subplot(4,1,4), plot(f, fftshift(abs(Y1))), ylabel('|Y1|'),grid

figure(4);
subplot(4,1,1), plot(f, fftshift(abs(X4))), ylabel('|X4|'),grid
subplot(4,1,2), plot(f, fftshift(abs(H_v1))), ylabel('|H|,fft;0..2pi'),grid
subplot(4,1,3), plot(W, abs(H_v2)), ylabel('|H|,freqz,0..pi'),grid
subplot(4,1,4), plot(f, fftshift(abs(Y4))), ylabel('|Y4|'),grid

%c subpoint

figure(5);
zplane(b, a); %stability - poles inside unit circle