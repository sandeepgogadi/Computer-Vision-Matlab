function I = PoissonMixingGradients

    % read images
    target= im2double(imread('target_2.jpg'));
    source= im2double(imread('source_2.jpg'));
    mask=imread('mask_2.bmp');

    row_offset=130;
    col_offset=10;

    source_scale=0.6;

    source =imresize(source,source_scale);
    mask =imresize(mask,source_scale);

    % N: Number of pixels in the mask
    N=sum(mask(:));

    % enumerating pixels in the mask
    mask_id = zeros(size(mask));
    mask_id(mask) = 1:N;

    % neighborhood size for each pixel in the mask
    [ir,ic] = find(mask);

    Np = zeros(N,1);

    for ib=1:N

        i = ir(ib);
        j = ic(ib);

        Np(ib)=  double((row_offset+i> 1))+ ...
                 double((col_offset+j> 1))+ ...
                 double((row_offset+i< size(target,1))) + ...
                 double((col_offset+j< size(target,2)));
    end

    % compute matrix A
    A = sparse(N, N);

    for i=1:N
        r = ir(i);
        c = ic(i);

        A(i, mask_id(r,c)) = 4;

        id = zeros(4);
        id(1) = mask_id(r+1,c);
        id(2) = mask_id(r-1,c);
        id(3) = mask_id(r,c+1);
        id(4) = mask_id(r,c-1);

        for j=1:4
            if id(j) ~= 0
                A(i, id(j)) = -1;
            end
          end
    end

    % output intialization
    seamless = target;

    I = get_mixing_gradients(source, target, mask, seamless, A, ir, ic, N, row_offset, col_offset);

    figure(1), imshow(target);
    figure(2), imshow(I);

end
