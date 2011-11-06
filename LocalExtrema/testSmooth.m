
inputPath = '../images/';
outputPath = '../result/';

images = {[inputPath 'flower.jpg'], [inputPath 'rock2.jpg']};

for i=1:size(images, 2)
    filename = images{1, i};
    I = double(imread(filename))/255;
    [height, width, channel] = size(I);

    [M, Sminima, Smaxima, Eminima, Emaxima, D] = localExtrema(I, 7);

    figure; imshow(I); title(['original image: ' filename]);
    figure; imshow(M); title(['smoothed image: ' filename]);
    figure; imshow(abs(D)); title(['detail layer: ' filename]);

    row = floor(height/3);
    figure; plot(1:width, I(row,:,1), 1:width, M(row,:,1), 1:width, D(row,:,1), 'LineWidth', 2);
    title(['plot of smoothed result of' filename ' by I, M and D']);
end
