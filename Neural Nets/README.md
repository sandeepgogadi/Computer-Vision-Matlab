[back to Robotics Playground](https://github.com/sandeepgogadi/Robotics-Playground)

[back to Computer Vision Matlab](https://github.com/sandeepgogadi/Computer-Vision-Matlab)

# Neural Networks

In this project, we will implement the basic components of a standard neural network learning algorithm. Our goal is to train a fully connected neural network for an image classification task. An image classification task requires assigning a particular object category to a given image. We will be considering images that belong to 20 different object classes such as "airplane", "bicycle","car", "sheep", etc.

### Network Initialization

We define a matlab structure to store the parameters and activations/hidden nodes of a fully connected neural network. Every layer in the fully connected network can be parameterized as a weight matrix. For instance, a network with two fully connected layers will have two matrices storing the parameters of such a network. The dimensions of these matrices will be determined by the number of hidden nodes in the adjacent layers of the network. For instance, if a layer *l* has *k* hidden nodes, and a layer *l+1* has *p* hidden nodes, then the parameter matrix between these two layers will have the *pxk* dimensions .

### Forward Propagation

We will implement a neural net's capability to propagate a given input all the way to its last layer. We will refer to this procedure as a forward pass inside a neural network. At every fully connected layer, we will need to do two things:
1. Perform a matrix multiplication between the activation nodes in layer and the fully connected layer parameters to get the new activation units.
2. Apply a non-linear sigmoid function on a given input to get activation units.

### Backward Pass

We will implement a neural net's capability to propagate the error gradients from the last layer all the way to the first layer. We will refer to this procedure as a backward pass inside a neural network. At every fully connected layer l, we will need to do four things:
1. Compute the derivative of a non-linear sigmoid function.
2. Use the error gradients coming from layer *l+1* to compute the error gradients at the current layer *l*.
3. Use previous two values to compute derivative with respect to activation units *z{i}*.
4. Finally, we need to compute the error gradients with respect to the fully connected layer parameters.

### Training

![alt text](https://github.com/sandeepgogadi/Computer-Vision-Matlab/blob/master/Neural%20Nets/training.png "training")

### Prediction

Finally, in the last part, we will implement a prediction mechanism for our trained neural network. Our final goal is to predict one of 20 object classes for each feature vector. Thus, the output of our prediction function must be a number between 1 and 20 indicating a predicted object class for a given data point.
