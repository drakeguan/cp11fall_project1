output_dir = 'result/';
im = double(imread('flower.png'))/255;

%% convert the im into luminance
yiq = rgb2ntsc(im);
Y = yiq(:, :, 1);

for i = 1:3,
    s = 2*i + 1;
    disp(['start processing with scale of ' num2str(s)]);

    ImaxS = ordfilt2(Y, s*s-s+1, true(s));
    Imax_extrema = double(ImaxS <= Y);
    %imwrite(ImaxS, [output_dir 'max' num2str(s) '_top' num2str(s) '.png']);
    imwrite(Imax_extrema, [output_dir 'max' num2str(s) '_max' num2str(s) '.png']);

    IminS = ordfilt2(Y, s, true(s));
    Imin_extrema = double(IminS >= Y);
    %imwrite(IminS, [output_dir 'min' num2str(s) '_top' num2str(s) '.png']);
    imwrite(Imin_extrema, [output_dir 'min' num2str(s) '_min' num2str(s) '.png']);

    Icolor = [];
    Icolor(:, :, 1) = Y;
    Icolor(:, :, 2) = im(:, :, 1);
    Icolor(:, :, 3) = im(:, :, 2);
    Icolor(:, :, 4) = im(:, :, 3);

    disp('    generating local maximum envelop');
    Imax = getColorExact(Imax_extrema, Icolor);

    disp('    generating local minimum envelop');
    Imin = getColorExact(Imin_extrema, Icolor);

    disp('    blending local maximum/minimum to get the result');
    Imean = (Imax(:,:,2:4)+Imin(:,:,2:4))/2;

    figure;
    imshow(Imean, 'Border', 'tight');
end
