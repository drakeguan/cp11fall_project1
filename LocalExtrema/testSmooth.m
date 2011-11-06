I = imread('../images/flower.jpg');
M = localExtrema(I, 7);

figure; imshow(I); title('original image: flower');
figure; imshow(M); title('smoothed image: flower');

I = imread('../images/rock2.jpg');
M = localExtrema(I, 7);

figure; imshow(I); title('original image: rock2');
figure; imshow(M); title('smoothed image: rock2');
