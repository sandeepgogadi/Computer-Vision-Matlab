[back to]()

[back to]()


# SVM for People Detection

In this project, we will use Support Vector Machines (SVM) model to build a model that can detect if there are people in the image. For instance, we want our model to be able to predict that there are people in the image.

### Standardizing the data

Support Vector Machines (SVMs) are known to be very sensitive to the initial data formatting. Thus, our first task will be to write a function that standardizes the provided feature vectors. More specifically, as an input, your function will take a feature matrix X, where every row in the matrix depicts a particular data point, and every column denotes a specific feature. Such a normalization ensures that the provided features are centered around 0, and that their standard deviation is 1.

Now that we have standardized the data, we are ready to use an SVM model. We will be using Matlab's built in SVM toolbox. Specifically, to train the model we will use the function model = fitcsvm(Xtrain,Ytrain,'KernelFunction','<function_name>') that takes two variables as an input: 1) a feature matrix Xtrain storing all of our training data features, and 2) the ground truth label vector Ytrain storing the true values whether a given image contains a person or not.

### Linear Kernel

This can be implemented as a dot product between the feature vectors.
SVM model using a linear kernel function achieved 89.15% accuracy on the testing dataset.

### Polynomial Kernel

We will be implementing a second-degree polynomial kernel that should produce a slightly better SVM model than the model that we obtained using a linear kernel function.
Accuracy = 89.5%

### Histogram Intersection Kernel

Even though the polynomial kernel function is more complex than the linear kernel function, as indicated by the testing accuracy, it does not make SVM model much more powerful. We will now use a more sophisticated kernel function referred to as the histogram intersection kernel. We will observe that using the histogram intersection kernel to train our SVM model will allow us to obtain a model that performs about 4% better than the previous model.
Accuracy = 93.53%
