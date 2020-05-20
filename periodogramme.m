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
clear; 

signal = audioread("Cello82.wav"); 

% Périodogramme 
% subplot(211);
periodogram(signal); 
title('Notre premier périodogramme'); 

function Px = periodogram(signal)
    N=length(signal); 
    Px = abs(fft(signal(1:N),1024)).^2/N;
    plot(10*log10(Px)); 
    xlim([0,1000])
    ylim([-150,-80])
end

%Le périodogramme est une méthode d'estimation de la
% densité spectrale de puissance,
% dans cet premier exemple nous essayons de tarcer la DSP en 
% utilisant fenêtre rectangulaire dans laquelle nous allons faire 
% passer la TFD du signal avant d'estimer la DSP.

% dans la méthode du périodogramme modifié la fenêtre rectangualire 
% sera remplacée par une fenêtre général. 
% l'objectif de ce changement sera étudié à la prochaine étape. 

