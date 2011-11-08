
inputPath = 'input_images/';
outputPath = 'result/';

filters = {
    'wlsFilter' 'C';
    'bilateralFilter' 'C, [], 0, 1, 10, 0.2';
    'localExtrema' 'C, 11';
    'domainTransform' 'C, 60, 0.4';
};
images = {'flower', 'rock2'};
%images = {'flower'};

% update/add path
for j=1:size(filters(:, 1))
    addpath(filters{j, 1});
end

% for each image
for i=1:size(images, 2)
    filename = [inputPath images{1, i} '.jpg'];
    I = double(imread(filename))/255;
    G = rgb2gray(I);
    YIQ = rgb2ntsc(I);
    Y = YIQ(:, :, 1);
    [height, width, channel] = size(I);

    figure; 
    imshow(I); 
    title(['input image: ' filename]);

    % for each filter
    for j=1:size(filters(:, 1))
        expression = sprintf('%s(%s)', filters{j, 1}, filters{j, 2});
        disp(['>> processing... ' expression]);

        % for each channel/component in input image
        for k=1:channel
            % ex, localExtrema(I, 3)
            C = I(:, :, k);
            M(:, :, k) = eval(expression);
        end
        D = I - M;

        % write out the smoothed/base image
        imwrite(M, [outputPath images{1, i} '_smoothed_by_' filters{j, 1} '.jpg'], 'Quality', 95);
        % write out the detail layer
        imwrite(D+0.5, [outputPath images{1, i} '_detail_by_' filters{j, 1} '.jpg'], 'Quality', 95);

        % show the smoothed image
        figure; 
        imshow(M); 
        title(['smoothed image (' filename ') by ' expression]);

        % show the detail layer
        figure; 
        imshow(D+0.5); 
        title(['detail layer (' filename ') by ' expression]);

        % plot the original, base(smoothed) and detail layer in a randomly picked row
        row = floor(height/3);
        figure; 
        plot(1:width, I(row,:,1), 1:width, M(row,:,1), 1:width, D(row,:,1), 'LineWidth', 2);
        title(['plot of original, base and detail (' filename ') by ' expression]);
        % write out the plot
        print('-djpeg95', [outputPath images{1, i} '_plot_IMD_by_' filters{j, 1} '.jpg']);
    end
end
