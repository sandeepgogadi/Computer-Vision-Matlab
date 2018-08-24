[I1, I2, I3, I4] = test_images();

[u1,v1] = estimate_flow(I1,I2,2)
[u2,v2] = estimate_flow(I3,I4,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I1_ = im2double(rgb2gray(imread('parkinglot_left.png')));
I2_ = im2double(rgb2gray(imread('parkinglot_right.png')));

I1_ = imresize(I1_,.25);
I2_ = imresize(I2_,.25);

[u,v] = estimate_flow(I1_,I2_,2);

figure()
subplot(221)
imshow(I1_)
subplot(222)
imshow(I2_)
subplot(223)
imagesc(u)
subplot(224)
imagesc(v)