function M = ImageMorphingTriangulation(warp_frac,dissolve_frac)

if nargin < 1
    warp_frac = .5;
end

if nargin < 2
    dissolve_frac= warp_frac;
end

% read images
I = im2double(imread('a.png'));
J = im2double(imread('c.png'));

% load mat file with points, variables Ip,Jp
load('points.mat');

% initialize ouput image (morphed)
M = zeros(size(I));

%  Triangulation (on the mean shape)
MeanShape = (1/2)*Ip+(1/2)*Jp;
TRI = delaunay(MeanShape(:,1),MeanShape(:,2));

% number of triangles
TriangleNum = size(TRI,1);

% find coordinates in images I and J
CordInI = zeros(3,3,TriangleNum);
CordInJ = zeros(3,3,TriangleNum);

for i =1:TriangleNum
  for j=1:3

    CordInI(:,j,i) = [ Ip(TRI(i,j),:)'; 1];
    CordInJ(:,j,i) = [ Jp(TRI(i,j),:)'; 1];

  end
end

% create new intermediate shape according to warp_frac
Mp = (1-warp_frac)*Ip+warp_frac*Jp;

% create a grid for the morphed image
[x,y] = meshgrid(1:size(M,2),1:size(M,1));

% for each element of the grid of the morphed image, find  which triangle it falls in
TM = tsearchn([Mp(:,1) Mp(:,2)],TRI,[x(:) y(:)]);


CordInM = zeros(3,3,TriangleNum);

for i =1:TriangleNum
  for j=1:3

    CordInM(:,j,i) = [ Mp(TRI(i,j),:)'; 1];

  end
end

Pix_in_all_triangles = [];
I_warp_all = [];
J_warp_all = [];
XY_pix = [x(:) y(:)];

for i=1:TriangleNum
  Pix_in_triangle = XY_pix(find(TM == i), :);
  Pix_in_all_triangles = vertcat(Pix_in_all_triangles, Pix_in_triangle);

  Ind_pix_triangle = (horzcat(Pix_in_triangle, ones(size(Pix_in_triangle, 1), 1)))';
  barycentric_coord = CordInM(:, :, i)\Ind_pix_triangle;

  I_warp = round(CordInI(:, :, i)*barycentric_coord);
  I_warp_all = horzcat(I_warp_all, I_warp);

  J_warp = round(CordInJ(:, :, i)*barycentric_coord);
  J_warp_all = horzcat(J_warp_all, J_warp);

end

IndI1 = sub2ind([size(I, 1) size(I, 2)], I_warp_all(2, :), I_warp_all(1, :));
IndJ1 = sub2ind([size(J, 1) size(J, 2)], J_warp_all(2, :), J_warp_all(1, :));
IndM1 = (sub2ind([size(M, 1) size(M, 2)], Pix_in_all_triangles(:, 2), Pix_in_all_triangles(:, 1)))';

IndI2 = IndI1 + (size(I,1)*size(I,2));
IndI3 = IndI2 + (size(I,1)*size(I,2));

IndJ2 = IndJ1 + (size(J,1)*size(J,2));
IndJ3 = IndJ2 + (size(J,1)*size(J,2));

IndM2 = IndM1 + (size(M,1)*size(M,2));
IndM3 = IndM2 + (size(M,1)*size(M,2));

IndI = [IndI1; IndI2; IndI3];
IndJ = [IndJ1; IndJ2; IndJ3];
IndM = [IndM1; IndM2; IndM3];

% cross-dissolve
M(IndM)=(1-dissolve_frac)* I(IndI)+ dissolve_frac * J(IndJ);

figure(100);
subplot(1,3,1);
imshow(I);
hold on;
triplot(TRI,Ip(:,1),Ip(:,2))
hold off;
title('First')

subplot(1,3,2);
imshow(M);
hold on;
triplot(TRI,Jp(:,1),Jp(:,2))
hold off
title('Morphed')

subplot(1,3,3);
imshow(J);
hold on;
triplot(TRI,Jp(:,1),Jp(:,2))
hold off
title('Second')

end
