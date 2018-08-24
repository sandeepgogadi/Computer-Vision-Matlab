function d = estimate_displacement(Ix,Iy,It)
    %% INPUT:
    %% Ix, Iy, It: m x m matrices, gradient in the x, y and t directions
    %% Note: gradient in the t direction is the image difference
    %% OUTPUT:
    %% d: least squares solution


    Ix = Ix';
    Iy = Iy';
    It = It';

    Ix = Ix(:);
    Iy = Iy(:);
    It = -It(:);

    A = [Ix Iy];
    d = pinv(A'*A)*A'*It;
    
    



end
