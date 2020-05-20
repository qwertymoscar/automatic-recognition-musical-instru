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
mperiodogram(signal,hamming(length(signal)));
title('Notre périodogramme modifié'); 

function Px = mperiodogram(signal,win);
    N = length(signal);
    w = ones(N,1);
    if (win == 2) 
        w = hamming(N);
    elseif (win == 3) 
        w = hanning(N);
    elseif (win == 4) 
        w = bartlett(N);
     elseif (win == 5) 
         w = blackman(N);
    end
        U = norm(w)^2/N;
        xw = signal(1:N).*w;
        Px = abs(fft(xw,1024)).^2/(N*U);
        plot(10*log10(Px)); 
          xlim([0,1000])
          ylim([-150,-80])
end 

% du côté de la représentation le périodogramme et le périodogramme
% modifié non pas du tout de différence par contre l'idée de changer 
% la fenêtre rectangulaire avec une fenêtre générale permet d'intro
% duire une constante asymtotique non-biaisé. 
% ceci permet d'ajuster la largeur du lobe principal et l'amplitude 
% du lobe adjacent. 
