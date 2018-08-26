load('X.mat');
load('Y.mat');
X=StandardizeData(X);
[train_x, train_y, test_x, test_y] = splitData(X, Y);
nn=TrainNetwork(train_x,train_y);
preds=PredictNetwork(nn,test_x);
accuracy = Accuracy(preds, test_y)
