function snr = compute_snr(I, Id)

    % Input:
    % I: the original image
    % Id: the approximated (noisy) image
    % Output:
    % snr: signal-to-noise ratio


    % 1) Compute the noise image (original image minus the approximation)

    % 2) Compute the Frobenius norm of the noise image

    % 3) Compute the Frobenius norm of the original image

    % 4) Compute SNR

    In = I - Id;
    I_f = norm(I, 'fro');
    In_f = norm(In, 'fro');
    snr = -20*log10(In_f/I_f);

end
