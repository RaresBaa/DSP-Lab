clc;
clear;
close all;
%Example

a = [1 0.5 0 1.2 0.5];
z1 = [-2; -0.5];
z2 = roots([1 -1.2 1.8]);

b = 0.5*poly([z1; z2])
[SOS, G] = tf2sos(b, a)
[r, p, k] = residuez(b, a)

[b2, a2] = residuez(r(2:3), p(2:3), [])
[k, c] = tf2latc(b, a)

%% Exercise 2
clc;
clear;
close all;

z1 = roots([1 -2 3 -4]);
z2 = roots([1 0 0 -1]);
b = poly([z1;z2]);
a = [1 0 -0.8 0 0.66 0 0.35];

[sos, g] = tf2sos(b, a);
[r, p , k] = residuez(b, a);
[b1,a1]=residuez(r(1:2),p(1:2),[]);
[b2,a2]=residuez(r(3:4),p(3:4),[]);
[b3,a3]=residuez(r(5:6),p(5:6),[]);

[k, c] = tf2latc(b, a)

%% Exercise 4
clc;
clear;
close all;

b = [0.4 -0.7 -0.175 1];
a = [1 -0.175 -0.7 0.4];

[k, c] = tf2latc(b, a)