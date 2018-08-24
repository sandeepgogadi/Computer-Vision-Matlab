function Ic = ImageCarving(N)

% N: number of vertical seams you have to remove


% read image
I = im2double(imread('waterfall.png'));
[mrows, mcols, depth] = size(I);

% get grayscale image
Ig0 = rgb2gray(im2double(I));

% colored image
Ic = I;

for iIter = 1:N

    Ig = rgb2gray(Ic);
    Gx = imfilter(Ig,.5*[-1 0 1],'replicate');
    Gy = imfilter(Ig,.5*[-1 0 1]','replicate');
    E = abs(Gx) + abs(Gy); % energy

    V = zeros(size(Ig)); % cumulative energy, Value function

    P = V; % Path

    [rows, cols] = size(Ig);

    for i=1:rows
        for j=1:cols
            if i==1
                V(i,j) = E(i,j);
                P(i,j) = 0;
            else
                A = [1, 1, 1]*1000;
                for idx = -1:1
                    if j+idx > 0 & j+idx < cols+1
                        A(idx+2) = V(i-1, j+idx);
                    end
                end
                [minV, Ind] = min(A);
                V(i,j) = E(i,j) + minV;
                P(i,j) = Ind - 2;
            end
        end
    end


    C = zeros(mrows, mcols-iIter, depth);

    A = V(rows, :);
    [minV, j] = min(A);
    idx = P(rows, j);
    C(rows, 1:j-1, :) = Ic(rows, 1:j-1, :);
    C(rows, j:mcols-iIter, :) = Ic(rows, j+1:cols, :);

    for i=rows-1:-1:1
        j = j + idx;
        C(i, 1:j-1, :) = Ic(i, 1:j-1, :);
        C(i, j:mcols-iIter, :) = Ic(i, j+1:cols, :);
        idx = P(i, j);
    end

    Ic = C;

end


figure(1),imshow(I);
figure(2),imshow(Ic);

end
