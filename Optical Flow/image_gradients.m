img = imread('peppers.png');
img_gray = double(rgb2gray(img));

smooth = gauss_blur(img_gray);
[I_x,I_y] = grad2d(smooth);