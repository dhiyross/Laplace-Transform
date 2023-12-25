%% Rosyiidah Dhiya'Ulhaq
%% 19/446468/TK/49573
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc;
%informasi yang diperlukan
omega=2*pi; %nilai omega
Fs=10; %nilai frekuensi sampling
Ts=1/Fs; %periode sampling
L=100; %panjang

axisdouble=((-L)/2:L/2)*(Fs/L);
t=0:0.1:10; %array waktu
x=sin(omega*t); %isyarat x(t)
X=fft(x); %FFT isyarat x(t)
Xmag=2*(abs(X)./L); %magnitude isyarat x(t)
Xdouble=fftshift(Xmag);

%plotting isyarat x(t)
figure(1);
subplot(2,1,1);
plot(t,x);
title('Isyarat Informasi x(t)-Time Domain');
xlabel('Time(s)');
ylabel('Amplitude(Watt)');
subplot(2,1,2);
plot(axisdouble, Xdouble);
title('Isyarat Informasi x(t)-Frequency Domain');
xlabel('Frequency (rad/s)')
ylabel('Magnitude')
xticks([-5 -1 0*pi 1 5])
xticklabels({'-10\pi', '-2\pi', '0', '2\pi', '10\pi'})
xlim([-5 5])

%laplace transform
syms t;
x=sin(omega*t);
laplaceTransform=laplace(x);
[symNum,symDen]=numden(laplaceTransform);

%konversi numerator dan denominator
TFNum=sym2poly(symNum);
TFDen=sym2poly(symDen);
TF=tf(TFNum,TFDen); %fungsi alih

%plotting pole zero
figure(2)
pzmap(TF)