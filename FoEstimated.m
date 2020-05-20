%*************************************************%
%*******     PROJET THEMATIQUE TELECOM2     ******%
%*************************************************%

%** AUTHORS  : Mamadou DIAW & Moussa SOW 
%** SUBJECT  : Automatic recognition of a musical instrument
%** TEACHER  : Laurant OUDRE
%** INSTITUT SUP' GALILEE
%** 2029-2020
%** Description
%*****
%*****

clc  ; 
%Cello88 - Cello95 - 
[signal,fe] = audioread('Data/Cello88.wav');
subplot(211);
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
subplot(212);
plot(f,abs(X));

xlim([0,2000]);
xlabel('frequence en hz');
ylabel('|signal(t)|');  
title('tracer de la transformée de fourier');

%*************************************************%
%************Fundamentals and harmonics***********%
%*************************************************%

% get fundamental frequency and its amplitude
[fondamental_frequency, amplitude_max, loc] = getFundamentaleFrequency(X,f);
%display of the fundamental frequency and its amplitude
disp(['Fundamental frequency ',num2str(fondamental_frequency),' => its amplitude is ',num2str(amplitude_max)])

% Détermination des harmoniques

[a_harmonics, f_harmonics] = getHarmonicFeatures(X, f, N, fondamental_frequency);
disp(a_harmonics);
disp(f_harmonics);


% Next Step : rebuilding of the signal 
% This step will allow us to know if the signal is the same
rev = 0;
for k = 1:10
    rev = rev + a_harmonics(k)*sin(2*pi*t*k*f_harmonics(k));
end
soundsc(rev);

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