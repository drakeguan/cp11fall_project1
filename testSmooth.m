
inputPath = 'images/';
outputPath = 'result/';

filters = {
    'wlsFilter' 'Y';
    'bilateralFilter' 'Y, [], 0, 1, 10, 0.2';
    'localExtrema' 'Y, 11'
};
images = {[inputPath 'flower.jpg'], [inputPath 'rock2.jpg']};

% update/add path
for j=1:size(filters(:, 1))
    addpath(filters{j, 1});
end

for i=1:size(images, 2)
    filename = images{1, i};
    I = imread(filename);
    Y = double(rgb2gray(I))/255;
    [height, width, channel] = size(I);

    for j=1:size(filters(:, 1))
        expression = sprintf('%s(%s)', filters{j, 1}, filters{j, 2});
        % ex, localExtrema(Y, 3)
        M = eval(expression);
        D = Y - M;

        figure; imshow(Y); title(['original image: ' filename]);
        figure; imshow(M); title(['smoothed image: ' filename]);
        figure; imshow(D+0.5); title(['detail layer: ' filename]);

        row = floor(height/3);
        figure; plot(1:width, Y(row,:), 1:width, M(row,:), 1:width, D(row,:), 'LineWidth', 2);
        title(['plot of smoothed result of' filename ' by Y, M and D']);
    end
end
