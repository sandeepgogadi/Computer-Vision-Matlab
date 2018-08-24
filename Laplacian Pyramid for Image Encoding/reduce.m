function g = reduce(I)

    % Input:
    % I: the input image
    % Output:
    % g: the image after Gaussian blurring and subsampling


    % 1) Create a Gaussian kernel of size 5x5 and
    % standard deviation equal to 1 (MATLAB command fspecial)

    % 2) Convolve the input image with the filter kernel (MATLAB command imfilter)
    % Tip: Use the default settings of imfilter

    % 3) Subsample the image by a factor of 2
    % i.e., keep only 1st, 3rd, 5th, .. rows and columns

    ker = fspecial('gaussian', [5 5], 1);

    I = imfilter(I, ker, 'conv');

    rows = size(I, 1);
    columns = size(I, 2);
    depth = size(I, 3);

    g = I(1:2:rows, 1:2:columns, :);

end
