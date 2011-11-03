output_dir = 'result/';
im = imread('flower.png');

% convert the im into luminance
dim = ndims(im);
if(dim == 3)
    I = rgb2gray(im);
else
    I = im;
end
[row, col] = size(I);

% convert the image to double
%if(~isa(I, 'double'))
    %I = double(I);
%end

for i = 1:7,
    s = 2 * i + 1;

    Imax = ordfilt2(I, s*s, true(s));
    Imin = ordfilt2(I, 1, true(s));
    ImaxS = ordfilt2(I, s*s-s+1, true(s));
    IminS = ordfilt2(I, s, true(s));

    imwrite(Imax, [output_dir 'max' num2str(s) '_all.png'])
    imwrite(Imin, [output_dir 'min' num2str(s) '_all.png'])

    imwrite(ImaxS, [output_dir 'max' num2str(s) '_top' num2str(s) '.png'])
    imwrite(IminS, [output_dir 'min' num2str(s) '_top' num2str(s) '.png'])

    imwrite(ImaxS<=I, [output_dir 'max' num2str(s) '_max' num2str(s) '.png'])
    imwrite(IminS>=I, [output_dir 'min' num2str(s) '_min' num2str(s) '.png'])
end

exit();
