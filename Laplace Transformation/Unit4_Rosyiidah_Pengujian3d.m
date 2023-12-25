%% Rosyiidah Dhiya'Ulhaq
%% 19/446468/TK/49573
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc;
% informasi yang diperlukan
Num_H=(100);
Den_H=[1 100];
Num_G=[0.001 0.11 1];
Den_G=[1 1];
H=tf(Num_H, Den_H);
G=tf(Num_G, Den_G);
L=H*G;

%Defining Input
w1=100;
T1=1/w1;
w2=1000;
T2=1/w2;
t1=(0:249)*4*T1;
t2=(0:249)*2*T2;
x1=5*sin(t1)+10*sin(55*t1)+15*sin(10^3*t1);
x2=5*sin(0.1*t2)+10*sin(55*t2)+15*sin(10^4*t2);

%Simulating Filter
y1=lsim(L, x1, t1);
y2=lsim(L, x2, t2);

%Bode Plot
figure(1)
bode(L)
grid on

%Plot tanggapan frekuensi x1
figure(2)
subplot(2, 1, 1)
plot(t1, x1)
title("Input Signal")
xlabel("Time (s)")
ylabel("Amplitude")
subplot(2,1,2)
plot(t1, y1)
title("Filtered Signal")
xlabel("Time (s)")
ylabel("Amplitude")

%Plot tanggapan frekuensi x2
figure(3)
subplot(2, 1, 1)
plot(t2, x2)
title("Input Signal")
xlabel("Time (s)")
ylabel("Amplitude")
subplot(2,1,2)
plot(t2, y2)
title("Filtered Signal")
xlabel("Time (s)")
ylabel("Amplitude")