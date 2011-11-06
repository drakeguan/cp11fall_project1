%
% [M, Sminima, Smaxima, Eminima, Emaxima, D] = localExtrema(I, k)
%
% Local Extrema filter
%
% I: the input 3-channel image data
% k: the width of neighborhood for idenfication of local minima/maxima
%
% M: smoothed image (base)
% Sminima: local minima extrema
% Smaxima: local maxima extrema
% Eminima: extermal envelope of minima extrema
% Emaxima: extremal envelopes of maxima extrema
% D: detail layer := I - M
%
% author: Shuen-Huei (Drake) Guan
%

function [M, Sminima, Smaxima, Eminima, Emaxima, D] = localExtrema(I, k)

if (ndims(I) ~= 3)
    error( 'I must be a 3-channel image with size [ height, width ]' );
end

if (~isa(I, 'double'))
    I = double(I)/255;
end

if (~exist('k'))
    k = 3;
end

%% convert the I into luminance
yiq = rgb2ntsc(I);
Y = yiq(:, :, 1);

disp('Identiﬁcation of local minima and local maxima of I');
Sminima = double(ordfilt2(Y, k, true(k)) >= Y);
Smaxima = double(ordfilt2(Y, k*k-k+1, true(k)) <= Y);

disp('Interpolation of the local minima and maxima to compute minimal and maximal extremal envelopes respectively');
Icolor = [];
Icolor(:, :, 1) = Y;
Icolor(:, :, 2) = I(:, :, 1);
Icolor(:, :, 3) = I(:, :, 2);
Icolor(:, :, 4) = I(:, :, 3);

Eminima = getColorExact(Sminima, Icolor);
Emaxima = getColorExact(Smaxima, Icolor);

disp('Computation of the smoothed mean M as the average of the extremal envelopes');
M = (Eminima(:,:,2:4) + Emaxima(:,:,2:4))/2;

D = I - M;

