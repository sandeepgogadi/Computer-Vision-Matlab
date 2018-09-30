[back to Robotics Playground](https://github.com/sandeepgogadi/Robotics-Playground)

[back to Computer Vision Matlab](https://github.com/sandeepgogadi/Computer-Vision-Matlab)

# Poisson Image Editing

This project focuses on the gradient domain blending based on poisson equation. The goal of this part is to create a blended image that is partially cloned from the source image. We can learn the application of poisson equation and how to solve a sparse linear system. We will follow the technique described in the following paper:"Poisson Image Editing", Perez, P., Gangnet, M., Blake, A. SIGGRAPH 2003

### Mixing Gradients

It discusses the mixing gradients method in section 3, The goal is seamlessly blend two images together automatically given the blending region. As shown in the figure 1, the red line mark the blending region.

Let’s first define the image we’re changing as the target image, the image we’re cutting out and pasting as the source image, the pixels in target image that will be blended with source image as the replacement pixels. The key idea of the gradient domain blending is to apply a so-called guidance vector field v, which might be or not the gradient field of a source function g, to the target image’s replacement pixels, but keep other pixels.

With the importing gradients method, no trace of the destination image is kept inside Ω. However, there are situations where it is desirable to combine properties of with those of g, for example to add objects with holes, or partially transparent ones, on top of a textured or cluttered background. According to the mixing gradients approach, at each point of Ω, we retain the stronger of the variations in or in g.

The replacement pixels intensity are solved by the linear system. But not all the pixels in target image need to be computed. Only the pixels mask as 1 in the mask image will be used to blend. In order to reduce the number of calculations, you need to index the replacement pixels so that each element in x  represents one replacement pixel.

![alt text](https://github.com/sandeepgogadi/Computer-Vision-Matlab/blob/master/Poisson%20Image%20Editing/output.png "Mixing Gradients")

### Texture Flattening

The paper discusses the texture flattening method in section 4.

In the previous part of this project, the guidance field depended, partly or wholly, on the gradient field of a source image g. Alternatively, in-place image transformations can be defined by using a guidance field depending entirely on the original image (target image).  In the texture flattening approach, the image gradient  is passed through a sparse sieve that retains only the most salient features:

![alt text](https://github.com/sandeepgogadi/Computer-Vision-Matlab/blob/master/Poisson%20Image%20Editing/output2.png "Texture Flattening")
