clc  ; 
clear ; 
%_-_-_-_-_-_-_- Projet thematique TELECOM2 _-_-_-_-_-_-_-%
% Author   : Mamadou DIAW & Moussa SOW 
% subject : Reconnaissance automatique d'instrument de mesure 
% teacher : Laurant OUDRE 
%_-_-_-_-_-_ PARTIE 1_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_--%
% ESTIMATION OF THE FUNDAMENTAL FREQUENCY OF A SIGNAL %

[signal,fe] = audioread('Cello82.wav');

subplot(2,1,1);
plot(signal);

N = length(signal);
t=(0:N-1)/fe;
f = (0:N-1)/N *fe;
f(f>=fe/2)=f(f>=fe/2)-fe;
f=fftshift(f);
X = fft(signal)/N;
X=fftshift(X);
%*************************************************%
xlim([10000,11000])
title('tracer du signal de base en fonction du temps');  
subplot(2,1,2);
plot(f,abs(X));

xlim([0,4000]);
xlabel('frequence en hz');
ylabel('|signal(t)|');  
title('tracer de la transformée de fourier');

%*************************************************%
%************Fundamentals and harmonics***********%
%*************************************************%

% getting fundamental frequency and its amplitude
[fondamental_frequency, amplitude_max] = getFundamentaleFrequency(X,f);
% getting features (amplitudes & frequencies) of harmoniques
[peak__points] = getHarmonicFeatures(X, amplitude_max);
%display of the fundamental frequency and its amplitude
disp(['Fundamental frequency ',num2str(fondamental_frequency),' => its amplitude is ',num2str(amplitude_max)])
% display harmonic frequencies and their amplitudes
for p = peak__points
    disp(['Amp ',num2str(p(1)),' a pour fréq ',num2str(f(p(2)))])
end



%*************************************************%
%*********************SUMMARY*********************%
%*************************************************%

% In this part we have seen how to estimation the
% fundamental frequency.
% Firstly we loaded a signal with audioread fonction. 
% After, we calculed its tranformer fourier. 
% And we finished to plot the right signal and her 
% tranformer of fourier
%*****
% We have created two functions (getFundamentalFrequency
% & getHarmonicFeatures) to detect the fundamental 
% and harmonics