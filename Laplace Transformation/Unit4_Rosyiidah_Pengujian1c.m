%% Rosyiidah Dhiya'Ulhaq
%% 19/446468/TK/49573
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc;
%informasi yang diperlukan
t=0:0.1:10; %array waktu
syms t %deklarasi t
L=100; %panjang
sigma=zeros(1,200); %array sigma
omega=(-L/2:L/2-1)*(2*pi*0.1); %array omega
x=sin(2*pi *t); %isyarat x(t)

%transformasi laplace
X = laplace(x);
X = matlabFunction(X);

%array magnitude
mag=[];
for j=1:length(omega)
    sem=[];
    for k=1:length(sigma)
        s=sigma(k) + 1i*omega(j);
        sem=[sem abs(X(s))];
    end
    mag=[mag ; sem];
end

%plotting Transformasi Laplace (3 dimensi)
figure(1)
mesh(sigma, omega, mag)
title('Plot 3D Frequency Response','fontsize',14)
xlabel('Real Axis ($\sigma$)', 'interpreter', 'latex')
ylabel('Imaginary Axis (j$\omega$)', 'interpreter', 'latex')
zlabel('Magnitude')
ylim([-30 30])