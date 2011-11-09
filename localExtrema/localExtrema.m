%
% [M, Sminima, Smaxima, Eminima, Emaxima, D] = localExtrema(I, k)
%
% Local Extrema filter
%
% I: the input image data
% Y: the reference/cross/joint data, default to luminance(I)
% k: the width of neighborhood for idenfication of local minima/maxima
%    default to 3
%
% M: smoothed image (base)
% Sminima: local minima extrema
% Smaxima: local maxima extrema
% Eminima: extermal envelope of minima extrema
% Emaxima: extremal envelopes of maxima extrema
%
% author: Shuen-Huei (Drake) Guan
%

function [M, Sminima, Smaxima, Eminima, Emaxima] = localExtrema(I, Y, k)

dim = ndims(I);
channel = size(I, 3);

if (~isa(I, 'double'))
    I = double(I)/255;
end

if (~exist('Y'))
    %% convert the I into luminance if necessary
    if (channel == 3)
        yiq = rgb2ntsc(I);
        Y = yiq(:, :, 1);
    else
        Y = I;
    end
end

if (~exist('k'))
    k = 3;
end


%disp('    Identiﬁcation of local minima and local maxima of I');
Sminima = double(ordfilt2(Y, k, true(k)) >= Y);
Smaxima = double(ordfilt2(Y, k*k-k+1, true(k)) <= Y);

%disp('    Interpolation of the local minima and maxima to compute minimal and maximal extremal envelopes respectively');
Icolor(:, :, 1) = Y;
for i=1:channel
    Icolor(:, :, i+1) = I(:, :, i);
end

Eminima = getColorExact(Sminima, Icolor);
Emaxima = getColorExact(Smaxima, Icolor);

%disp('    Computation of the smoothed mean M as the average of the extremal envelopes');
M = (Eminima(:,:,2:(channel+1)) + Emaxima(:,:,2:(channel+1)))/2;

