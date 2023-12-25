%% Rosyiidah Dhiya'Ulhaq
%% 19/446468/TK/49573
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc;
% informasi yang diperlukan
Fs=10; %frekuensi sampling
Ts=1/Fs; %periode sampling
L=100; %panjang 
N=floor(Fs*L); 
w=2*pi; %nilai w
n=0:1:N-1;
t=0:Ts:(L-Ts); %array waktu
P=exp(1*-t).*sin(w*t);
sigma=(-10:0.1:(10-0.1));
omega=(-L/2:L/2-1)*(2*pi*0.1);

%the two-sided spectrum
Pjw=fft(P,N); 
Pdft=abs(Pjw)./N;
Pl=Pdft(1,1:N/2);
Pr=Pdft(1,(N/2)+1:N);
Pn=cat(2,Pr,Pl);

w2=fftshift(w);
w_3=unwrap(w2-2*pi);

%plotting two-sided spectrum
figure(1)
plot(t,P)
xlim([0 10])
title('The two-sided spectrum-Time Domain')
xlabel('Time(seconds)')
ylabel('Amplitude')

figure(2)
plot((2*pi*Fs/N)*n-Fs*pi,Pn)
grid on
title('Double Sided Frequency Spectrum')
xlabel('Frequency (rad/s)')
ylabel('Magnitude')
set(gca,'XTick',-10*pi:pi:10*pi)
xticks([-10*pi -2*pi 0 2*pi 10*pi])
xticklabels({'-10\pi', '-2\pi', '0', '2\pi', '10\pi'})
xlim([-10*pi 10*pi])
ylim([0 1])

%transform laplace
syms t s;
P=exp(1*-t).*sin(w*t);
Laplacetransform=laplace(P);
[symNum,symDen]=numden(Laplacetransform); % Get numerator and denomerator of symbolic TF
TFnum=sym2poly(symNum); % Convert Symbolic numerator to polynomial
TFden=sym2poly(symDen); % Convert Symbolic denominator to polynomial
TF=tf(TFnum,TFden); % Obtain the tf data

%plotting transform laplace
figure(3)
pzmap(TF)
xlim([-10 10])
ylim([-10 10])

X=zeros(100,200);
for j=1:length(omega)
    for k=1:length(sigma)
        X(j,k)=TFnum./((sigma(k)+1i*omega(j)+1)^2+(2*pi)^2);
    end
end
MX=abs(X);

%plotting (3 dimensi)
figure(4)
mesh(sigma,omega,MX)
title('Laplace-plane (3 dimensi)')
xlabel('Real axis (\sigma)')
ylabel('Imaginary axis (j\omega)')
zlabel('Magnitude')
xlim([-10 10])
ylim([-30 30])