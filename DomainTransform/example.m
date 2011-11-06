I = imread('statue.png');
I = im2double(I);

%% Edge-preserving smoothing example
sigma_s = 60;
sigma_r = 0.4;

% Filter using normalized convolution.
F_nc = NC(I, sigma_s, sigma_r);

% Filter using interpolated convolution.
F_ic = IC(I, sigma_s, sigma_r);

% Filter using the recursive filter.
F_rf = RF(I, sigma_s, sigma_r);

% Show results.
figure, imshow(I); title('Input photograph');
figure, imshow(F_nc); title('Normalized convolution');
figure, imshow(F_ic); title('Interpolated convolution');
figure, imshow(F_rf); title('Recursive filter');
