im = imread('../images/flower.jpg');
output = localExtrema(im);

figure; imshow(im); title('original image');
figure; imshow(output); title('smoothed image');
