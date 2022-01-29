


<h1 style="color:#0B615E;  text-align:center; vertical-align: middle; padding:40px 0; margin-top:30px " >Traitement de signal- Analyse spectrale d’un signal Transformée de Fourier discrète</h1>
             </br>

<h4 style="background-color:#F6CEF5" > Réalisé par: OUM KOULTHOUME BOUNOUA </h4>


------------

<h4 style="color:#088A85;"> Objectifs 
  
</h4> •	Représentation de signaux et applications de la transformée de Fourier discrète (TFD) sous Matlab.
</br>
•	Evaluation de l’intérêt du passage du domaine temporel au domaine fréquentiel dans l’analyse et l’interprétation des signaux physiques réels.
 </p>

<ul>
<h3 style="color:#58ACFA";>

<h4> <a href="#rep-id">Représentation temporelle et fréquentielle</a></h4>
 <h4> <a href="#analys-id">Analyse fréquentielle du chant du rorqual bleu</a></h4>
</h3>
</ul>
      
------------
   <h3 style="color:#088A85" id="rep-id" >Représentation temporelle et fréquentielle</h3>
  

Considérons un signal périodique x(t) constitué d’une somme de deux sinusoïdes de fréquences 15Hz et 20Hz.
𝐱(𝐭) = 𝐬𝐢𝐧(𝟐𝝅𝟏𝟓𝒕) + 𝐬𝐢𝐧(𝟐𝝅𝟐𝟎𝒕)

1-	Tracer le signal x(t). Pas de temps : Te = 1/50s, Intervalle : 0, 10-Te.
Pour approximer la TF continue d’un signal x(t), représenté suivant un pas Te, on utilise les deux commandes : fft et fftshif.
<h5 style="color:#FF8000"> Le code</h5>

```Matlab

clear all 
close all
clc

fe=50;
te= 1/50;              %pas de temps 
t=0:te:10-te;          %intervalle
N=length(t);           %le nombre de points constituant le signal x(t).

figure(1);

x=sin(2*pi*10*t)+sin(2*pi*20*t);         %le signal périodique x(t)
subplot(2,3,1);                          %subplot divise la figure et crée des axes à la position spécifiée.
plot(t,x);                               %plot permet de tracer une fonction
title('signal périodique');              % titre de la figure



```
	On remarquera que la TF est une fonction complexe et que la fonction ainsi obtenue décrit la TF de x(t) entre –1/(2Te) et 1/(2Te) par pas de 1/(nTe) où n est le nombre de points constituant le signal x(t).
	La commande fft codant les fréquences positives sur les n/2 premières valeurs du signal et les valeurs négatives entre n/2+1 et n, la commande fftshift permet de les inverser.

2-	Calculer la TFD du signal x(t) en utilisant la commande fft, puis tracer son spectre en amplitude après créer le vecteur f qui correspond à l'échantillonnage du signal dans l'espace fréquentiel. Utilisez la commande abs.

<h5 style="color:#FF8000">Le code</h5>

```Matlab

%Q2 
%la TFD du signal x(t) en utilisant la commande fft


G=fft(x);             %fft calcule une transformée de Fourier Rapide
F=abs(G);             %abs calcule une valeur absolue ou un module dans le cas complexe

j=(0:N-1)*(fe/N);
subplot(2,3,2);
plot(j,F);
title('Transformation de Fourier Discrète');




```

3. Pour mieux visualiser le contenu fréquentiel du signal, utilisez la fonction fftshift, qui effectue un décalage circulaire centré sur zéro du spectre en amplitude obtenu par la commande fft.


<h5 style="color:#FF8000"> le code </h5>

```Matlab

% Q3 
%on utilise la fonction fftshift,Pour mieux visualiser le contenu fréquentiel du signal
%fftshift effectue un décalage circulaire centré sur zéro du spectre en amplitude obtenu par la commande fft.


subplot(2,3,3);
fshift=(-N/2:(N/2)-1)*(fe/N);  
plot(fshift,fftshift(F));               %fftshift réarrange la transformée de Fourier d’un signal
title('Transformation de Fourier Discrète centré à 0 ');



```


Un bruit correspond à tout phénomène perturbateur gênant la transmission ou l'interprétation d'un signal. Dans les applications scientifiques, les signaux sont souvent corrompus par du bruit aléatoire, modifiant ainsi leurs composantes fréquentielles. La TFD peut traiter le bruit aléatoire et révéler les fréquences qui y correspond.

