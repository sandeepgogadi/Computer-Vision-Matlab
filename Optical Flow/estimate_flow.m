function [u,v] = estimate_flow(I1,I2,wsize)
    %% INPUT:
    %% I1, I2: nxm sequential frames of a video
    %% wsize: (wsize*2 + 1)^2 is the size of the neighborhood used for displacement estimation
    %% OUTPUT:
    %% u,v: nxm flow estimates in the x and y directions respectively

    % Compute the image gradients for the second image
    [I2_x,I2_y] = grad2d(I2);
    % The temporal gradient is the smoothed difference image
    I2_t = gauss_blur(I1-I2);
    % initialize x and y displacement to zero
    u = zeros(size(I2));
    v = zeros(size(I2));

    % loop over all pixels in the allowable range
    for i = wsize+1:size(I2_x,1)-wsize
       for j = wsize+1:size(I2_x,2)-wsize

          % Select the appropriate window
          Ix = I2_x(i-wsize:i+wsize, j-wsize:j+wsize);
          Iy = I2_y(i-wsize:i+wsize, j-wsize:j+wsize);
          It = I2_t(i-wsize:i+wsize, j-wsize:j+wsize);

   	      d = estimate_displacement(Ix,Iy,It);

          u(i,j) = d(1);
          v(i,j) = d(2);

       end
    end
    % use medifilt2 with a 5x5 filter to reduce outliers in the flow estimate
    u = medfilt2(u, [5 5]);
    v = medfilt2(v, [5 5]);

end
