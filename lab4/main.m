clc;
clear;
close all;

Fs = 20000;
we = 2*pi*1/20;
wb = 2*pi*3/20;
Oe = we*Fs;
Ob = wb*Fs;

[n, Wt] = buttord(Oe, Ob, 1, 20, 's');
[bs, as] = butter(n, Wt, 's');
[bd, ad] = impinvar(bs, as, Fs);

figure(1);
freqs(bs, as);
figure(2);
freqz(bd, ad);
figure(3);
impz(bd, ad);
grid;
figure(4);
zplane(1, ad);

%%
clc;
clear;
close all;

Fs = 20000;
we = 2*pi*2/20;
wb = 2*pi*3/20;
Oe = 2*Fs*tan(we/2);
Ob = 2*Fs*tan(wb/2);

[n, Wt] = buttord(Oe, Ob, 1, 20, 's');
[bs, as] = butter(n, Wt, 's');
[bd, ad] = bilinear(bs, as, Fs);

figure(1);
freqs(bs, as);
figure(2);
freqz(bd, ad);
figure(3);
impz(bd, ad);
grid;
figure(4);
zplane(1, ad);

%% Exercise 5,6,7,8
clear;
clc;
close all;

n = 3;
Ft = 4000;
Fs = 40000;
Rp = 1;
Rs = 40;

Wt = 2*pi*Ft; %impinvar only
[bs, as] = butter(n, Wt, 's');
[bd, ad] = impinvar(bs, as, Fs);

figure(1);
freqz(bd, ad);
figure(2);
zplane(1, ad);

Wt = 2*Fs*tan(pi*Ft/Fs); %bilinear
[bs, as] = butter(n, Wt, 's');
[bd1, ad1] = impinvar(bs, as, Fs);
[H1, W1] = freqz(bd1, ad1);

figure(3);
freqz(bd1, ad1);
figure(4);
zplane(1, ad);

Wt = 2*Fs*tan(pi*Ft/Fs); %bilinear
[bs, as] = cheby1(n, Rp, Wt, 's');
[bd2, ad2] = impinvar(bs, as, Fs);
[H2, W2] = freqz(bd2, ad2);

[bs, as] = cheby2(n, Rs, Wt, 's');
[bd3, ad3] = bilinear(bs, as, Fs);
[H3, W3] = freqz(bd3, ad3);

[bs, as] = ellip(n, Rp, Rs, Wt, 's');
[bd4, ad4] = bilinear(bs, as, Fs);
[H4, W4] = freqz(bd4, ad4);

figure(5);
freqz(bd, ad);
figure(6);
zplane(1, ad);

figure(7);
plot(W1, abs(H1), 'b', W2, abs(H2), 'r', W3, abs(H3), 'g', W4, abs(H4), 'k');
grid;
legend('Butter','Cheb1', 'Cheb2', 'Elip');

%% Exercise 9
clc;
clear;
close all;

Fe = [4000 6000];
Fb = [3000 7000];
Fs = 2e4;
Rp = 1;
Rs = 40;

Oe = 2*Fs*tan(pi*Fe/Fs);
Ob = 2*Fs*tan(pi*Fb/Fs);
[n, Wt] = buttord(Oe, Ob, Rp, Rs, 's');
[bs, as] = butter(ceil(n/2), Wt, 's');
[bd, ad] = bilinear(bs, as, Fs);

figure(1);
freqz(bd, ad);
figure(2);
zplane(1, ad);
