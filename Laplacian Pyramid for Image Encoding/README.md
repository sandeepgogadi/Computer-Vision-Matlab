[back to]()

[back to Computer-Vision-Matlab](https://github.com/sandeepgogadi/Computer-Vision-Matlab)

# Laplacian Pyramid for Image Encoding

In this project we will use the Laplacian pyramid algorithm for image encoding/compression.

The motivation behind this application, lies in the fact that the Laplacian pyramid stores image differences at high resolutions which are quite predictable, in the sense that the variety of the values is pretty small, with most pixels being concentrated around zero. To capitalize on that, it was proposed by Burt and Adelson to encode these values in a more compact representation, by quantizing the values, requiring essentially less bits of information to represent each one of those. This is relevant to the Image Approximation of the second lab, where we were able to compress the image by cutting the high frequencies of the image and storing a low frequency representation. Here the motivation is the same, since we again attempt to compress the image, however, the approach is different, where we do not necessarily cut down the high frequencies, so details of the image can still be visible. Take a look at the result below, where we attempt to compress the image with the two techniques, for approximately the same compression ratio.

![alt text](https://github.com/sandeepgogadi/Computer-Vision-Matlab/blob/master/Laplacian%20Pyramid%20for%20Image%20Encoding/lena.png "Original Image")

For the first part of this project, we will quantize the values of the images (the differences and the low resolution blurred version) stored in the Laplacian pyramid using uniform quantization. While for most images, we assume that the pixel values lie in the interval [0, 255], here we will assume only a small discrete set of these values are available, e.g. {0, 63, 127, 191, 255}, and each pixel will be assigned a value from this discrete set only. Since we limit ourselves in this small set, we lose some accuracy in our values, but we need much less space to represent the values of each pixel. In the above example, each pixel can take only one of the 5 values, instead of the 256 values that are originally available.

The function *encoding*, takes as input a Laplacian pyramid and encodes it by uniformly quantizing the values of the pixels for the different images.

For the second part, the function *pyramident*, that will compute the entropy for an encoded Laplacian pyramid we provide. Without going into too many details, the entropy of an image is a statistical measure that quantifies the least number of bits required to represent each pixel in the image. If an image has low entropy, then we need less bits to represent it (as in the example of the previous step).

Finally, we will use the example image in the first step of the project and we will use the Laplacian encoding to compress it. We have set a predefined number of bins for each level of the pyramid, but you can select different values and see the effect in the image after the encoding.

For a comparison, we will also leverage code from the second lab, and approximate the image using Fourier transform. We will attempt to keep approximately the same compression rate for this technique, such that we need the same number of bits for each image (notice though that in both cases there are still options to optimize for the compression, although this is beyond the scope of this project).

Proceed with visualizing the results using the script *Laplacian_encoding.m*. You can see the effect that different options have on the SNR of the image, as well as on quantitative aspects of the output (smoothing, high frequency details, noise, etc).
![alt text](https://github.com/sandeepgogadi/Computer-Vision-Matlab/blob/master/Laplacian%20Pyramid%20for%20Image%20Encoding/output.png "Output Image")
