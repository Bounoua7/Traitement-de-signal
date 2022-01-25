clear all 
close all
clc

% la commande [w,fs]lit les données du fichier nommé bluewhale
%renvoie des données échantillonnées y, et leur taux d'échantillonnage Fs.
% audioread pour lire le fichier
[y,fs] = audioread('bluewhale.mp3');      

chant=y(2.45e4:3.10e4);
subplot(2,1,1);

%Q2-
%la commande sound pour ecouter l'audio.
soundsc(y,fs);

Nchant=length(chant);
t=[0:Nchant-1]*1/fs;

%visualisez le signal
plot(t,chant);
title('Le signal de bluewhale fichier');

%3
%la densité spectrale de puissance du signal
fshift=[-Nchant/2:(Nchant/2)-1]*(fs/Nchant)/10;

%Densité spectrale de puissance de 2
DSP=abs(fft(chant).^2/Nchant);  

%afficher la courbe 
subplot(2,1,2);
plot(fshift,fftshift(DSP));
title('la densité spectrale de puissance du signal');
