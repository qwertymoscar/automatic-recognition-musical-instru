%*************************************************%
%*******     PROJET THEMATIQUE TELECOM2     ******%
%*************************************************%

%** AUTHORS  : Mamadou DIAW & Moussa SOW 
%** SUBJECT  : Automatic recognition of a musical instrument
%** blackman tukey

clc  ; 
clear; 

signal = audioread("./Data/Cello82.wav"); 
L = length(signal);

persmooth(signal,hamming(L), L/2); 


function Px = persmooth(x,win,M)
    N = length(x);
    R = covar(x,M);
    r = fliplr([R(1,2:M), R(1,1), R(1,2:M)]);
    M = 2*M-1;
    w = ones(M,1);
    if (win == 2)
        w = hamming(M);
    elseif (win == 3)
        w = hanning(M);
    elseif (win == 4)
        w = bartlett(M);
    elseif (win == 5)
        w = blackman(M);
    end
    r = r'.*w;
    Px = abs(fft(r,1024));
    plot(10*log(Px));
    xlim([0,1000])
    ylim([-150,-80])
end