4-	Créez un nouveau signal xnoise, en introduisant un bruit blanc gaussien dans le signal d’origine x(t), puis visualisez-le. Utiliser la commande randn pour générer ce bruit. Il est à noter qu’un bruit blanc est une réalisation d'un processus aléatoire dans lequel la densité spectrale de puissance est la même pour toutes les fréquences de la bande passante. Ce bruit suit une loi normale de moyenne et variance données.


```Matlab

%Q4
%ajout d'un bruit

subplot(2,3,4);
x_noise=x+2.5*randn(size(t));             %randn pour générer un xnoice (bruit)
plot(t,x_noise);
title('signal bruité');




%transformé de Fourier discrète de bruit 

fnoise=abs(fft(x_noise));
subplot(2,3,5);
plot(fshift,fftshift(fnoise.^2));
title('TFD bruit');

```

La puissance du signal en fonction de la fréquence (densité spectrale de puissance) est une métrique couramment utilisée en traitement du signal. Elle est définie comme étant le carré du module de la TFD, divisée par le nombre d'échantillons de fréquence.


5-	Calculez puis tracer le spectre de puissance du signal bruité centré à la fréquence zéro.

```Matlab

%5
%Densité spectrale de puissance 

DS=(fnoise.^2)/N;
subplot(2,3,6);
plot(fshift,fftshift(DS));
title('le spectre de puissance du signal bruité centré à 0 ');

```
<p>
 Malgré le bruit, ont peut constater qu’il est toujours possible de distinguer les fréquences du signal en raison des pics de puissance. En plus, on voit que, entre 0Hz et 15Hz, la densité spectrale de puissance est relativement constante. Ceci est dû au bruit blanc gaussien. 
 
 </p>


<h5 style="color:#FF8000">résultat de la figure(1):</h5>




![résultatsTs](https://user-images.githubusercontent.com/86807424/150336790-b3969528-4103-4257-8450-b7fbd76e3e5a.png)





   <h3 style="color:#088A85" id="analys-id" >Analyse fréquentielle du chant du rorqual bleu</h3>


Il existe plusieurs signaux dont l’information est encodée dans des sinusoïdes. Les ondes sonores est un bon exemple. Considérons maintenant des données audios collectées à partir de microphones sous - marins au large de la Californie. On cherche à détecter à travers une analyse de Fourier le contenu fréquentiel d’une onde sonore émise pas un rorqual bleu.

1-	On a chargé, depuis un fichier ‘bluewhale.mp3’, le sous-ensemble de données qui correspond au chant du rorqual bleu du Pacifique. En effet, les appels de rorqual bleu sont des sons à basse fréquence, ils sont à peine audibles pour les humains. Le son à récupérer correspond aux indices allant de 2.45e4 à 3.10e4.

```Matlab

clear all 
close all
clc

% la commande [w,fs]lit les données du fichier nommé bluewhale
%renvoie des données échantillonnées y, et leur taux d'échantillonnage Fs.
% audioread pour lire le fichier

[y,fs] = audioread('bluewhale.mp3');      

chant=y(2.45e4:3.10e4);
subplot(2,1,1);

```
2-	Ecoutez ce signal en utilisant la commande sound, puis visualisez-le.

```Matlab

%la commande sound pour ecouter l'audio.
soundsc(y,fs);

Nchant=length(chant);
t=[0:Nchant-1]*1/fs;

%visualisez le signal
plot(t,chant);
title('Le signal de bluewhale fichier');

```








https://user-images.githubusercontent.com/86807424/151647704-35cc6840-74ae-4cb4-840c-ecab50f53efa.mp4








La TFD peut être utilisée pour identifier les composantes fréquentielles de ce signal audio. Dans certaines applications qui traitent de grandes quantités de données avec fft, il est courant de redimensionner l'entrée de sorte que le nombre d'échantillons soit une puissance de 2. fft remplit automatiquement les données avec des zéros pour augmenter la taille de l'échantillon. Cela peut accélérer considérablement le calcul de la transformation. </br>
3-	Spécifiez une nouvelle longueur de signal n qui sera une puissance de 2, puis tracer la densité spectrale de puissance du signal.

```Matlab

%3

fshift=[-Nchant/2:(Nchant/2)-1]*(fs/Nchant)/10;

%Densité spectrale de puissance de 2
DSP=abs(fft(chant).^2/Nchant);  

%afficher la courbe 
subplot(2,1,2);
plot(fshift,fftshift(DSP));
title('la densité spectrale de puissance du signal');

```

<p>
On peut Déterminer à partir du tracé, la fréquence fondamentale du gémissement de rorqual 
bleu.
  </p>
  
  




![f](https://user-images.githubusercontent.com/86807424/151027982-d7de6155-7652-4c16-8560-7c2e835f5fa9.png)







--------
 
  
  </div>
