function [Id] = decompress(Fcomp)

    % Input:
    % F: the compressed version of the image
    % Output:
    % Id: the approximated image


    % 1) Apply the inverse FFT shift (MATLAB command ifftshift)

    % 2) Compute the inverse FFT (MATLAB command ifft2)

    % 3) Keep the real part of the previous output

    Id = real(ifft2(ifftshift(Fcomp)));


end
