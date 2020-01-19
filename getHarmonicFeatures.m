%*****************************************************%
%**** returns harmonics (frequency and amplitude) ****%
%*****************************************************%

function [peak_points] = getHarmonicFeatures(X, amplitude_max)
    [points, location] = findpeaks(abs(X));
    %***********************************%`
    %Question : comment va t-on choisir
    %pour détecter les harmoniques
    aboveMax = points>0.7*amplitude_max;
    %***********************************%
    if any(aboveMax)
        peak_point = [points(aboveMax) location(aboveMax)];
    end
    peak_points = peak_point.';
end