function g = expand(I)

    % Input:
    % I: the input image
    % Output:
    % g: the image after the expand operation


    % 1) Create the expanded image.
    % The new image should be twice the size of the original image.
    % So, for an n x n image you will create an empty 2n x 2n image
    % Fill every second row and column with the rows and columns of the original image
    % i.e., 1st row of I -> 1st row of expanded image
    %       2nd row of I -> 3rd row of expanded image
    %       3rd row of I -> 5th row of expanded image, and so on

    % 2) Create a Gaussian kernel of size 5x5 and
    % standard deviation equal to 1 (MATLAB command fspecial)

    % 3) Convolve the input image with the filter kernel (MATLAB command imfilter)
    % Use the default settings of imfilter
    % multiply the output of the filtering with a factor of 4

    rows = size(I,1);
    columns = size(I,2);
    depth = size(I,3);

    g = zeros([2*rows 2*columns depth]);
    g(1:2:2*rows, 1:2:2*columns, :) = I;

    ker = fspecial('gaussian', [5 5], 1);
    g = imfilter(g, ker, 'conv');
    g = g*4;

end
