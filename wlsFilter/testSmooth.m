
inputPath = '../images/';
outputPath = '../result/';

images = {[inputPath 'flower.jpg'], [inputPath 'rock2.jpg']};

for i=1:size(images, 2)
    filename = images{1, i};
    I = imread(filename);
    Y = double(rgb2gray(I))/255;
    [height, width, channel] = size(I);

    M = wlsFilter(Y);
    D = Y - M;

    figure; imshow(Y); title(['original image: ' filename]);
    figure; imshow(M); title(['smoothed image: ' filename]);
    figure; imshow(D+0.5); title(['detail layer: ' filename]);

    row = floor(height/3);
    figure; plot(1:width, Y(row,:,1), 1:width, M(row,:,1), 1:width, D(row,:,1), 'LineWidth', 2);
    title(['plot of smoothed result of' filename ' by I, M and D']);
end
