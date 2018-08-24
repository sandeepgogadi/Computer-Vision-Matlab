function ent = pyramident(LC)

    % Input:
    % LC: the quantized version of the images stored in the Laplacian pyramid
    % Output:
    % br: the bitrate for the image given the quantization


    ent = 0;                % initialization of entropy
    [r, c] = size(LC{1});
    pixI = r*c;             % number of pixels in the original image

    for i = 1:numel(LC)

        % 1) Compute the number of pixels at this level of the pyramid
        [rows, cols] = size(LC{i});
        num_pix = rows*cols;

        % 2) Compute the entropy at this level of the pyramid
        % (MATLAB command: entropy)

        e = entropy(LC{i});

        % 3) Each level contributes to the entropy of the pyramid by a
        % factor that is equal to the sample density at this level, times
        % the entropy at this level. The sample density is computed as
        % (number of pixels at this level)/(number of pixels of original image).
        % Add this to the current sum of the entropy 'ent'

        ent = ent + e*(num_pix/pixI);

    end

end
