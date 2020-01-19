%*****************************************************%
%**** returns harmonics (frequency and amplitude) ****%
%*****************************************************%

function [peak_points] = getHarmonicFeatures(X, f, loc)
    fo = abs(f(loc));
    test = fo:fo:3000
    [points, location] = findpeaks(abs(X));
    aboveMax = mod(f(location),fo) == 0;
    %aboveMax = points>0.7*0.035138;
    %***********************************%
    %aboveMax = abs(f(location)) == test;
    %***********************************%
    if any(aboveMax)
        peak_point = [points(aboveMax) location(aboveMax)];
    end
    peak_points = peak_point.';
end