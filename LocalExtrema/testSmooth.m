images = {'../images/flower.jpg', '../images/rock2.jpg'};
for i=1:size(images, 2)
    filename = images{1, i};
    I = double(imread(filename))/255;
    M = localExtrema(I, 7);
    D = I - M;

    figure; imshow(I); title(['original image: ' filename]);
    figure; imshow(M); title(['smoothed image: ' filename]);
    figure; imshow(abs(D)); title(['detail layer: ' filename]);
end
