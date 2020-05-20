%*****************************************************%
%**** returns harmonics (frequency and amplitude) ****%
%*****************************************************%

function [a_harmonics, f_harmonics] = getHarmonicFeatures(X, f, N, fondamental_frequency)

    amplitude_h = [];
    f_harmonics = [];
    a_harmonics = [];
    fondamental_frequency_2 = fondamental_frequency/2;
    fondamental_frequency_3 = fondamental_frequency/3;
    % This allows us to know if the fundamental frequency is exactly what
    % we have determined
    indx_2 = find( abs(f-fondamental_frequency_2) < 0.5);
    indx_3 = find( abs(f-fondamental_frequency_3) < 0.5);
    a =  sum(abs(X(indx_2)));
    b =  sum(abs(X(indx_3)));
    %disp(a);
    
    if(b > a && b>0.0019)
        fondamental_frequency = fondamental_frequency_3;
    elseif(a>b && a >0.003)
        fondamental_frequency = fondamental_frequency_2;
    end
    
    for i = 1:N
        indice = find( abs(f-i*fondamental_frequency) < 0.5);
        amplitude_h(i) = sum(abs(X(indice)));
    end
    
    % We want to use rev variable for rebuilding the signal
    %rev = 0;
    for k=1:10
        a_harmonics = [a_harmonics, amplitude_h(k)];
        %rev = rev + amplitude_h(i)*sin(2*pi*k*fondamental_frequency);
    end
    
    for k = 1:10
        f_harmonics = [f_harmonics, k*fondamental_frequency];
    end
end