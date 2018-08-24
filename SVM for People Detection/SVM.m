clear all;
clc;

load('ImageDataTrain.mat');
Xtrain=StandardizeData(data.trainX);
Ytrain=data.trainY;

load('ImageDataTest.mat');
Xtest=StandardizeData(data.testX);
Ytest=data.testY;

disp('Linear Kernel')
model = fitcsvm(Xtrain,Ytrain,'KernelFunction','KernelLinear');
[preds,~] = predict(model,Xtest);
accuracy = Accuracy(preds, Ytest)

disp('Polynomial Kernel')
model = fitcsvm(Xtrain,Ytrain,'KernelFunction','KernelPoly');
[preds,~] = predict(model,Xtest);
accuracy = Accuracy(preds, Ytest)

disp('Histogram Intersection Kernel')
model = fitcsvm(Xtrain,Ytrain,'KernelFunction','KernelIntersection');
[preds,~] = predict(model,Xtest);
accuracy = Accuracy(preds, Ytest)
