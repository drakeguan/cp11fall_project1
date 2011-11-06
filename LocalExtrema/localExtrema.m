%
% output = localExtrema(I, k)
%
% Local Extrema filter
%
% I: the input 3-channel image data
% k: the width of neighborhood for idenfication of local minima/maxima

function output = localExtrema(I, k)

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
Smaxima = double(ordfilt2(Y, k*k-k+1, true(k)) <= Y);
Sminima = double(ordfilt2(Y, k, true(k)) >= Y);

Icolor = [];
Icolor(:, :, 1) = Y;
Icolor(:, :, 2) = I(:, :, 1);
Icolor(:, :, 3) = I(:, :, 2);
Icolor(:, :, 4) = I(:, :, 3);

disp('Interpolation of the local minima and maxima to compute minimal and maximal extremal envelopes respectively');
Emaxima = getColorExact(Smaxima, Icolor);
Eminima = getColorExact(Sminima, Icolor);

disp('Computation of the smoothed mean M as the average of the extremal envelopes');
output = (Emaxima(:,:,2:4) + Eminima(:,:,2:4))/2;

