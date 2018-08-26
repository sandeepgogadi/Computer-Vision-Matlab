[back to]()
[back to]()

# Optical Flow

The perception of motion and the subsequent formation of an interpretation guides our everyday lives. The ability to determine if an object is moving, judge its speed and direction, and react accordingly is fundamental to our survival. The apparent motion which guides our actions is called optical flow. Since optical flow is determined by time varying image intensities, it is not always consistent with the true motion of objects and surfaces called the motion field. Motion estimation also plays a critical role in a variety of computer vision tasks. While applications such as object tracking, scene reconstruction and image alignment have very different objectives, they all rely to some degree on low-level motion cues.

In this project we will estimate the optical flow between a pair of images via the implementation sketch in video.

Image Gradients:

Calculate image gradients in x and y direction and also compute gaussian smoothing function using gaussian filter.

Estimate Displacement:

Estimate the displacement of a windowed region by computing the least squares solution over several pixels.

Estimate Flow:

Combine your previous solutions to estimate the optical flow estimate over the entire image.

![alt text](https://github.com/sandeepgogadi/Computer-Vision-Matlab/blob/master/Optical%20Flow/output.png "Output image")
