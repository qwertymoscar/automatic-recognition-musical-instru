%*****************************************************%
%**** returns harmonics (frequency and amplitude) ****%
%*****************************************************%

function [peak_points] = getHarmonicFeatures(X, f, loc)
    [points, location] = findpeaks(abs(X));
    %***********************************%
    aboveMax = mod(f(location),f(loc)) == 0;
    %***********************************%
    if any(aboveMax)
        peak_point = [points(aboveMax) location(aboveMax)];
    end
    peak_points = peak_point.';
end