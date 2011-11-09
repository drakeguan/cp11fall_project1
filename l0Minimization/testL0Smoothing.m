Im = imread('pflower.jpg');
S = L0Smoothing(Im,0.01);
figure, imshow(S);
