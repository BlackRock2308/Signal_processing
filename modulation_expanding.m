clear all;
close all;
clc;

Fe = 20000;   %fréquence d'échantillonnage 
N = 1024;       %taille de l'échantillon
k = 0:N - 1;
t = k/Fe;           %graduation de l'axe du temps
f1 = 2130;
f2 = 3750;
f3 = 4960;
a1 = 1;
a2 = 1.8;
a3 = 0.9;
x1 = a1*sin(2*pi*f1*t);
x2 = a2*sin(2*pi*f2*t);
x3 = a3*sin(2*pi*f3*t); 
s = x1 + x2 + x3;
sound(s);

%% Calcule de la transformée de fourier du signal
f = k*Fe/N;    %graduation de l'axe des fréquences
TFs = abs(fft(s));

%% plot the original signal

figure (1);subplot(2,1,1);plot(t,s,'');
title('Génération du signal s(t)');
xlabel('Temps [s]');
ylabel('Amplitudes');
figure(1);subplot(2,1,2);plot (f, TFs,'');
title('Transformée de Fourier du signal s(t)');
xlabel('Fréqunce [Hz]');
ylabel('Amplitudes M(f)');
grid

%% Compression of the original signal with mu-law and A-law
L = 16;
law_param = 255;
V = max(s);
compressed_mu = compand(s,law_param, V,'mu/compressor');
[index_mu,quants_mu,distor_mu] = quantiz(compressed_mu, multithresh(s,L),[multithresh(s,L) V]);
sound(compressed_mu);
figure(2); subplot(2,1,1); plot(t,compressed_mu,'');
title('compressed signal with mu-law');
xlabel('Temps [s]');
ylabel('Amplitudes');
compressed_A = compand(s,law_param, V,'A/compressor');
[index_A,quants_A,distor_A] = quantiz(compressed_A, multithresh(s,L),[multithresh(s,L) V]);
%sound(compressed_A);
figure(2); subplot(2,1,2); plot(t,compressed_A,'');
title('compressed signal with A-law');
xlabel('Temps [s]');
ylabel('Amplitudes');

%% plot original signal and compressed signal in the same figure
figure (4);subplot(2,1,1);plot(t,s,'');
title('Génération du signal s(t)');
xlabel('Temps [s]');
ylabel('Amplitudes');
figure(4);subplot(2,1,2); plot(t,compressed_A,'');
title('compressed signal with A-law');
xlabel('Temps [s]');
ylabel('Amplitudes');
grid

%% Expanding the compressed signal
figure (5);subplot(2,1,1);plot(t,s,'');
title('Génération du signal s(t)');
xlabel('Temps [s]');
ylabel('Amplitudes');
expanded_mu = compand(quants_mu, law_param, max(quants_mu), 'mu/expander');
figure(5); subplot(2,1,2); plot(t,expanded_mu,'');
xlabel('expanding signal with mu-law');ylabel('Temps [s]');
%sound(expanded_mu);

%%
%%
figure(6);plot(t,x1,'');
%stem(t,x1);
xlabel('Time sample');
ylabel('Amplitude');
title('x1(t) sequence');

figure(7);plot(t,x2,'');
%stem(t,x2);
xlabel('Time sample');
ylabel('Amplitude');
title('x2(t) sequence');
y = triang(length(t));
figure(8);plot(t,x3,'');
%stem(t,x3);
xlabel('Time sample');
ylabel('Amplitude');
title('x3(t) sequence');

figure(9);plot(t,s,'');
%stem(t,x3);
xlabel('Time sample');
ylabel('Amplitude');
title('Original signal s(t)');
%% multiplexing
figure(10)
y1 = [];

for i=1:length(t)
    y1 = [y1 x1(i) x2(i) x3(i)];
end
stem(y1);
xlabel('Time sample');
ylabel('Amplitude');
title('Time division multiplexing');