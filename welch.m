%*************************************************%
%*******     PROJET THEMATIQUE TELECOM2     ******%
%*************************************************%

%** AUTHORS  : Mamadou DIAW & Moussa SOW 
%** SUBJECT  : Automatic recognition of a musical instrument
%** welch.m

clc  ; 
clear; 

signal = audioread("./Data/Cello82.wav"); 
N = length(signal);

welch_fn(signal,N/100, 1, hamming(N)); 

function Px = welch_fn(x,L,over,win)
    if (over >= 1) | (over < 0)
        error('Overlap is invalid');
    end
    N = length(x);
    n1 = 1;
    n0 = (1-over)*L;
    K = 1+floor((N-L)/n0);
    Px = 0;
    for i=1:K
        Px = Px + mperiodogram(x(n1:n1+L-1),win)/K;
        n1 = n1 + n0;
    end
    plot(10*log(Px));
    xlim([0,1000])
    ylim([-150,-80])
end