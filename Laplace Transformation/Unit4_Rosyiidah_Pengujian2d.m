%% Rosyiidah Dhiya'Ulhaq
%% 19/446468/TK/49573
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc;
% informasi yang diperlukan
Fs = 10; % frekuensi sampling
Ts = 1/Fs; % periode sampling
L = 100; % panjnag 
w = 2*pi;
N = floor(Fs*L); 
n = 0:1:N-1;
t = 0:Ts:(L-Ts); 
P = exp(1*-t).*sin(w*t);
omega = (-L/2:L/2-1)*(2*pi*0.1);

%transform laplace
syms t;
x = sin(w*t);
Laplace_transform = laplace(x);
[symNum,symDen] = numden(Laplace_transform); % Mendapatkan numerator dan denomator simbolis TF
TFnum = sym2poly(symNum); % Konversi numerator simbolis ke polinomial
TFden = sym2poly(symDen); % Konversi denominator simbolis ke polinomial 
TF = tf(TFnum,TFden); % Mendapatkan data TF

X = zeros(100,1);
sigma = 0;
for j = 1:length(omega)
        X(j) = TFnum./((sigma+1i*omega(j))^2+(2*pi)^2);
end
MX_s = abs(X);

%plotting
figure(1)
plot(omega,MX_s)
title('Slice Laplace-plane')
xlabel('Imaginary Axis (j\omega)')
ylabel('Magnitude')