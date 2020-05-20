%*************************************************%
%*******     PROJET THEMATIQUE TELECOM2     ******%
%*************************************************%

%** AUTHORS  : Mamadou DIAW & Moussa SOW 
%** SUBJECT  : Automatic recognition of a musical instrument
%** Bartlett.m

clc  ; 
clear; 

signal = audioread("./Data/Cello82.wav"); 
N = length(signal);

bart(signal,N/100); 
function Px = bart(x,K)
    N = length(x);
    L = floor(N/K);
    Px = 0;
    n1 = 1;
    for i=1:K
        Px = Px + periodogram(x(n1:n1+L-1))/K;
        n1 = n1 + L; 
        %plot(n1); 
    end
    plot(10*log(Px));
    xlim([0,1000])
    ylim([-150,-80])
end 

% objectif moyenner le périodogramme 
% principe de Bartlett éviter que le recouvrement du signal discret. 
% en partition ce signal en K séquence N = K*L 
% N=K/L : reste à determiner 