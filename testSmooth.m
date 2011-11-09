%
% testing program of several edge-preserving filters
% author: Shuen-Huei (Drake) Guan
% Nov 2011
%

%%%% configurations

% input path for images
inputPath = 'input_images/';

% output path for results
outputPath = 'result/';

% filter list, each is a subfolder name with similar function name, 
% followed by its own parameters
filters = {
    'l0Minimization' 'C, 0.003';
    'wlsFilter' 'C, 1.1, 1.5';
    'bilateralFilter' 'C, [], 0, 1, 10, 0.2';
    'localExtrema' 'C, Y, 17';
    'domainTransform' 'C, 20, 0.4';
    'guidedFilter' 'Y, C, 8, 0.2^2';
};

% image list for testing
images = {'cave-flash', 'cave-noflash', 'flower', 'pflower', 'rock2', 'statue', 'toy', 'tulips'};
%images = {'flower'};

% image enhancement factor/ratio
enc_ratio = 3;

% update/add path
for j=1:size(filters(:, 1))
    addpath(filters{j, 1});
end

% flag to show the result or not
flag_imshow = 0;

% flag to save the result or not
flag_saveimg = 1;



%%%% testing program starts here

% for each image
for i=1:size(images, 2)
    filename = [inputPath images{1, i} '.jpg'];
    I = double(imread(filename))/255;
    G = rgb2gray(I);
    YIQ = rgb2ntsc(I);
    Y = YIQ(:, :, 1);
    [height, width, channel] = size(I);
    disp(['>> processing...' filename]);

    if (flag_imshow)
        figure; 
        imshow(I); 
        title(['input image: ' filename]);
    end

    % for each filter
    for j=1:size(filters(:, 1))
        expression = sprintf('%s(%s)', filters{j, 1}, filters{j, 2});
        disp(['>>   applying the filter ' expression]);

        % for each channel/component in input image
        M = [];
        for k=1:channel
            % ex, localExtrema(I, 3)
            C = I(:, :, k);
            M(:, :, k) = eval(expression);
        end
        D = I - M;
        E = D*enc_ratio + M;

        if (flag_saveimg)
            % write out the smoothed/base image
            imwrite(M, [outputPath images{1, i} '_smoothed_by_' filters{j, 1} '.jpg'], 'Quality', 95);
            % write out the detail layer
            imwrite(D+0.5, [outputPath images{1, i} '_detail_by_' filters{j, 1} '.jpg'], 'Quality', 95);
            % write out the detail-enhanced image
            imwrite(E, [outputPath images{1, i} '_enhanced_by_' filters{j, 1} '.jpg'], 'Quality', 95);
        end

        if (flag_imshow)
            % show the smoothed image
            figure; 
            imshow(M); 
            title(['smoothed image (' filename ') by ' expression]);

            % show the detail layer
            figure; 
            imshow(D+0.5); 
            title(['detail layer (' filename ') by ' expression]);
        end

        % plot the original, base(smoothed) and detail layer in a randomly picked row
        row = floor(height/3);
        if (flag_imshow)
            figure; 
        else
            figure('visible','off');
        end
        plot(1:width, I(row,:,1), 1:width, M(row,:,1), 1:width, D(row,:,1), 'LineWidth', 2);
        title(['plot of original, base and detail (' filename ') by ' expression]);

        if (flag_saveimg)
            % write out the plot
            print('-djpeg95', [outputPath images{1, i} '_plot_IMD_by_' filters{j, 1} '.jpg']);
        end
    end
end
