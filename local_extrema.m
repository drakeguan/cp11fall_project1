output_dir = 'result/';
im = imread('flower.png');

%% convert the im into luminance
yiq = rgb2ntsc(im);

% convert the image to double
Y = yiq(:, :, 1);
Y = double(Y/255.0);
[row, col] = size(Y);

for i = 1:3,
    s = 2*i + 1;
    disp(['start processing with scale of ' num2str(s)]);

    %Imax = ordfilt2(Y, s*s, true(s));
    %imwrite(Imax, [output_dir 'max' num2str(s) '_all.png']);

    %Imin = ordfilt2(Y, 1, true(s));
    %imwrite(Imin, [output_dir 'min' num2str(s) '_all.png']);

    ImaxS = ordfilt2(Y, s*s-s+1, true(s));
    Imax_extrema = ImaxS <= Y;
    %imwrite(ImaxS, [output_dir 'max' num2str(s) '_top' num2str(s) '.png']);
    imwrite(Imax_extrema, [output_dir 'max' num2str(s) '_max' num2str(s) '.png']);

    IminS = ordfilt2(Y, s, true(s));
    Imin_extrema = IminS >= Y;
    %imwrite(IminS, [output_dir 'min' num2str(s) '_top' num2str(s) '.png']);
    imwrite(Imin_extrema, [output_dir 'min' num2str(s) '_min' num2str(s) '.png']);

    Icolor(:, :, 1) = Y;
    Icolor(:, :, 2) = yiq(:, :, 1);
    Icolor(:, :, 3) = yiq(:, :, 2);
    Icolor(:, :, 4) = yiq(:, :, 3);

    disp(['    ' 'generating local maximum envelop']);
    Imax = getColorExact(Imax_extrema, Icolor);

    disp(['    ' 'generating local minimum envelop']);
    Imin = getColorExact(Imin_extrema, Icolor);

    disp(['    ' 'blending local maximum/minimum to get the result']);
    Imean = (Imax(:,:,2:4)+Imin(:,:,2:4))/2;
    im2 = ntsc2rgb(Imean);

    figure;
    imshow(im2, 'Border', 'tight');
end
