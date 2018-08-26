[back to]()

[back to]()

# Image Morphing

This project focuses on image morphing techniques and specifically, image morphing via triangulation. A morph is a simultaneous warp of the image shape and a cross-dissolve of the image colors. The cross-dissolve is the easy part; controlling and doing the warp is the hard part. The warp is controlled by defining a correspondence between the two pictures. The correspondence maps eyes to eyes, mouth to mouth, chin to chin, ears to ears, etc., to get the smoothest transformations possible.  For the triangulations, we use Delaunay triangulation (see Matlab delaunay). We need to generate only one triangulation and use it on both the point sets. The triangulation should be computed at the midway shape (i.e. mean of the two point sets) to lessen the potential triangle deformations.

We need to write a function that produces a warp between two images using point correspondences. In particular, the two input images I and J are first warped into an intermediate shape configuration controlled by *warp_frac*, and then cross-dissolved according to *dissolve_frac*. For interpolation, both parameters lie in the range [0,1].

Given a new intermediate shape, the main task is to map the image intensity in the original image to this shape. This computation should be done in reverse:

1. For each pixel in the target intermediate shape, determine which triangle it falls inside.(*tsearchn*)
2. Compute the barycentric coordinate for each pixel in the corresponding triangle.
3. Compute the cooresponding pixel position in the source image: using the barycentric equation, but with three corners of the same triangle in the source image and plug in same barycentric coordinate to compute the pixel position.
4. Copy back the pixel value at the original (source) image back to the target (intermediate) image.

![alt text](https://github.com/sandeepgogadi/Computer-Vision-Matlab/blob/master/Image%20Morphing/output.png "Morphed Image")
