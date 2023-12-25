%% Rosyiidah Dhiya'Ulhaq
%% 19/446468/TK/49573
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc;
% informasi yang diperlukan
Num=(100);
Den=[1 100];
H=tf(Num, Den);
w=10; 
t=(0:100)/(4*w); 
Vi=10*sin(w*t);

y=lsim(H, Vi, t);
disp(y)

%plotting
figure(1)
subplot(2, 1, 1)
plot(Vi)
xlim([0 100])
title("Input Signal")
xlabel("Time (s)")
ylabel("Amplitude")
subplot(2,1,2)
plot(y)
xlim([0 100])
title("Filtered Signal")
xlabel("Time (s)")
ylabel("Amplitude")

% Bode Plot
figure(2)
bode(H)
grid on