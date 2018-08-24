function I = TextureFlattening

    % read image and mask
    target = im2double(imread('bean.jpg'));
    mask = imread('mask_bean.bmp');

    % edge detection
    Edges = edge(rgb2gray(target),'canny',0.1);
    source = Edges;


    N=sum(mask(:));  % N: Number of unknown pixels == variables

    % enumerating pixels in the mask
    mask_id = zeros(size(mask));
    mask_id(mask) = 1:N;

    row_offset = 0;
    col_offset = 0;

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

    for color=1:3 % solve for each colorchannel

        % compute b for each color
        b=zeros(N,1);

        for ib=1:N

            i = ir(ib);
            j = ic(ib);

            b(ib) = b(ib) + target(row_offset+i-1,col_offset+j,color)*(1-mask(i-1,j)) + target(row_offset+i+1,col_offset+j,color)*(1-mask(i+1,j)) +  target(row_offset+i,col_offset+j-1,color)*(1-mask(i,j-1)) + target(row_offset+i,col_offset+j+1,color)*(1-mask(i,j+1));

            target_main = target(row_offset+i,col_offset+j,color);
            target_1 = target_main - target(row_offset+i-1,col_offset+j,color);
            target_2 = target_main - target(row_offset+i+1,col_offset+j,color);
            target_3 = target_main - target(row_offset+i,col_offset+j-1,color);
            target_4 = target_main - target(row_offset+i,col_offset+j+1,color);

            if Edges(i, j) == 1
                b(ib) = b(ib) + target_1 + target_2 + target_3 + target_4;
            else
                if Edges(i-1,j) == 1
                    b(ib) = b(ib) + target_1;
                end

                if Edges(i+1,j) == 1
                    b(ib) = b(ib) + target_2;
                end

                if Edges(i,j-1) == 1
                    b(ib) = b(ib) + target_3;
                end

                if Edges(i,j+1) == 1
                    b(ib) = b(ib) + target_4;
                end
            end

        end

        % solve linear system A*x = b;
        x = A\b;

        % impaint target image
        for ib = 1:N
            seamless(row_offset+ir(ib),col_offset+ic(ib),color) = x(ib);
        end

    end

    I = seamless;

    figure(1), imshow(target);
    figure(2), imshow(Edges);
    figure(3), imshow(I);

end
