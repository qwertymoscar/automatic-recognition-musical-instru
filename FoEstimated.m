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
clear ;

[signal,fe] = audioread('Flute6.wav');
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

xlim([-5000,5000]);
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

%Get and display harmonic features
disp('Harmonics at k*fo')
[peak_pts] = get_Harmonic_Features__(X, f, loc);
for p = peak_pts
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