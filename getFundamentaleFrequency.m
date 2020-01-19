%*****************************************************%
%*returns the fondamental frequency and its amplitude*%
%*****************************************************%

function [fondamental_frequency, amplitude_max] = getFundamentaleFrequency(X,f)
    [amplitude_max,location_max] = max(abs(X));
    fondamental_frequency = abs(f(location_max));
end